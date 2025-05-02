// Simple shift register
module day6(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    wire[3:0]   sr_o
);

  // Write your logic here...
  reg [3:0] sr_reg;

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      sr_reg <= 4'b0000;
    else
      sr_reg <= {sr_reg[2:0], x_i};  // Shift left, insert x_i at LSB
  end

  assign sr_o = sr_reg;

endmodule
