// Counter with a load
module day10 (
  input     wire          clk,
  input     wire          reset,
  input     wire          load_i,
  input     wire[3:0]     load_val_i,

  output    wire[3:0]     count_o
);

  // Write your logic here...
  reg   [3:0] count_reg;
  logic [3:0] load_ff;
  logic [3:0] nxt_count;
  
  //Storing the load, for rollover purpose
  always_ff @(posedge clk, posedge reset) begin
    if(reset)
      load_ff <= 4'b0000;
    else
      load_ff <= load_val_i;
  end
  
  //Counting
  always_ff @(posedge clk, posedge reset) begin
      if(reset)
        count_reg <= 4'b0000;
      else
        count_reg <= nxt_count;
    end
  
  assign nxt_count = (load_i) ? (load_ff) : ((count_reg == 4'b1111) ? load_ff : (count_reg + 1));
  
	assign count_o = count_reg;
  
endmodule
