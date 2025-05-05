module day8_tb();
  // Write your Testbench here..
   parameter BIN_W       = 4;
   parameter ONE_HOT_W   = 16;
  
  reg  [BIN_W-1:0]     bin_i;
  wire [ONE_HOT_W-1:0] one_hot_o;
  
  day8 #(.BIN_W(BIN_W), .ONE_HOT_W(ONE_HOT_W)) d(.*);
  
  initial begin
    bin_i = 4'b0010;
    for(int i = 0; i < 15; i++)
      begin
        bin_i = $random;
        #5;
      end
    $finish();
  end
endmodule
