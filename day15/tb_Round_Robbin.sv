// TB for round robin

module day15_tb ();

  // Write your Testbench here...
	reg 			 clk;
	reg 			 reset;
  reg  [3:0] req_i;
  wire [3:0] gnt_o;
  
  day15 d(.*);
  
  always begin
  	clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
	
  initial begin
    req_i = 4'b1101;
  	reset = 1'b1;
    @(posedge clk);
    	reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    for(int i = 0; i < 32; i++) begin
      req_i = $urandom_range(0,4'hf);
      repeat(2) @(posedge clk);
    end
    $finish();
  end
  
endmodule
