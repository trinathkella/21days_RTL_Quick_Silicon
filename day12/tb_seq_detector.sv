module day12_tb ();

  // Write your Testbench here...
  reg clk, reset;
  reg x_i;
  wire det_o;
  
  day12 d(.*);
  
  always #5 clk = ~clk;
  
  logic [11:0] seq = 12'b1110_1101_1011;
  
  initial begin
    x_i <= 1'b1;
  	clk <= 1'b1;
    reset <= 1'b1;
    #5;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for(int i = 0 ; i<12; i++) begin
      x_i <= seq[i];
      @(posedge clk);
    end
    
    for(int i = 0; i < 12 ; i++) begin
    	x_i <= $random % 2;  
      @(posedge clk);
    end
    
    $finish();
  end

endmodule
