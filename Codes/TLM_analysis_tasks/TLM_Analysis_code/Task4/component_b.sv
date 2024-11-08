//------------------------------------------
// File: component_b.sv
// Author: Ahmed Raza
// Date: November 7, 2024
// Description: Implements the consumer component with an Analysis FIFO.
//              It receives transactions from component_a via the analysis FIFO.
//------------------------------------------

class component_b extends uvm_component;
  
  transaction trans;
  uvm_analysis_imp#(transaction, component_b) analysis_imp;  
  uvm_tlm_analysis_fifo #(transaction) analysis_fifo;

  `uvm_component_utils(component_b)
  
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_imp = new("analysis_imp", this);  // Initializes analysis imp
    analysis_fifo = new("analysis_fifo", this); // Creates analysis FIFO
  endfunction : new
  
  //---------------------------------------
  // Run Phase - Retrieves transaction from FIFO
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    trans = transaction::type_id::create("trans", this);

    // Debug message before and after FIFO get operation
    `uvm_info(get_type_name(), $sformatf("Before calling get method"), UVM_LOW)
    analysis_fifo.get(trans);  // Retrieves transaction from FIFO
    `uvm_info(get_type_name(), $sformatf("After calling get method"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Transaction Details:\n %s", trans.sprint()), UVM_LOW)
    
    phase.drop_objection(this);
  endtask : run_phase

  //---------------------------------------
  // Analysis Imp port write method
  //---------------------------------------
  virtual function void write(transaction trans);
    // Logs receipt of transaction on the analysis imp port
    `uvm_info(get_type_name(), $sformatf("Inside write method. Received trans on Analysis Imp Port"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Printing trans,\n %s", trans.sprint()), UVM_LOW)
  endfunction : write

endclass : component_b
