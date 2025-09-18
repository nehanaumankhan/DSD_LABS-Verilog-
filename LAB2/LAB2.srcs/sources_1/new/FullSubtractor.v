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
// Full Subtractor 
// d = x xor y xor bin
// bout = ~xy + ~xbin + ybin
module FullSubtractor(
    input x,
    input y,
    input bin,
    output d,
    output bout
    );
    wire w1, w2, w3, w4;
    xor x1(w1,x,y);
    xor x2(d,w1,bin);
    
    and a1(w2,~x,y);
    and a2(w3,~x,bin);
    and a3(w4,y,bin);
    or o1(bout, w2, w3, w4);
endmodule
