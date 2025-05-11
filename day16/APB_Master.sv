// APB Master

// TB should drive a cmd_i input decoded as:
//  - 2'b00 - No-op
//  - 2'b01 - Read from address 0xDEAD_CAFE
//  - 2'b10 - Increment the previously read data and store it to 0xDEAD_CAFE

module day16 (
  input       wire        clk,
  input       wire        reset,

  input       wire[1:0]   cmd_i,

  output      wire        psel_o,
  output      wire        penable_o,
  output      wire[31:0]  paddr_o,
  output      wire        pwrite_o,
  output      wire[31:0]  pwdata_o,
  input       wire        pready_i,
  input       wire[31:0]  prdata_i
);

  // Write your logic here...
  
  //States needed for building up the operations
  typedef enum logic [1:0] {IDLE = 2'b00, SETUP = 2'b01, ACCESS = 2'b10} APB_STATES;
	
  APB_STATES state, nxt_state;
  
  logic [31:0] rdata_q;
  
  //State register logic
  always_ff @ (posedge clk, posedge reset) begin
    if(reset)
      state <= IDLE;
    else
      state <= nxt_state;
  end
  
  //State Transition logic
  always_comb begin
    
  	nxt_state = state;
    
    case(state)
    	IDLE   : begin
        if(|cmd_i)
          nxt_state = SETUP;
        else
          nxt_state = IDLE;
      end
      
      SETUP  : nxt_state = ACCESS;
      
      ACCESS : begin
        if(pready_i)
          nxt_state = IDLE;
        else
          nxt_state = ACCESS;
      end
      
      default : nxt_state = state;
    endcase
    
  end
  
  assign psel_o    = (state == SETUP) | (state == ACCESS);
  assign penable_o = (state == ACCESS);
  assign paddr_o   = 32'hDEAD_CAFE;
  assign pwrite_o  = cmd_i[1];
  assign pwdata_o  = rdata_q + 32'h0000_0001;
  
  always_ff @ (posedge clk, posedge reset) begin
    if(reset)
      rdata_q <= 32'h0000_0000;
    else if(penable_o && pready_i && pwrite_o)
      rdata_q <= prdata_i;
  end
  
endmodule
