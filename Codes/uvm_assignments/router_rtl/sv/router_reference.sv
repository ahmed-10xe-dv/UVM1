/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                  ROUTER REFERENCE                                   //
//                                                                                     //
// FILE: router_reference.sv                                                           //
// AUTHOR: Ahmed Raza                                                                  //
// DATE: Nov 20, 2024                                                                  //
//                                                                                     //
// DESCRIPTION:                                                                        //
// This file defines the `router_reference` class, extending from `uvm_component`.     //
// It implements:                                                                     //
// - Two analysis imp objects for YAPP and HBUS monitor analysis ports.                //
// - One analysis port for valid YAPP packets to be sent to the scoreboard.            //
// - Variables for mirroring the `maxpktsize` and `router_en` register fields.         //
// - Write methods for handling packets and updating mirrored variables.               //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////

// Declaring analysis imp macros
`uvm_analysis_imp_decl(_yapp)
`uvm_analysis_imp_decl(_hbus)

class router_reference extends uvm_component;

    // Component utility macro for UVM automation
    `uvm_component_utils(router_reference)

    ///////////////////////////////////////////////////////////
    // Analysis Port and Imp Declarations
    ///////////////////////////////////////////////////////////
    // Analysis imp objects for YAPP and HBUS monitor analysis ports
    uvm_analysis_imp_yapp#(yapp_packet, router_reference) imp_yapp;
    uvm_analysis_imp_hbus#(hbus_transaction, router_reference) imp_hbus;

    // Analysis port for valid YAPP packets
    uvm_analysis_port #(yapp_packet) valid_yapp;

    ///////////////////////////////////////////////////////////
    // Variables
    ///////////////////////////////////////////////////////////
    // Variables to mirror the maxpktsize and router_en register fields
    int maxpktsize;
    bit router_en;

    // Counter for invalid packets
    int invalid_packets;

    ///////////////////////////////////////////////////////////
    // Constructor
    ///////////////////////////////////////////////////////////
    // Constructor for UVM automation and port initialization
    function new(string name, uvm_component parent);
        super.new(name, parent);
        imp_yapp = new("imp_yapp", this);
        imp_hbus = new("imp_hbus", this);
        valid_yapp = new("valid_yapp", this);
    endfunction : new

    ///////////////////////////////////////////////////////////
    // Write Methods
    ///////////////////////////////////////////////////////////

    // Write method for YAPP analysis imp
    // Forwards valid YAPP packets to the scoreboard
    function void write_yapp(yapp_packet y_pkt);
        `uvm_info(get_type_name(), "Inside write_yapp function", UVM_LOW);

        // Check conditions for valid packets
        if (router_en && (y_pkt.length <= maxpktsize) && (y_pkt.addr >= 0 && y_pkt.addr <= 2)) begin
            valid_yapp.write(y_pkt); // Forward valid packet
        end else begin
            invalid_packets++; // Increment invalid packet counter
            `uvm_warning(get_type_name(), "Invalid YAPP packet dropped");
        end
    endfunction : write_yapp

    // Write method for HBUS analysis imp
    // Updates mirrored `maxpktsize` and `router_en` variables based on transactions
    function void write_hbus(hbus_transaction tr);
        `uvm_info(get_type_name(), "Inside write_hbus function", UVM_LOW);

        // Update maxpktsize register
        if (tr.haddr == 16'h1000) begin
            maxpktsize = tr.hdata[5:0];
        end
        // Update router enable register
        else if (tr.haddr == 16'h1001) begin
            router_en = tr.hdata[0];
        end
    endfunction : write_hbus

endclass : router_reference
