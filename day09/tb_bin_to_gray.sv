module day9_tb ();

  // Write your Testbench here...
	parameter VEC_W = 4;
  
  reg  [VEC_W-1:0] bin_i;
  wire [VEC_W-1:0] gray_o;
  
  day9 #(VEC_W) d(.*);
  
  initial begin
    for(int i = 0; i < 16; i++)
      begin
      	bin_i = $random;
        #5;
      end
    $finish();
  end
  
endmodule
