// Detecting a big sequence - 1110_1101_1011
module day12 (
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,

  output    wire        det_o
);

  // Write your logic here...
  logic [11:0] shift_reg;
  logic [11:0] nxt_shift;
  
  always_ff @ (posedge clk, posedge reset)
    begin
      if(reset)
        shift_reg <= 12'd0;
      else
        shift_reg <= nxt_shift;
    end
  
   assign nxt_shift = {shift_reg[10:0], x_i};
  
   assign det_o     = {shift_reg == 12'b1110_1101_1011};
  
endmodule
