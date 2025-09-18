module dec_2x4(
input En,
input In0,In1,
output [3:0]Out
);
assign Out[0] = ~En | In1 | In0;
assign Out[1] = ~En | In1 | ~In0;
assign Out[2] = ~En | ~In1 | In0;
assign Out[3] = ~En | ~In1 | ~In0;
endmodule