/*-----------------------------------------------------------------
File name     : router_mcsequencer.sv
Developers    : Ahmed Raza
Created       : 20/10/24
Description   : 
Notes         : 
-------------------------------------------------------------------

-----------------------------------------------------------------*/

//------------------------------------------------------------------------------
//
// CLASS: router_mcsequencer
//
//------------------------------------------------------------------------------

class router_mcsequencer extends uvm_sequencer;
	//Component Registration
	`uvm_component_utils(router_mcsequencer)
	
	//Constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction
	
	//Refernce to HBUS and YAPP sequencers
	yapp_tx_sequencer yapp_seqr;
	hbus_master_sequencer hbus_seqr;
	
	
	
	
 function void build_phase(uvm_phase phase);
  yapp_seqr =  yapp_tx_sequencer::type_id::create("yapp_seqr", this);
  hbus_seqr =  hbus_master_sequencer::type_id::create("hbus_seqr", this);
                                                                              
  super.build_phase(phase);
  endfunction : build_phase
	

endclass
