//---------------------------------------
// component_a.sv
// Description: Producer component that generates and sends transactions
// to the TLM FIFO through a blocking put port.
// Author: Ahmed Raza
// Date: Nov 5, 2024
//---------------------------------------

class component_a extends uvm_component;
  
  transaction trans;
  uvm_blocking_put_port#(transaction) trans_out;  // Blocking put port to send transaction to FIFO
  
  `uvm_component_utils(component_a)
  
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_out = new("trans_out", this);  // Initialize the put port
  endfunction : new

  //---------------------------------------
  // run_phase - Generate and send a transaction
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    trans = transaction::type_id::create("trans", this);

    // Randomize transaction data
    void'(trans.randomize());
    `uvm_info(get_type_name(), $sformatf(" Transaction randomized"), UVM_LOW)
    trans.print();
    
    // Send the transaction through the put port
    `uvm_info(get_type_name(), $sformatf(" Before calling port put method"), UVM_LOW)
    trans_out.put(trans);
    `uvm_info(get_type_name(), $sformatf(" After calling port put method"), UVM_LOW)
    
    phase.drop_objection(this);
  endtask : run_phase

endclass : component_a
