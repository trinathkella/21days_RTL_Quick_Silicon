module day14_tb ();

  // Write your Testbench here...
  parameter NUM_PORTS = 4;
  reg  [NUM_PORTS - 1 :0] req_i;
  wire [NUM_PORTS - 1 :0] gnt_o;
  
  day14 d(.*);
  
  initial begin
  	req_i = 4'b1101;
    
    for(int i = 0; i < 32; i++)
      begin
        req_i = $urandom_range(0, 2**NUM_PORTS - 1);
        #10;
      end
    $finish();
  end

endmodule
