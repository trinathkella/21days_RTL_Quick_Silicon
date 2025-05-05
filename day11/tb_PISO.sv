module day11_tb ();

  // Write your Testbench here...
   reg  clk;
	 reg  reset;
	 wire empty_o;
   reg  [3:0] parallel_i;
   wire serial_o;
   wire valid_o;
  
  day11 d(.*);
  
  always #5 clk = ~clk;
  
  always #40 parallel_i = $random;
  
  initial begin
    clk = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    
    parallel_i = 4'b1011;
    
    #500 $finish();
  end

endmodule
