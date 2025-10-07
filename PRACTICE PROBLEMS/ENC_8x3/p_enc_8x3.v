module p_enc_8x3 (
	input  [7:0] D,
	output [2:0] Q,
	output v
);
//Internal wires declaration
wire v0, v1;
wire [1:0] q0, q1;

//Instance of ENC0
p_enc_4x2 e0(
	.D(D[3:0]),
	.Q(q0),
	.v(v0)
	);
//Instance of ENC1
p_enc_4x2 e1(
	.D(D[7:4]),
	.Q(q1),
	.v(v1)
	);
//Mux for Q[0]
mux m0(
	.a(q0[0]),
	.b(q1[0]),
	.sel(v1),
	.o(Q[0])
	);
//Mux for Q[1]
mux m1(
	.a(q0[1]),
	.b(q1[1]),
	.sel(v1),
	.o(Q[1])
	);
//Mux for Q[2]
mux m2(
	.a(0),
	.b(1),
	.sel(v1),
	.o(Q[2])
	);
//Equaion for V
assign v = v0 | v1;
endmodule 