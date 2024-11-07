//---------------------------------------
// Include UVM macro and package
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
  component_a comp_a;
  component_b comp_b;

  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new(string name = "basic_test",uvm_component parent=null);
    super.new(name,parent);
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
  // Connect_phase 
  //---------------------------------------
  function void connect_phase(uvm_phase phase);

    comp_a.trans_out.connect(comp_b.trans_in_e);
    comp_b.trans_in_e.connect(comp_b_a.trans_in);
    

  endfunction : connect_phase
  
  //---------------------------------------
  // end_of_elobaration phase
  //---------------------------------------  
  virtual function void end_of_elaboration();
    //print's the topology
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
