//------------------------------------------
// File: component_a.sv
// Author: Ahmed Raza
// Date: November 7, 2024
// Description: Producer component that generates and sends transactions
//              through its analysis port to component_b's FIFO.
//------------------------------------------

class component_a extends uvm_component;
  
  transaction trans;
  uvm_analysis_port#(transaction) analysis_port; 
  
  `uvm_component_utils(component_a)
  
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_port = new("analysis_port", this); // Initializes analysis port
  endfunction : new

  //---------------------------------------
  // run_phase - Generates and sends transactions
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    trans = transaction::type_id::create("trans", this);

    // Randomizes transaction data and logs details
    void'(trans.randomize());
    `uvm_info(get_type_name(), $sformatf("Transaction randomized"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Printing trans,\n %s", trans.sprint()), UVM_LOW)
    
    // Writes transaction to analysis port
    `uvm_info(get_type_name(), $sformatf("Before calling port write method"), UVM_LOW)
    analysis_port.write(trans);
    `uvm_info(get_type_name(), $sformatf("After calling port write method"), UVM_LOW)
    
    phase.drop_objection(this);
  endtask : run_phase

endclass : component_a
