`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 09:14:30 AM
// Design Name: 
// Module Name: FullAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FullAdder(
    input x,
    input y,
    input cin,
    output s,
    output cout
    );
    wire w1, w2, w3, w4;
    xor x1(w1,x,y);
    xor x2(s,w1,cin);
    and a1(w2,cin,x);
    and a2(w3,cin,y);
    and a3(w4,y,x);
    or o1(cout, w2, w3, w4);
endmodule
