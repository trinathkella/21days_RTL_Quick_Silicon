// DFF TB

module day2_tb ();

  // Write your Testbench here...
  logic clk, reset, d_i;
  logic q_norst_o, q_syncrst_o, q_asyncrst_o;
  
  day2 d(.*);
	
  always #5 clk = ~clk;
  
	initial begin
    clk = 1'b1;
    reset <= 1'b1;
    d_i <= 1'b0;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    d_i <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    reset <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
  end
  
endmodule
