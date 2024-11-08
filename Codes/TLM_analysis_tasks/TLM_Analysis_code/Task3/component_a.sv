//---------------------------------------
// File: component_a.sv
// Description: Implements a producer component with a UVM analysis port for sending transactions.
// Author: Ahmed Raza
// Date: Nov 7, 2024
//---------------------------------------

class component_a extends uvm_component;
  
  transaction trans;
  uvm_analysis_port#(transaction) analysis_port;  // Analysis port to send transactions
  
  `uvm_component_utils(component_a)
  
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_port = new("analysis_port", this); 
  endfunction : new

  //---------------------------------------
  // run_phase 
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    // Create and randomize a transaction
    trans = transaction::type_id::create("trans", this);
    void'(trans.randomize());

    // Log the transaction details
    `uvm_info(get_type_name(), $sformatf("Transaction randomized"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Printing transaction:\n %s", trans.sprint()), UVM_LOW)
    
    // Send transaction through analysis port
    `uvm_info(get_type_name(), $sformatf("Calling analysis port write method"), UVM_LOW)
    analysis_port.write(trans);
    `uvm_info(get_type_name(), $sformatf("After calling port write method"), UVM_LOW)
    
    phase.drop_objection(this);
  endtask : run_phase

endclass : component_a
