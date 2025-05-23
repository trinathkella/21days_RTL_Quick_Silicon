// APB Master

// TB should drive a cmd_i input decoded as:
//  - 2'b00 - No-op
//  - 2'b01 - Read from address 0xDEAD_CAFE
//  - 2'b10 - Increment the previously read data and store it to 0xDEAD_CAFE

module day16_tb ();

  logic        clk;
  logic        reset;

  logic[1:0]   cmd_i;

  logic        psel_o;
  logic        penable_o;
  logic[31:0]  paddr_o;
  logic        pwrite_o;
  logic[31:0]  pwdata_o;
  logic        pready_i;
  logic[31:0]  prdata_i;

  // Instantiate the RTL
  day16 DAY16 (.*);

  // Generate clock
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  int wait_cycles;
  // Generate pready
  always begin
    pready_i = 1'b0;
    
    wait_cycles = $urandom_range (1, 10);
    #wait_cycles;
    
    pready_i = 1'b1;
    @(posedge clk);
  end

  // Generate the stimulus
  initial begin
    reset <= 1'b1;
    cmd_i <= 2'b00;
    prdata_i <= 32'h0;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    @(posedge clk);
    for (int i=0; i<10; i++) begin
      cmd_i <= $urandom_range(2'b01,2'b10);
      prdata_i <= $urandom_range(0, 4'hF);
      // Wait for pready to be asserted
      while (~pready_i | ~psel_o) @(posedge clk);
      @(posedge clk);
    end
    $finish();
  end

endmodule
