module demux(
	input a, sel,
	output o1, o2);
assign o1 = ~sel & a;
assign o2 = sel & a;
endmodule