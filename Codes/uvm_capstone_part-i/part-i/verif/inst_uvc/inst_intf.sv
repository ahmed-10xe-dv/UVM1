// ╔════════════════════════════════════════════════════════════════════╗
// ║                              INTERFACE                             ║
// ║     Author      : Ahmed Raza                                       ║
// ║     Date        : 25 Nov 2024                                      ║
// ║     Description : Instruction interface for communication between  ║
// ║                   components using parameters from bus_params_pkg. ║
// ╚════════════════════════════════════════════════════════════════════╝

interface inst_intf(
    input logic clk // Clock signal
);

    // Instruction signals using bus_params_pkg constants
    wire                                inst_req_o;
    wire [bus_params_pkg::BUS_AW-1:0]   inst_addr_o;              // Address output
    wire                                inst_gnt_i;               // Grant input
    wire                                inst_rvalid_i;            // Valid input
    wire [bus_params_pkg::BUS_DW]       inst_rdata_i;             // Read data input

    // Clocking block for driver
    clocking driver_cb @(posedge clk);
        input                                inst_addr_o;
        input                                inst_req_o;
        output                               inst_gnt_i;
        output                               inst_rvalid_i;
        output                               inst_rdata_i;
    endclocking

    // Clocking block for monitor
    clocking monitor_cb @(posedge clk);
        input                               inst_addr_o;
        input                               inst_req_o;
        input                               inst_gnt_i;
        input                               inst_rvalid_i;
        input                               inst_rdata_i;
    endclocking

    // Task to wait for specified positive clock cycles
    task automatic wait_clks(input int num);
        repeat (num) @(posedge clk);
    endtask

    // Task to wait for specified negative clock cycles
    task automatic wait_neg_clks(input int num);
        repeat (num) @(negedge clk);
    endtask

endinterface : inst_intf
