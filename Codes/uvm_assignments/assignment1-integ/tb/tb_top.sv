/*-----------------------------------------------------------------
File name     : tb_top.sv
Developers    : Kathleen Meade, Brian Dickinson
Created       : 01/04/11
Description   : lab06_vif UVM top module for acceleration
              : Instantiates UVM test environment
Notes         : From the Cadence "SystemVerilog Accelerated Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module tb_top;

  // import the UVM library
  import uvm_pkg::*;
  import channel_pkg::*;
  import clock_and_reset_pkg::*;
  import hbus_pkg::*;

  // include the UVM macros
  `include "uvm_macros.svh"

  // import the YAPP UVC package
  import yapp_pkg::*;
  
  // include the router testbench file
  `include "router_tb.sv"
  
   // include the test_lib.sv file
  `include "router_test_lib.sv"

  initial begin
  	$dumpfile("waveform.vcd");
  	$dumpvars();
  end
  
 initial begin
    yapp_vif_config::set(null,"*.tb.yapp.tx_agent.*","vif", hw_top.in0);
    hbus_vif_config::set(null,"*.tb.hb_env.*","vif", hw_top.hb_if);
    clock_and_reset_vif_config::set(null,"*.tb.clk_rst.*","vif", hw_top.clk_and_rst_if);
    channel_vif_config::set(null,"*.chan0.*","vif", hw_top.chan0_if);
    channel_vif_config::set(null,"*.chan1.*","vif", hw_top.chan1_if);
    channel_vif_config::set(null,"*.chan2.*","vif", hw_top.chan2_if);

    run_test("test_uvc_integration");
  end
  

  

endmodule
