// Simple edge detector TB

module day3_tb ();

  // Write your Testbench here...
  logic clk, reset, a_i;
  logic rising_edge_o, falling_edge_o;
  
  day3 d(.clk(clk), .reset(reset), .a_i(a_i), .rising_edge_o(rising_edge_o), .falling_edge_o(falling_edge_o));
  
  // clk
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    reset = 1'b1;
    a_i = 1'b1;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    for (int i=0; i<32; i++) begin
      a_i = $random%2;
      @(posedge clk);
    end
    $finish();
  end

  
endmodule
