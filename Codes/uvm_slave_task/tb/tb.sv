 `include "slave_if.sv";
 `include "slave_pkg.sv";
module tb;


  `include "uvm_macros.svh"

  import uvm_pkg::*;
  import slave_pkg::*;
  // Example clock and reset declarations
  logic clock = 0;
  logic reset;
  // Example clock generator process
  always #10 clock = ~clock;

  // Example reset generator process
  initial
  begin
    reset = 0;         // Active low reset in this example
    #75 reset = 1;
  end

  assign slave_if_0.rst_n = reset;

  assign slave_if_0.clk   = clock;

  // Pin-level interfaces connected to DUT
  slave_if  slave_if_0 ();

  slave uut (
    .clk  (slave_if_0.clk),
    .rst_n(slave_if_0.rst_n),
    .ready(slave_if_0.ready),
    .valid(slave_if_0.valid),
    .data (slave_if_0.data)
  );

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
end
initial begin
  uvm_config_db #(virtual slave_if)::set(null, "*" , "slave_vif", slave_if_0);
  run_test("top_test");
end

endmodule