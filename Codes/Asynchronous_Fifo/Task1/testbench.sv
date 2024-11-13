// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Testbench top module for asynchronous FIFO verification using UVM.
//              This file includes all UVM test components and instantiates the DUT.
// ============================================================================

import uvm_pkg::*;
`include "uvm_macros.svh"

// Parameter definitions for FIFO configuration
parameter FIFO_DATA_WIDTH = 8;
parameter FIFO_MEM_ADDR_WIDTH = 4;
parameter TEST_FLOW_LENGTH = 50;

// UVM sequence item for data transactions
`include "sequence_item.sv"

// Define sequencer for the sequence item type
typedef uvm_sequencer #(sequence_item) sequencer;

// Include all UVM components for testbench
`include "sequence.sv"
`include "driver.sv"
`include "input_flow_monitor.sv"
`include "output_flow_monitor.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "async_fifo_base_test.sv"
`include "async_fifo_bfm.sv"

program test_prog(interface bfm);  // Test program to run the UVM test
  initial begin
    // Configure virtual interface for UVM components
    uvm_config_db #(virtual async_fifo_bfm)::set(null, "*" , "bfm", bfm);
    
    // Start UVM test
    run_test("async_fifo_base_test");
  end
endprogram

module top;

  // Instantiate interface for connecting testbench to DUT
  async_fifo_bfm bfm();

  // Instantiate DUT (FIFO) with connections to testbench signals
  async_fifo #(FIFO_DATA_WIDTH, FIFO_MEM_ADDR_WIDTH) DUT
  (.winc(bfm.winc),
   .wclk(bfm.wclk),
   .wrst_n(bfm.wrst_n),
   .rinc(bfm.rinc),
   .rclk(bfm.rclk),
   .rrst_n(bfm.rrst_n),
   .wdata(bfm.wdata),
   .rdata(bfm.rdata),
   .wfull(bfm.wfull),
   .rempty(bfm.rempty));

  // Instantiate test program with virtual interface
  test_prog tb_prog(bfm);

  initial begin
    // Dump waveform for debugging and analysis
    $dumpfile("fifo_waveform.vcd");
    $dumpvars();
  end
  
endmodule
