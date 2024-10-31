//--------------------------------------------------------------------------------------------------
// File         : uvm_config_db_example.sv
// Author       : Ahmed Raza
// Date         : 31 Oct 2024
// Description  : Implementation of set and get methods using uvm_config_db for parameter passing
//                across UVM components in the testbench hierarchy. The use of wildcards ('*' and '+')
//                in paths is demonstrated. The file is to be run on EDA Playground with the following
//                settings:
//                    - Testbench + Design : systemverilog/verilog
//                    - UVM Version        : UVM 1.2
//                    - Simulator          : Synopsys VCS 2021.09
//                    - Compile Options    : -timescale=1ns/1ns +vcs+flush+all +warn=all -sverilog
//                    - Run Options        : +UVM_VERBOSITY=UVM_MEDIUM +UVM_CONFIG_DB_TRACE
//--------------------------------------------------------------------------------------------------

`include "uvm_macros.svh"

package my_pkg;

  import uvm_pkg::*;

  //----------------------------------------------------------------------------------------------
  // Class my_env1
  // Description: This environment retrieves configuration parameters using uvm_config_db.
  //----------------------------------------------------------------------------------------------
  class my_env1 extends uvm_env;

    `uvm_component_utils(my_env1)
    bit [4:0] parameter2;
    integer parameter1;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
 
    function void end_of_elaboration_phase(uvm_phase phase);
      // Retrieve 'parameter2' and 'parameter1' using the get method from uvm_config_db
      // `parameter2` bit value was set in the test (my_test) and retrieved here.
      // This process leverages uvm_config_db's ability to pass data across testbench hierarchy.
      if (uvm_config_db#(bit [4:0] )::get(null, "uvm_test_top.m_env1", "parameter2", parameter2)) begin
        `uvm_info("Param", $sformatf("Received Parameter 2: %0d", parameter2), UVM_MEDIUM)
      end else begin
        `uvm_warning("Param", "Parameter 2 was not retrieved from the config DB")
      end

      // Retrieve integer 'parameter1' that was set in my_test and is available in my_env1.
      if (uvm_config_db#(integer)::get(null, "uvm_test_top.m_env2", "parameter1", parameter1)) begin
        `uvm_info("Param", $sformatf("Received Parameter 1: %0d", parameter1), UVM_MEDIUM)
      end else begin
        `uvm_warning("Param", "Parameter 1 was not retrieved from the config DB")
      end
    endfunction : end_of_elaboration_phase

  endclass: my_env1
  
  //----------------------------------------------------------------------------------------------
  // Class my_env2
  // Description: Nested environment in the testbench hierarchy that retrieves parameter3.
  //----------------------------------------------------------------------------------------------
  class my_env2 extends uvm_env;

    `uvm_component_utils(my_env2)
    
    my_env1 m_env1;
    integer parameter3;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
 
    function void build_phase(uvm_phase phase);
      m_env1 = my_env1::type_id::create("m_env1", this);

      // Retrieve integer 'parameter3' set in the test using config_db
      if (uvm_config_db#(integer)::get(this, "", "parameter3", parameter3)) begin
        `uvm_info("Param", $sformatf("Received Parameter 3: %0d", parameter3), UVM_MEDIUM)
      end else begin
        `uvm_warning("Param", "Parameter 3 was not retrieved from the config DB")
      end
    endfunction
  endclass: my_env2
  
  //----------------------------------------------------------------------------------------------
  // Class my_test
  // Description: The test class where parameters are set into uvm_config_db for my_env1 and my_env2.
  //----------------------------------------------------------------------------------------------
  class my_test extends uvm_test;
  
    `uvm_component_utils(my_test)
    
    my_env2 m_env2;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
      m_env2 = my_env2::type_id::create("m_env2", this);
     
      // Set integer data (parameter1) for both m_env1 and m_env2, using a wildcard
      // Wildcard path: Using "m_env+" applies to all levels starting with "m_env".
      // Potential Pitfall: Wildcards like '+' can unintentionally pass parameters to unintended components.
      uvm_config_db #(integer) :: set (this, "m_env+", "parameter1", 15); 
      
      // Set bit data (parameter2) only for m_env1
      uvm_config_db #(bit [4:0]) :: set (this, "m_env1", "parameter2", 20); 
      
      // Set integer data (parameter3) only for m_env2
      uvm_config_db #(integer) :: set (this, "m_env2", "parameter3", 10); 
      
    endfunction
   
    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      #10;
      `uvm_info("", "UVM_CONFIG_DB", UVM_MEDIUM)
      phase.drop_objection(this);
    endtask
     
  endclass: my_test
  
  
endpackage: my_pkg

//----------------------------------------------------------------------------------------------
// Top Module
// Description: Calls run_test to start the UVM test with specified name.
//----------------------------------------------------------------------------------------------
module top;

  import uvm_pkg::*;
  import my_pkg::*;
  
  initial
  begin
      run_test("my_test");
  end

endmodule: top
