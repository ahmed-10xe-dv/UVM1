//---------------------------------------
// basic_test.sv
// Description: Testbench for TLM FIFO example. This testbench connects
// Component A (producer) and Component B (consumer) using a TLM FIFO.
// FIFO is used to buffer transactions between independent processes.
// Author: Ahmed Raza
// Date: Nov 5, 2024
//---------------------------------------

`include "uvm_macros.svh"
import uvm_pkg::*;

//---------------------------------------
// Include other files
//---------------------------------------
`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"

class basic_test extends uvm_test;

  `uvm_component_utils(basic_test)
  
  //---------------------------------------
  // Declare the components
  //---------------------------------------
  component_a comp_a;                    // Producer component
  component_b comp_b;                    // Consumer component
  uvm_tlm_fifo #(transaction) tlm_fifo;  // TLM FIFO for transaction storage

  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  //---------------------------------------
  // build_phase - Create the components and FIFO
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create FIFO with a depth of 2 for buffering transactions
    tlm_fifo = new("tlm_fifo", this, 2);

    // Create producer (comp_a) and consumer (comp_b) components
    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
  endfunction : build_phase
  
  //---------------------------------------
  // connect_phase - Connect FIFO with components
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    comp_a.trans_out.connect(tlm_fifo.put_export); // Connect producer to FIFO
    comp_b.trans_in.connect(tlm_fifo.get_export);   // Connect FIFO to consumer
  endfunction : connect_phase
  
  //---------------------------------------
  // end_of_elaboration - Print testbench topology
  //---------------------------------------  
  virtual function void end_of_elaboration();
    print();
  endfunction
endclass : basic_test

module tlm_tb;

  //---------------------------------------
  // Calling TestCase
  //---------------------------------------
  initial begin
    run_test("basic_test");  
  end  
  
endmodule
