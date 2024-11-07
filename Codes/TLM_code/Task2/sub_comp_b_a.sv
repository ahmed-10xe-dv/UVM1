//---------------------------------------
// sub_comp_b_a.sv
// Description: Sub-component of B, which receives a transaction through an imp port.
// Author: Ahmed Raza
// Date: Nov 5, 2024
//---------------------------------------

class sub_comp_b_a extends uvm_component;
  
  `uvm_component_utils(sub_comp_b_a)
  
  transaction trans;
  uvm_blocking_put_imp#(transaction, sub_comp_b_a) trans_in; 
   
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in = new("trans_in", this);
  endfunction : new
  
  //---------------------------------------
  // put - Receives the transaction
  //---------------------------------------
  virtual task put(transaction trans);
    `uvm_info(get_type_name(), $sformatf("Received trans on IMP Port"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Printing trans, \n %s", trans.sprint()), UVM_LOW)
  endtask 
  
endclass : sub_comp_b_a
