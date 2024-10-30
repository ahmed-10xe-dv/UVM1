//-------------------------------------------------------------------------------
// Title: UVM Override Mechanism for Animal and Lion Classes
// Author: Ahmed Raza
// Date: October 30, 2024
// Description: This UVM testbench demonstrates the use of type and instance 
// overrides for UVM components. The testbench defines an `animal` class as the 
// base type and a `lion` class derived from `animal`. The goal is to apply 
// various UVM override techniques to selectively replace instances of `animal` 
// with `lion` as specified by run-time arguments.
//
// Instructions (Question):
// 1. Complete the `lion` class by adding registration with the factory, 
//    a constructor, and a `whoami` function.
// 2. Modify the testbench to override `animal_h1` and `animal_h2` instances
//    according to the following conditions:
//    - For +set_inst_override_by_name, `animal_h2` should get overridden with `lion`.
//    - For +set_inst_override_by_type, `animal_h1` should be overridden with `lion`, 
//      while `animal_h2` remains an `animal`.
//    - For +set_type_override_by_name and +set_type_override_by_type, both `animal_h1`
//      and `animal_h2` should get overridden by `lion`.
// 3. Use the given compilation and run commands to validate each override method.


// Instructions to run this file:
// 
// For Synopsys VCS:
// 1. Compile the file:
//      vcs -sverilog -ntb_opts uvm-1.2 uvm_factory.sv
// 2. Run the simulation with different runtime arguments to test each override:
//      ./simv +set_inst_override_by_name
//      ./simv +set_inst_override_by_type
//      ./simv +set_type_override_by_name
//      ./simv +set_type_override_by_type
// 
// For EDA Playground:
// 1. Copy the code into the EDA Playground editor.
// 2. Select "UVM 1.2" from the "UVM / OVM" dropdown menu.
// 3. Add a runtime argument in the "Run Options" box (e.g., +set_inst_override_by_name).
// 4. Choose a simulator and click "Run".


//-------------------------------------------------------------------------------

import uvm_pkg::*;
`include "uvm_macros.svh"

class animal extends uvm_component;
	// Component Factory registration
	`uvm_component_utils(animal)

	// Constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	virtual function void whoami();
		`uvm_info(get_type_name(), "I am an animal", UVM_NONE);
	endfunction: whoami
	
endclass: animal


class lion extends animal;
	// Component Factory registration
	`uvm_component_utils(lion);

	// Constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	// whoami function
	function void whoami();
		`uvm_info(get_type_name(), "I am a lion", UVM_NONE);
	endfunction: whoami

endclass: lion


class test extends uvm_test;
	// Component Factory registration
	`uvm_component_utils(test)

	// Handles for animal instances
	animal animal_h1;
	animal animal_h2;

	// Constructor
	function new(string name = "test", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	// build_phase to configure overrides based on run-time arguments
	function void build_phase(uvm_phase phase);
		uvm_factory factory = uvm_factory::get();
		super.build_phase(phase);

		if($test$plusargs("set_type_override_by_type")) begin
			// Override all `animal` instances with `lion` by type
			factory.set_type_override_by_type(animal::get_type(), lion::get_type(), 1);
			animal_h1 = animal::type_id::create("animal_h1", this);
			animal_h2 = animal::type_id::create("animal_h2", this);
		end

		if($test$plusargs("set_type_override_by_name")) begin
			// Override all `animal` instances with `lion` by name
			factory.set_type_override_by_name("animal", "lion", 1);
			animal_h1 = animal::type_id::create("animal_h1", this);
			animal_h2 = animal::type_id::create("animal_h2", this);
		end

		if($test$plusargs("set_inst_override_by_type")) begin
			// Override only `animal_h1` with `lion` by type, leave `animal_h2` unchanged
			factory.set_inst_override_by_type(animal::get_type(), lion::get_type(), {get_full_name(), ".animal_h1"});
			animal_h1 = animal::type_id::create("animal_h1", this);
			animal_h2 = animal::type_id::create("animal_h2", this);
		end

		if($test$plusargs("set_inst_override_by_name")) begin
			// Override only `animal_h2` with `lion` by name, leave `animal_h1` unchanged
			factory.set_inst_override_by_name("animal", "lion", {get_full_name(), ".animal_h2"});
			animal_h1 = animal::type_id::create("animal_h1", this);
			animal_h2 = animal::type_id::create("animal_h2", this);
		end

		factory.print();
	endfunction: build_phase

	// run_phase to check which instances were overridden
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		animal_h1.whoami();
		animal_h2.whoami();
	endtask: run_phase

endclass: test


module top;
	initial begin
		run_test("test");
	end
endmodule
