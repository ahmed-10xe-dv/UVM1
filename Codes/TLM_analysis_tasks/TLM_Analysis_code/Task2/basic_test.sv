//------------------------------------------
// basic_test.sv
// Description: Implements a basic UVM testbench connecting analysis ports of component_a with multiple imp ports of component_b.
// Author: Ahmed Raza
// Date: Nov 5, 2024
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
  component_a comp_a;  // Producer component
  component_b comp_b;  // Consumer component

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

    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
  endfunction : build_phase
  
  //---------------------------------------
  // connect_phase 
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    // Connect analysis_port of component_a to both analysis imp ports in component_b
    comp_a.analysis_port.connect(comp_b.analysis_imp_a);
    comp_a.analysis_port.connect(comp_b.analysis_imp_b);
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
