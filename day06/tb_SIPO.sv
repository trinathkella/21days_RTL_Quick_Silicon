module day6_tb ();

  // Write your Testbench here...
    reg 			clk;
    reg 			reset;
    reg 			x_i;
  	wire [3:0]sr_o;
  	
  	day6 d(.*);
  	always begin
      	clk = 1'b1;
      #5;
      	clk = 1'b0;
      #5;
    end
  
  	initial begin
    		reset = 1'b1;
      	x_i   = 1'b1;
      	@(posedge clk);
      	reset = 1'b0;
      	@(posedge clk);
      for(int i = 0; i < 16; i++)
        begin
        		x_i = $random % 2;
          	@(posedge clk);
        end
      $finish();
    end
  
endmodule
