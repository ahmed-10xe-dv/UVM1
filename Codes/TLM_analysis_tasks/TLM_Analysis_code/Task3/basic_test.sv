//---------------------------------------
// File: basic_test.sv
// Description: This testbench demonstrates the connection of a single analysis 
//              port in component_a to multiple analysis imp ports in two instances 
//              of component_b (comp_b and comp_c), each containing two analysis 
//              imp ports. 
// Task 3: TLM Analysis Port Multi-Component Connection
// Author: Ahmed Raza
// Date: Nov 7, 2024
//---------------------------------------

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"

class basic_test extends uvm_test;

  //---------------------------------------
  // Component Instantiation
  //---------------------------------------
  component_a comp_a;  // Producer component
  component_b comp_b;  // First consumer component (comp_b)
  component_b comp_c;  // Second consumer component (comp_c)

  `uvm_component_utils(basic_test)

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

    // Create instances of component_a, component_b, and component_c
    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
    comp_c = component_b::type_id::create("comp_c", this);
  endfunction : build_phase
  
  //---------------------------------------
  // connect_phase - Connect the analysis port of comp_a 
  // to multiple analysis imp ports of comp_b and comp_c
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    // Connect analysis_port of comp_a to both analysis imp ports in comp_b and comp_c
    comp_a.analysis_port.connect(comp_b.analysis_imp_a);
    comp_a.analysis_port.connect(comp_b.analysis_imp_b);
    comp_a.analysis_port.connect(comp_c.analysis_imp_a);
    comp_a.analysis_port.connect(comp_c.analysis_imp_b);
  endfunction : connect_phase

  //---------------------------------------
  // end_of_elaboration phase
  //---------------------------------------
  virtual function void end_of_elaboration();
    // Print the topology for verification
    print();  
  endfunction 
endclass : basic_test

module tlm_tb;

  //---------------------------------------
  // Testbench Initialization
  //---------------------------------------
  initial begin
    run_test("basic_test");  
  end  
  
endmodule
