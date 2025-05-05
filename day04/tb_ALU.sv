// Simple ALU TB

module day4_tb ();

  // Write your Testbench here...
  logic [7:0]   a_i;
  logic [7:0]   b_i;
  logic [2:0]   op_i;
  logic [7:0]   alu_o;
  
  day4 d(.*);
  always begin
    #10 a_i  = $urandom;
    #20 b_i  = $urandom;
    #5 op_i  = $urandom;
  end
  
  initial begin
  	a_i  = 8'h82; b_i = 8'hA6;
    op_i = 3'b011;

    $monitor("%0h %0b %0h = %0h", a_i, op_i, b_i, alu_o);
    #200 $finish();
  end

endmodule
