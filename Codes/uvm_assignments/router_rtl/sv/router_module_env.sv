/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                   ROUTER MODULE ENV                                 //
//                                                                                     //
// FILE: router_module_env.sv                                                          //
// AUTHOR: Ahmed Raza                                                                  //
// DATE: Nov 20, 2024                                                                  //
//                                                                                     //
// DESCRIPTION:                                                                        //
// This file defines the `router_module_env` class, extending from `uvm_env`.          //
// It includes:                                                                       //
// - Instances of the `router_scoreboard` and `router_reference`.                      //
// - Analysis port connections for passing data between components.                   //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////

class router_module_env extends uvm_env;

    // Register this class with the UVM factory
    `uvm_component_utils(router_module_env)

    ///////////////////////////////////////////////////////////
    // Member Variables
    ///////////////////////////////////////////////////////////

    // Instance of the scoreboard
    router_scoreboard scbd;

    // Instance of the router reference model
    router_reference router_ref;

    ///////////////////////////////////////////////////////////
    // Constructor
    ///////////////////////////////////////////////////////////
    // Initializes the environment
    function new(string name = "router_module_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    ///////////////////////////////////////////////////////////
    // Build Phase
    ///////////////////////////////////////////////////////////
    // Creates instances of components
    function void build_phase(uvm_phase phase);
        super.build_phase(phase); // Call parent class build phase

        // Create scoreboard instance
        scbd = router_scoreboard::type_id::create("scbd", this);

        // Create router reference instance
        router_ref = router_reference::type_id::create("router_ref", this);
    endfunction : build_phase

    ///////////////////////////////////////////////////////ss////
    // Connect Phase
    ///////////////////////////////////////////////////////////
    // Connects analysis ports between components
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase); // Call parent class connect phase

        // Connect valid YAPP packets from reference to scoreboard
        router_ref.valid_yapp.connect(scbd.yapp_port);
    endfunction : connect_phase

endclass : router_module_env
