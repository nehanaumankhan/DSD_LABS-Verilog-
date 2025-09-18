`timescale 1ns/1ns
module tb_dec_2x4;
    reg En,In0, In1;
    wire [3:0]Out;
    
    dec_2x4 dut(
    .En(En),
    .In0(In0),
    .In1(In1),
    .Out(Out[3:0])
    );
    
    initial begin
    En = 0; 
    In1 = 0; In0 = 0; #10;
    In1 = 0; In0 = 1; #10;
    In1 = 1; In0 = 0; #10;
    In1 = 1; In0 = 1; #10;
    En = 1; 
    In1 = 0; In0 = 0; #10;
    In1 = 0; In0 = 1; #10;
    In1 = 1; In0 = 0; #10;
    In1 = 1; In0 = 1; #10;
    $stop;
    end
endmodule