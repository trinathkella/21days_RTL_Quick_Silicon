// Binary to gray code

module day9 #(
  parameter VEC_W = 4
)(
  input     wire[VEC_W-1:0] bin_i,
  output    wire[VEC_W-1:0] gray_o

);

  // Write your logic here...
  assign gray_o = (bin_i >> 1) ^ bin_i;

endmodule
