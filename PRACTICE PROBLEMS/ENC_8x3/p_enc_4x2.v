module p_enc_4x2 (
	input [3:0] D,
	output [1:0] Q,
	output v);
assign Q[0] = (D[1] & ~D[2]) | D[3];
assign Q[1] = D[3] | D[2];
assign v 	= D[3] | D[2] | D[1] | D[0];

endmodule 