module mux (
	input a, b, sel,
	output o);
assign o = (~sel&a)|(sel&b);
endmodule 