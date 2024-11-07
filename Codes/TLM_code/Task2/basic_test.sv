//---------------------------------------
// basic_test.sv
// Description: This is the top-level test for verifying the connection of TLM Ports and Imps. 
// It instantiates the main components and sets up the connections between them.
// Author: Ahmed Raza
// Date: Nov 5, 2024
//---------------------------------------

`include "uvm_macros.svh"
import uvm_pkg::*;

// Include other component files
`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"
// `include "sub_comp_b_a.sv"

class basic_test extends uvm_test;

  `uvm_component_utils(basic_test)
  
  //---------------------------------------
  // Declare the components
  //---------------------------------------
  component_a comp_a;
  component_b comp_b;
  sub_comp_b_a comp_b_a;

  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  //---------------------------------------
  // build_phase - Create the components
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
    comp_b_a = sub_comp_b_a::type_id::create("sub_comp_b_a", this);
  endfunction : build_phase
  
  //---------------------------------------
  // connect_phase - Connect Ports to Imps
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    comp_a.trans_out.connect(comp_b.trans_in_e);  // Connect component_a output to component_b export
    comp_b.trans_in_e.connect(comp_b_a.trans_in); // Connect component_b export to sub_comp_b_a imp
  endfunction : connect_phase
  
  //---------------------------------------
  // end_of_elaboration phase - Print topology
  //---------------------------------------
  virtual function void end_of_elaboration();
    print(); // Prints the component topology
  endfunction
endclass : basic_test

module tlm_tb;

  //---------------------------------------
  // Initialize Testcase
  //---------------------------------------
  initial begin
    run_test("basic_test");  
  end  
  
endmodule
