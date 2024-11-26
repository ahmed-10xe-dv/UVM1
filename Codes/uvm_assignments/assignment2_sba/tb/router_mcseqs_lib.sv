/*-----------------------------------------------------------------
File name     : router_mcseqs_lib.sv
Developers    : Ahmed Raza
Created       : 20/10/24
Description   : 
Notes         : 
-------------------------------------------------------------------

-----------------------------------------------------------------*/

//------------------------------------------------------------------------------
//
// CLASS: router_simple_mcseqs
//
//------------------------------------------------------------------------------

class router_simple_mcseqs extends uvm_sequence;

	//Registration
	`uvm_object_utils(router_simple_mcseqs)
	
	//Constructor
	function new(string name = "router_simple_mcseqs");
		super.new(name);
	endfunction
	
	//Refernce to multichannel sequencer
	`uvm_declare_p_sequencer(router_mcsequencer)
	
	yapp_012_seq y12s;
	six_yapp_seq yss;
	hbus_set_default_regs_seq hsdrs;
	hbus_small_packet_seq hsps;
	hbus_read_max_pkt_seq hrmxps;
	
	
	
	
	task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
    end
  endtask : pre_body
  
  	task body();
  		`uvm_info(get_type_name(), "Starting the Multi Sequencer Body", UVM_LOW)
  		
  		//Small Packets (Payload < 21)
  		hsps = hbus_small_packet_seq::type_id::create("hsps");
  		`uvm_do_on(hsps, p_sequencer.hbus_seqr)
  		
  		//Read the MXPKTSIZE 
  		hrmxps = hbus_read_max_pkt_seq::type_id::create("hrmxps");
		`uvm_do_on(hrmxps, p_sequencer.hbus_seqr) 
		
		//send 6 consecutive yapp packets
		repeat(6) begin 
			y12s = yapp_012_seq::type_id::create("y12s");
			`uvm_do_on(y12s, p_sequencer.yapp_seqr)
		end 
		
		
		 //Large Packets (Payload < 64)
  		hsdrs = hbus_set_default_regs_seq::type_id::create("hsdrs");
  		`uvm_do_on(hsps, p_sequencer.hbus_seqr)
		
  		//Read the MXPKTSIZE 
  		hrmxps = hbus_read_max_pkt_seq::type_id::create("hrmxps");
		`uvm_do_on(hrmxps, p_sequencer.hbus_seqr) 
		
		
		//Random Sequence of six yapp packets
		yss = six_yapp_seq::type_id::create("yss");
		`uvm_do_on(yss, p_sequencer.yapp_seqr)
				
    
  	endtask : body
  

  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
    end
  endtask : post_body
	
endclass
