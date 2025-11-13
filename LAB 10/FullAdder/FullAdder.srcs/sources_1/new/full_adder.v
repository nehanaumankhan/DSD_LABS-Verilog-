module full_adder(
input [3:0]a, b,
input cin,
output [3:0]sum,
output cout);
assign sum = a^b^cin;
assign cout = a&b | b&cin | a&cin;
endmodule