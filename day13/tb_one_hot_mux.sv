// Simple TB

module day13_tb ();

  // Write your Testbench here...
  reg [3:0] a_i;
  reg [3:0] sel_i;
	wire      y_ter_o;
  wire      y_case_o;
  wire      y_ifelse_o;
  wire      y_loop_o;
  wire      y_aor_o;

  day13 d(.*);
  
  initial begin
    for (int i =0; i<32; i++) begin
      a_i   = $urandom_range(0, 4'hF);
      sel_i = 1'b1 << $urandom_range(0, 2'h3); // one-hot
      #5;
    end
    $finish();
  end
endmodule
