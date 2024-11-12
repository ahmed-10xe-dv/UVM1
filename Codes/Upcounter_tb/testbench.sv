// ---------------------------------------------
// |               Counter Testbench           |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 12                      |
// | Description : This is the testbench file  |
// |               for the counter DUT. It     |
// |               instantiates the counter    |
// |               DUT, generates the clock,  |
// |               and runs the `counter_test` |
// |               UVM test. It also configures|
// |               the virtual interface for   |
// |               communication with the DUT. |
// |               The simulation results are  |
// |               dumped into a VCD file.     |
// ---------------------------------------------

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "counter_test.sv"

module counter_testbench;

  timeunit 1ns;
  timeprecision 100ps;
  
  logic clk;   // Declare clk here as required
  
  count_intf intf1(clk);  // Instantiate the interface with clk and rstn

  // Instantiate the DUT with individual connections to interface signals
  counter dut_here (
    .clk(intf1.clk),
    .rstn(intf1.rstn),
    .enable(intf1.enable),
    .out(intf1.out)
  );

  initial begin
    uvm_config_db #(virtual count_intf)::set(null, "*", "vif", intf1);
    run_test("counter_test");
  end

  // Clock generation
  initial begin
    clk = 1;
    forever #5 clk = ~clk;
  end
  

  // Dumping simulation results
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, counter_testbench);
  end
endmodule
