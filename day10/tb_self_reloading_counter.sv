module day10_tb ();

  logic          clk;
  logic          reset;
  logic          load_i;
  logic[3:0]     load_val_i;

  logic[3:0]     count_o;

  day10 DAY10 (.*);

  // Clock
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  initial begin
    reset = 1;
    load_i = 0;
    load_val_i = 4'h4;
    
    @(posedge clk);
    reset = 0;

    @(posedge clk);
    load_i = 1;

    @(posedge clk);
    load_i = 0;
    
    repeat (20) @(posedge clk);
   $finish();
  end

endmodule
