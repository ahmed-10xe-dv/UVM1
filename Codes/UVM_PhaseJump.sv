//----------------------------------------------------------------------
// Program: Phase Jump Example
// Author: Ahmed Raza
// Date: October 31, 2024
//
// Description:
// This program demonstrates phase jumping in the UVM framework, showing how to skip a UVM phase from within another phase. 
// Here, we attempt to jump directly from the `build_phase` to `end_of_elaboration_phase`, bypassing the `connect_phase`. 
//
// The concept of phase jumping is crucial for advanced testbench synchronization and allows controlled navigation of UVM phases, 
// although certain limitations apply. For example:
//   - Jumping from a `run_phase` to a `build_phase` is not possible.
//   - Within the `run_phase`, jumping to another `run_phase` is allowed (forward or backward).
//   - From `cleanup_phases`, backward phase jumps are not supported.
//
// This example shows a jump from `build_phase` to `end_of_elaboration_phase`, bypassing the `connect_phase`.
//
//----------------------------------------------------------------------
//
// Compilation and Simulation Instructions:
// 
// In Synopsys VCS:
// Compilation: vcs -sverilog -ntb_opts uvm-1.2 phase_jump.sv
// Simulation: ./simv
//
// In EDA Playground:
// 1. Copy this code into testbench.sv.
// 2. Select UVM 1.2 from the "UVM / OVM" dropdown menu.
// 3. Select your desired simulator and press RUN.
//
//----------------------------------------------------------------------

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_test extends uvm_test;

	// Factory Registration
	`uvm_component_utils(my_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	// The build_phase method
	function void build_phase(uvm_phase phase);
		$display("Inside the build phase");

		// Phase jump: jump directly to `end_of_elaboration_phase` from `build_phase`
		phase.jump(uvm_end_of_elaboration_phase::get());
	endfunction

	// The connect_phase method
	function void connect_phase(uvm_phase phase);
		$display("Inside the connect phase");
	endfunction

	// The end_of_elaboration_phase method
	function void end_of_elaboration_phase(uvm_phase phase);
		$display("Inside the end of elaboration phase");
		uvm_top.print_topology();
	endfunction
endclass: my_test


module top;

	initial begin
		run_test("my_test");
	end

endmodule: top
