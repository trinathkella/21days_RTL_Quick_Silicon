// Parallel to serial with valid and empty

module day11 (
  input     wire      clk,
  input     wire      reset,

  output    wire      empty_o,
  input     wire[3:0] parallel_i,
  
  output    wire      serial_o,
  output    wire      valid_o
);

  // Write your logic here...
  logic [3:0] shift_reg;
  logic [3:0] nxt_shift;
  
  always_ff @ (posedge clk, posedge reset)
    begin
      if(reset)
        shift_reg <= 4'b0000;
      else
        shift_reg <= nxt_shift;
    end
  
  //Registering in the input based on the empty condition
  assign nxt_shift = (empty_o) ? parallel_i : {1'b0, shift_reg[3:1]};
  
  //Serial data
  assign serial_o  = shift_reg[0];
  
  //Counter to track the data serialization
  logic [2:0]count;
  logic [2:0]nxt_count;
  
  always_ff @ (posedge clk, posedge reset)
    begin
      if(reset)
        count <= 3'b000;
      else
        count <= nxt_count;
    end
	
  assign nxt_count = (count == 3'b100) ? 3'b000 : (count + 1);
  
  assign valid_o   = |(count);
  
  assign empty_o   = (count == 3'b000);
  
endmodule
