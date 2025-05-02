 // An edge detector

module day3 (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_i,

  output    wire    rising_edge_o,
  output    wire    falling_edge_o
);
  // Write your logic here...
  reg r_edge, f_edge;
  typedef enum logic {s0,s1} state;
  state p_s, n_s;
  
  always @ (posedge clk)
	begin
    if(reset)
      p_s <= s0;
    else
      p_s <= n_s;
  end
  
  always @ (*)
    begin
      
  		r_edge = 1'b0;
      f_edge = 1'b0;
      
      case(p_s)
        
        s0 : begin
            if(a_i) begin
              r_edge = 1'b1;
              n_s    = s1;
            end
            else n_s = s0;
        end
        
        s1 : begin
            if(!a_i) begin
              f_edge = 1'b1;
              n_s    = s0;
            end
            else n_s = s1;
        end
       
        default : n_s = s0;
        
      endcase
    end
  
  assign rising_edge_o  = r_edge;
  assign falling_edge_o = f_edge;
  
endmodule
