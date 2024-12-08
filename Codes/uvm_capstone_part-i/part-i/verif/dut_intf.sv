
// ╔════════════════════════════════════════════════════════════════════╗
// ║                              INTERFACE                             ║
// ║     Author      : Ahmed Raza                                       ║
// ║     Date        : 25 Nov 2024                                      ║
// ║     Description : Interface for ibex_top module to simplify        ║
// ║                   instantiation in tb_top                          ║
// ╚════════════════════════════════════════════════════════════════════╝

interface dut_intf ( input clk_i, input rst_ni);
    //--------------------------------------------------------------------------
    // Core Initialization
    //--------------------------------------------------------------------------
    logic [31:0] boot_addr_i;
  
    //--------------------------------------------------------------------------
    // Instruction Memory Interface
    //--------------------------------------------------------------------------
    logic instr_req_o;
    logic instr_gnt_i;
    logic instr_rvalid_i;
    logic [31:0] instr_addr_o;
    logic [31:0] instr_rdata_i;
  
    //--------------------------------------------------------------------------
    // Data Memory Interface
    //--------------------------------------------------------------------------
    logic data_req_o;
    logic data_gnt_i;
    logic data_rvalid_i;
    logic data_we_o;
    logic [3:0] data_be_o;
    logic [31:0] data_addr_o;
    logic [31:0] data_wdata_o;
    logic [31:0] data_rdata_i;
  
    //--------------------------------------------------------------------------
    // CPU Control Signals
    //--------------------------------------------------------------------------
    logic fetch_enable_i;
  

  
  endinterface
  