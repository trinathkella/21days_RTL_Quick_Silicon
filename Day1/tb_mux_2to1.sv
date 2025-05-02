// A simple TB for mux

module day1_tb ();

  // Write your Testbench here...
  reg  [7:0] a_i, b_i;
  reg 			 sel_i;
  wire [7:0] y_o;
  
  day1 d(.a_i(a_i), .b_i(b_i), .sel_i(sel_i), .y_o(y_o));
  
  always #5  a_i   = $random;
  always #10 b_i   = $random;
  always #15 sel_i = $random;
  initial begin
  	a_i = 8'hA4; b_i = 8'h1B;
    sel_i = 1'b0;
    #500 $finish();
  end
  
endmodule
