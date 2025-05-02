// A simple mux

module day1 (
  input   wire [7:0]    a_i,
  input   wire [7:0]    b_i,
  input   wire          sel_i,
  output  wire [7:0]    y_o
);
	
  reg [7:0] y_out;
  // Write your logic here...
  always @ (*)
    begin
      case (sel_i)
        1'b0 : y_out = a_i;
        1'b1 : y_out = b_i;
      endcase
    end
  
  assign y_o = y_out;

endmodule
