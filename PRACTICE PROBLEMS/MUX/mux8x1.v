module mux8x1 (
	input a,b,c,d,e,f,g,h,s0, s1, s2,
	output O	
);
//internal wires
wire w1, w2, w3, w4, w5, w6;

mux m1(
	.a(a),
	.b(b),
	.sel(s0),
	.o(w1),
	);

mux m2(
	.a(c),
	.b(d),
	.sel(s0),
	.o(w2),
	);

mux m3(
	.a(e),
	.b(f),
	.sel(s0),
	.o(w3),
	);

mux m4(
	.a(g),
	.b(h),
	.sel(s0),
	.o(w4),
	);

mux m5(
	.a(w1),
	.b(w2),
	.sel(s1),
	.o(w5),
	);

mux m6(
	.a(w3),
	.b(w4),
	.sel(s1),
	.o(w6),
	);

mux m7(
	.a(w5),
	.b(w6),
	.sel(s2),
	.o(O),
	);
endmodule