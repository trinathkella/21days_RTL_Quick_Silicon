// A simple ALU

module ALU
(
	input     logic [7:0]   a_i,
	input     logic [7:0]   b_i,
	input     logic [2:0]   op_i,
	output    logic [7:0]   alu_o
);	
	
	logic carry;

	localparam ADD	= 3'b000;
	localparam SUB	= 3'b001;
	localparam SLL	= 3'b010;
	localparam LSR	= 3'b011;
	localparam AND	= 3'b100;
	localparam OR	= 3'b101;
	localparam XOR	= 3'b110;
	localparam EQL	= 3'b111;

	always_comb begin
		case(op_i)
			ADD : {carry, alu_o} = a_i +  b_i;
			SUB : 		   alu_o = a_i -  b_i;
			SLL : 		   alu_o = a_i << b_i[2:0];
			LSR :  		   alu_o = a_i >> b_i[2:0];
			AND :		   alu_o = a_i &  b_i;
			OR  : 		   alu_o = a_i |  b_i;
			XOR : 		   alu_o = a_i ^  b_i;
			EQL :		   alu_o = (a_i == b_i) ? 8'd1 : 8'd0;
		endcase
	end

endmodule : ALU
