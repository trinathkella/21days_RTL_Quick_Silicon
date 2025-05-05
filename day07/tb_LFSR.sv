module day7_tb ();

  // Write your Testbench here...
	reg 			 clk;
	reg 			 reset;
  wire [3:0] lfsr_o;
  
  day7 d(.*);
  
	always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
	
  initial begin
  	reset = 1'b1;
    #10 reset = 1'b0;
    for(int i = 0; i < 32; i++)
      begin
        @ (posedge clk);
      end
    $finish();
  end
  
endmodule
