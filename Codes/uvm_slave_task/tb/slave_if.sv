`ifndef SLAVE_IF_SV
`define SLAVE_IF_SV

interface slave_if(); 


  logic clk;
  logic rst_n;
  logic ready;
  logic valid;
  logic [3:0] data;

  // You can insert properties and assertions here

endinterface : slave_if

`endif // SLAVE_IF_SV

