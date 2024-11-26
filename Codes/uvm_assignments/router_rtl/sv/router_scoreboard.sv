/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                 ROUTER SCOREBOARD                                   //
//                                                                                     //
// FILE: router_scoreboard.sv                                                          //
// AUTHOR: Ahmed Raza                                                                  //
// DATE: Nov 20, 2024                                                                  //
//                                                                                     //
// DESCRIPTION:                                                                        //
// This file defines the `router_scoreboard` class to verify packet transactions       //
// between YAPP and Channel UVCs. The scoreboard manages packet comparison, maintains  //
// counters, and reports statistics at the end of the simulation.                      //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////

`include "packet_compare.sv"

// Global counters
int total_received_packets = 0; // Total packets received
int total_matched_packets  = 0; // Packets that matched
int total_failed_packets   = 0; // Packets that failed comparison
int total_queue_packets    = 0; // Packets left in queues

// Router Scoreboard Class
class router_scoreboard extends uvm_scoreboard;

   // Register component with UVM factory
   `uvm_component_utils(router_scoreboard)

   // Declare analysis implementations for YAPP and channels
   `uvm_analysis_imp_decl(_ch0)
   `uvm_analysis_imp_decl(_ch1)
   `uvm_analysis_imp_decl(_ch2)
   `uvm_analysis_imp_decl(_yapp)

   // Analysis imp ports
   uvm_analysis_imp_ch0 #(channel_packet, router_scoreboard) ch0_port;
   uvm_analysis_imp_ch1 #(channel_packet, router_scoreboard) ch1_port;
   uvm_analysis_imp_ch2 #(channel_packet, router_scoreboard) ch2_port;
   uvm_analysis_imp_yapp #(yapp_packet, router_scoreboard) yapp_port;

   // Queues for packets
   yapp_packet ch0_queue[$];
   yapp_packet ch1_queue[$];
   yapp_packet ch2_queue[$];

   // Constructor
   function new(string name = "router_scoreboard", uvm_component parent = null);
      super.new(name, parent);

      // Instantiate analysis imp ports
      ch0_port = new("ch0_port", this);
      ch1_port = new("ch1_port", this);
      ch2_port = new("ch2_port", this);
      yapp_port = new("yapp_port", this);
   endfunction

   ///////////////////////////////////////////////////////////
   // Write methods for YAPP and Channel ports
   ///////////////////////////////////////////////////////////

   // Write for YAPP: Push packet into corresponding queue based on address
   function void write_yapp(yapp_packet yp);
      case (yp.addr)
         0: ch0_queue.push_back(yp.clone());
         1: ch1_queue.push_back(yp.clone());
         2: ch2_queue.push_back(yp.clone());
         default: `uvm_warning("INVALID_ADDR", $sformatf("Invalid address: %0d", yp.addr))
      endcase
   endfunction

   // Generic Channel Write: Compare and update counters
   function void write_channel(channel_packet cp, ref yapp_packet queue[$]);
   
   	string channel_id; //Local variable to determine channel name based on addr 
   	case (cp.addr)
   		0: channel_id = "CHANNEL_0";
   		1: channel_id = "CHANNEL_1";
   		2: channel_id = "CHANNEL_2";
   		default: channel_id = "INVALID_CHANNEL";
   	endcase
   		
   		
      if (queue.size() > 0) begin
         yapp_packet yp = queue.pop_front();
         if (comp_equal(yp, cp)) begin
            `uvm_info(channel_id, "Comparison Passed", UVM_LOW)
            total_matched_packets++;
         end else begin
            `uvm_error(channel_id, "Comparison Failed")
            total_failed_packets++;
         end
      end else begin
         `uvm_warning(channel_id, "Queue is empty, no packet to compare.")
      end
      total_received_packets++;
   endfunction

   // Write for Channel 0
   function void write_ch0(channel_packet cp);
      write_channel(cp, ch0_queue);
   endfunction

   // Write for Channel 1
   function void write_ch1(channel_packet cp);
      write_channel(cp, ch1_queue);
   endfunction

   // Write for Channel 2
   function void write_ch2(channel_packet cp);
      write_channel(cp, ch2_queue);
   endfunction

   ///////////////////////////////////////////////////////////
   // Report phase: Summarize results
   ///////////////////////////////////////////////////////////

   function void report_phase(uvm_phase phase);
      super.report_phase(phase);

      // Calculate remaining packets in all queues
      total_queue_packets = ch0_queue.size() + ch1_queue.size() + ch2_queue.size();

      // Report statistics
      `uvm_info(get_type_name(), 
                $sformatf("Total Packets Received    : %0d", total_received_packets), UVM_MEDIUM)
      `uvm_info(get_type_name(), 
                $sformatf("Total Packets Matched     : %0d", total_matched_packets), UVM_MEDIUM)
      `uvm_info(get_type_name(), 
                $sformatf("Total Packets Mismatched  : %0d", total_failed_packets), UVM_MEDIUM)
      `uvm_info(get_type_name(), 
                $sformatf("Packets Left in Queues    : %0d", total_queue_packets), UVM_MEDIUM)
   endfunction

endclass : router_scoreboard

