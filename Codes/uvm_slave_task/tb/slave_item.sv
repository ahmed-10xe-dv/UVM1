`ifndef SLAVE_SEQ_ITEM_SV
`define SLAVE_SEQ_ITEM_SV

class slave_item extends uvm_sequence_item; 

  `uvm_object_utils(slave_item)


  // Transaction variables
  logic ready;
  rand logic valid;
  rand logic [3:0] data;


  extern function new(string name = "");

endclass : slave_item 


function slave_item::new(string name = "");
  super.new(name);
endfunction : new


`endif // SLAVE_SEQ_ITEM_SV

