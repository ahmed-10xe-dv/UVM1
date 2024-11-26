/*-----------------------------------------------------------------
File name     : lab06run.f
Description   : Run file for lab06 UVM simulation
-------------------------------------------------------------------
Instructions  : This file includes interface and package files
                from various folders to simulate the environment.
-------------------------------------------------------------------*/

// 64-bit option required for simulation
// -64

// options
//+UVM_VERBOSITY=UVM_HIGH 
//+UVM_TESTNAME=base_test
//+UVM_TESTNAME=simple_test
//+UVM_TESTNAME=short_yapp_012
//+UVM_TESTNAME=incr_payload_test
//+UVM_TESTNAME=short_packet_test
//+UVM_TESTNAME=exhaustive_seq_test
//+SVSEED=random 
-sverilog


// Include directories for UVM
+incdir+../sv 
+incdir+../../channel/sv
+incdir+../../clock_and_reset/sv
+incdir+../../hbus/sv

// Default timescale
-timescale=1ns/1ns


// Uncomment for GUI
// -gui
// +access+rwc

// Include package files
../sv/yapp_pkg.sv
../../channel/sv/channel_pkg.sv
../../clock_and_reset/sv/clock_and_reset_pkg.sv
../../hbus/sv/hbus_pkg.sv

// Include interface files
../sv/yapp_if.sv
../../channel/sv/channel_if.sv
../../clock_and_reset/sv/clock_and_reset_if.sv
../../hbus/sv/hbus_if.sv

// Additional files
../tb/clkgen.sv       // Clock generator
../tb/tb_top.sv       // Top module for UVM test environment
../tb/hw_top_dut.sv   // Accelerated top module
../../router_rtl/yapp_router.sv // RTL





