// Code your design here
module slave (input clk, input rst_n, input valid, input [3:0] data, output logic ready);
  logic [3:0] count=0;
  logic [3:0] r_count=0;
  logic [3:0] temp=0;

  always @(posedge clk) begin 
    if (!rst_n)
      ready <= 0;
    else begin
      if(valid && ready)
        count <= count+1;
      if ( valid && ready && count == 9 ) begin
        ready <=0 ;
        count <= 0;
        temp <= $urandom_range(5,10);
        r_count <=0;
      end
      else begin
        r_count <= r_count+1;
        if (r_count == temp) begin
          ready <= 1;
        end
      end
    end
  end 
endmodule
    
