// LFSR
module day7 (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);

  // Write your logic here...
  reg [3:0] temp;
  always_ff @ (posedge clk)
    begin
      if(reset)
        temp <= 4'b1111;
      else
        temp <= {temp[2:0] , temp[1] ^ temp[3]};
    end
		
  	assign lfsr_o = temp;
  
endmodule
