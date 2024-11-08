//------------------------------------------
// File: basic_test.sv
// Author: Ahmed Raza
// Date: November 7, 2024
// Description: Defines the basic test case setup for TLM Analysis FIFO,
//              connecting component_a and component_b through an analysis port.
//------------------------------------------

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"

class basic_test extends uvm_test;

  //---------------------------------------
  // Components Instantiation
  //---------------------------------------
  component_a comp_a;
  component_b comp_b;

  `uvm_component_utils(basic_test)

  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  //---------------------------------------
  // build_phase - Creates component instances
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create instances of comp_a and comp_b
    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
  endfunction : build_phase
  
  //---------------------------------------
  // connect_phase - Connects analysis port and FIFO
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    // Connecting comp_a's analysis port to comp_b's analysis FIFO export
    comp_a.analysis_port.connect(comp_b.analysis_fifo.analysis_export);
  endfunction : connect_phase

  //---------------------------------------
  // end_of_elaboration - Prints the component topology
  //---------------------------------------
  virtual function void end_of_elaboration();
    print();  // Print topology
  endfunction : end_of_elaboration
endclass : basic_test


module tlm_tb;

  //---------------------------------------
  // Initial Block - Runs the test case
  //---------------------------------------
  initial begin
    run_test("basic_test");  
  end  
endmodule