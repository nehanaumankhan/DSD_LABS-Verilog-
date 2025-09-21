module three_way_light_switch(
input x1, x2, x3,
output f);
assign f = (~x1&~x2&x3) | (~x1&x2&~x3) | (x1&~x2&~x3)| (x1&x2&x3);
endmodule