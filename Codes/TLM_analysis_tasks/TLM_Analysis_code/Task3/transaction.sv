//---------------------------------------
// File: transaction.sv
// Description: Defines the transaction class, which encapsulates data 
//              required for the transaction, including address, read/write control, 
//              and data values, to be exchanged between producer and consumer components.
// Author: Ahmed Raza
// Date: Nov 7, 2024
//---------------------------------------

class transaction extends uvm_sequence_item;
  
  //---------------------------------------
  // Variable Declaration
  // addr   - 4-bit address field
  // wr_rd  - 1-bit read/write indicator (0: read, 1: write)
  // wdata  - 8-bit data field
  //---------------------------------------
  rand bit [3:0] addr;
  rand bit       wr_rd;
  rand bit [7:0] wdata;
  
  //---------------------------------------
  // Utility and Field Macros
  //---------------------------------------
  `uvm_object_utils_begin(transaction)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(wr_rd, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
  `uvm_object_utils_end
  
  //---------------------------------------
  // Constructor
  //---------------------------------------  
  function new(string name = "transaction");
    super.new(name);
  endfunction
endclass
