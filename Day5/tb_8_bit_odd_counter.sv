// Simple TB

module day5_tb ();

  // Write your Testbench here...
  reg clk;
	reg reset;
  wire [7:0]cnt_o;
	
  day5 d(.*);
  
  always #5 clk = !clk;
  initial begin
  		clk = 1;
    	reset = 1;
    	#10 reset = 0;
    	for (int i=0; i<128; i++)
        @(posedge clk);
   		$finish();
  end
endmodule
