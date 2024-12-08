// #############################################################################
// # Top-level Testbench Module
// # ---------------------------------------------------------------------------
// # File Name: tb_top.sv
// # Description: Top-level testbench that instantiates the clock-reset interface,
// #              instruction interface, data interface, and DUT using the DUT interface. 
// #              Configured to support UVM base test hierarchy.
// # Author: Ahmed Raza
// # Date:   25-Nov-2024
// # ---------------------------------------------------------------------------
// # Revision History:
// # ---------------------------------------------------------------------------
// # Rev | Author     | Date       | Changes
// # ---------------------------------------------------------------------------
// # 1.0 | Ahmed Raza | 25-Nov-2024 | Initial creation and setup of tb_top.sv.
// #############################################################################


`include "/inst_uvc/inst_intf.sv"
`include "/data_uvc/data_intf.sv"
`include "dut_intf.sv"

import data_pkg::*;
import inst_pkg::*;
import mem_model_pkg::*;

`include "multiseq/multi_sequencer.sv"
`include "multiseq/multi_seq.sv"
`include "env.sv"
`include "base_test.sv"

//Coverage Files
`include "core_ibex_fcov_if.sv"
`include "core_ibex_fcov_bind.sv"



module tb_top();

  // ###########################################################################
  // # Interface Instantiations
  // ###########################################################################
  // Clock, Reset, Instruction, Data, and DUT interfaces
  bit clk;
  bit rst_n;

  inst_intf  inst_if(.clk(clk));
  data_intf  data_if(.clk(clk));
  dut_intf   dut_if(.clk_i(clk), .rst_ni(rst_n));

    // ###########################################################################
    // # Parameters
    // ###########################################################################
    parameter bit                 PMPEnable        = 1'b0;
    parameter int unsigned        PMPGranularity   = 0;
    parameter int unsigned        PMPNumRegions    = 4;
    parameter int unsigned        MHPMCounterNum   = 0;
    parameter int unsigned        MHPMCounterWidth = 40;
    parameter bit                 RV32E            = 1'b0;
    parameter ibex_pkg::rv32m_e   RV32M            = ibex_pkg::RV32MFast;
    parameter ibex_pkg::rv32b_e   RV32B            = ibex_pkg::RV32BNone;
    parameter ibex_pkg::regfile_e RegFile          = ibex_pkg::RegFileFF;
    parameter bit                 BranchTargetALU  = 1'b0;
    parameter bit                 WritebackStage   = 1'b0;
    parameter bit                 ICache           = 1'b0;
    parameter bit                 ICacheECC        = 1'b0;
    parameter bit                 BranchPredictor  = 1'b0;
    parameter bit                 DbgTriggerEn     = 1'b0;
    parameter int unsigned        DbgHwBreakNum    = 1;
    parameter bit                 SecureIbex       = 1'b0;
    parameter int unsigned        DmHaltAddr       = 32'h1A110800;
    parameter int unsigned        DmExceptionAddr  = 32'h1A110808;

  // ###########################################################################
  // # Clock and Reset Generation
  // ###########################################################################
  always begin
    #5 clk = ~clk; 
  end
  
  // Reset Generation: Active-low reset
 
  initial begin
    rst_n = 0;          // Initialize reset to low
    #20 rst_n = 1;      
  end

  // ###########################################################################
  // # DUT Instantiation
  // ###########################################################################
  ibex_top_tracing #(
    .PMPEnable        (PMPEnable),
    .PMPGranularity   (PMPGranularity),
    .PMPNumRegions    (PMPNumRegions),
    .MHPMCounterNum   (MHPMCounterNum),
    .MHPMCounterWidth (MHPMCounterWidth),
    .RV32E            (RV32E),
    .RV32M            (RV32M),
    .RV32B            (RV32B),
    .RegFile          (RegFile),
    .BranchTargetALU  (BranchTargetALU),
    .WritebackStage   (WritebackStage),
    .ICache           (ICache),
    .ICacheECC        (ICacheECC),
    .BranchPredictor  (BranchPredictor),
    .DbgTriggerEn     (DbgTriggerEn),
    .DbgHwBreakNum    (DbgHwBreakNum),
    .SecureIbex       (SecureIbex),
    .DmHaltAddr       (DmHaltAddr),
    .DmExceptionAddr  (DmExceptionAddr)
) u_ibex_top (
    // Clock and Reset
    .clk_i             (clk),
    .rst_ni            (rst_n),

    // Test Enable and RAM Configuration
    .test_en_i         (),
    .scan_rst_ni       (),
    .ram_cfg_i         (),

    // Boot and Hart ID
    .hart_id_i         (),
    .boot_addr_i       (dut_if.boot_addr_i),

    // Instruction Interface
    .instr_req_o       (inst_if.inst_req_o),
    .instr_gnt_i       (inst_if.inst_gnt_i),
    .instr_rvalid_i    (inst_if.inst_rvalid_i),
    .instr_addr_o      (inst_if.inst_addr_o),
    .instr_rdata_i     (inst_if.inst_rdata_i),
    .instr_err_i       (0),

    // Data Interface
    .data_req_o        (data_if.data_req_o),
    .data_gnt_i        (data_if.data_gnt_i),
    .data_rvalid_i     (data_if.data_rvalid_i),
    .data_we_o         (data_if.data_we_o),
    .data_be_o         (data_if.data_be_o),
    .data_addr_o       (data_if.data_addr_o),
    .data_wdata_o      (data_if.data_wdata_o),
    .data_rdata_i      (data_if.data_rdata_i),
    .data_err_i        (0),

    // Interrupts
    .irq_software_i    (),
    .irq_timer_i       (),
    .irq_external_i    (),
    .irq_fast_i        (),
    .irq_nm_i          (),

    // Debug Interface
    .debug_req_i       (),
    .crash_dump_o      (),

    // Fetch Enable and Alerts
    .fetch_enable_i    (dut_if.fetch_enable_i),
    .alert_minor_o     (),
    .alert_major_o     (),
    .core_sleep_o      ()
);

  // ###########################################################################
  // # Initial Blocks for Simulation Setup
  // ###########################################################################
  initial begin
      $dumpfile("waveform.vcd");
      $dumpvars();  
  end

  initial begin
      $display("Configuring UVM virtual interfaces...");
      // Setting virtual interfaces in UVM configuration database
      uvm_config_db#(virtual dut_intf)::set(null, "*", "vif", dut_if);
      uvm_config_db#(virtual inst_intf)::set(null, "*", "vif", inst_if);
      uvm_config_db#(virtual data_intf)::set(null, "*", "vif", data_if);

      // Starting the base test
      $display("Running UVM test: base_test");
      run_test("base_test");
  end

endmodule




