// Round robin arbiter

module day15 (
  input     wire        clk,
  input     wire        reset,

  input     wire[3:0]   req_i,
  output    logic[3:0]  gnt_o
);

  // Write your logic here...
  
  //To identify the last grant
  logic [3:0] mask_q;
  logic [3:0] nxt_mask;
  
  // Update the mask every clock cycle or reset
  // On reset, give initial priority to all (no masking)
  always_ff @ (posedge clk, posedge reset) begin
    if(reset)
      mask_q <= 4'hf;
    else
      mask_q <= nxt_mask;
  end
  
  // Generate the next mask based on which grant was given
  // This effectively rotates the priority for the next cycle
  always_comb begin
  	nxt_mask = mask_q;
    if(gnt_o[0])
      nxt_mask = 4'b1110;
    else if(gnt_o[1])
      nxt_mask = 4'b1100;
    else if(gnt_o[2])
      nxt_mask = 4'b1000;
    else if(gnt_o[3])
      nxt_mask = 4'b0000;
  end
  
  logic [3:0] mask_req;
  //To generate masked rquests
  assign mask_req = req_i & mask_q;
  
  logic [3:0] mask_gnt;
  logic [3:0] raw_gnt;
  
  //generating masked req and req
  day14 #(4) maskedgnt (.req_i(mask_req), .gnt_o(mask_gnt));
  day14 #(4) rawgnt (.req_i(req_i), .gnt_o(raw_gnt));
  
  //Final grant based on the requests
  assign gnt_o = |mask_req ? mask_gnt : raw_gnt; 

endmodule

module day14 #(
  parameter NUM_PORTS = 4
)(
    input       wire[NUM_PORTS-1:0] req_i,
    output      wire[NUM_PORTS-1:0] gnt_o   // One-hot grant signal
);
  // Port[0] has highest priority
  assign gnt_o[0] = req_i[0];

  genvar i;
  for (i=1; i<NUM_PORTS; i=i+1) begin
    assign gnt_o[i] = req_i[i] & ~(|gnt_o[i-1:0]);
  end

endmodule
