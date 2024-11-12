`include "dut_intf"
module counter (input clk,  // Declare input port for the clock to allow counter to count up
                input rstn, // Declare input port for the reset to allow the counter to be reset to 0 when required
                input enable, // Declare input port for the enablement of the counter
                output reg[3:0] out // Declare 4-bit output port to get the counter values
               );
 // This always block will be triggered at the rising edge of clk (0->1)
 // Once inside this block, it checks if the reset is 0, then change out to zero
 // If reset is 1 and enable is high counting starts
  always @ (posedge clk) begin
    if (!rstn)
       out <= 0;
    else if(enable)
       out <= out + 1;
  	else
       out <= out;
  end
endmodule
