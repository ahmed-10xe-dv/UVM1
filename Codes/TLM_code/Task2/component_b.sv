//---------------------------------------
// component_b.sv
// Description: Component B receives the transaction via an export and passes it to sub_comp_b_a.
// Author: Ahmed Raza
// Date: Nov 5, 2024
//---------------------------------------

`include "sub_comp_b_a.sv"

class component_b extends uvm_component;
  
  transaction trans;
  sub_comp_b_a comp_b_a;
  uvm_blocking_put_export#(transaction) trans_in_e;  

  `uvm_component_utils(component_b)
  
  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in_e = new("trans_in_e", this);
  endfunction : new
  
endclass : component_b
