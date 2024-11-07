//---------------------------------------
// component_b.sv
// Description: Consumer component that retrieves transactions from
// the TLM FIFO through a blocking get port and processes them.
// Author: Ahmed Raza
// Date: Nov 5, 2024
//---------------------------------------

class component_b extends uvm_component;
  
  transaction trans;
  uvm_blocking_get_port#(transaction) trans_in;  // Blocking get port to retrieve transaction from FIFO

  `uvm_component_utils(component_b)
  
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in = new("trans_in", this);  // Initialize the get port
  endfunction : new

  //---------------------------------------
  // run_phase - Retrieve and print the transaction
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    trans = transaction::type_id::create("trans", this);
    `uvm_info(get_type_name(), $sformatf(" Before calling get method"), UVM_LOW)
    
    // Retrieve transaction from FIFO
    trans_in.get(trans);
    
    `uvm_info(get_type_name(), $sformatf(" After calling get method"), UVM_LOW)
    trans.print();
    
    phase.drop_objection(this);
  endtask : run_phase

endclass : component_b
