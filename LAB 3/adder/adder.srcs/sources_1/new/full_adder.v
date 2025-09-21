module full_adder(
input a, b, cin,
output sum, cout);
wire w1,w2,w3;

half_adder a1 (
    .a(a),
    .b(b),
    .s(w1),
    .c(w2)
);

half_adder a2 (
    .a(w1),
    .b(cin),
    .s(sum),
    .c(w3)
);

assign cout = w3 | w2;

endmodule