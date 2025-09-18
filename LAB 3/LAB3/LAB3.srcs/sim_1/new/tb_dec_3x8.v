`timescale 1ns/1ns
module tb_dec_3x8;
    reg In0, In1, In2;
    wire [7:0]Output;
    
    dec_3x8 dut(
    .In0(In0),
    .In1(In1),
    .In2(In2),
    .Output(Output[7:0])
    );
    
    initial begin
    In2 = 0; 
    In1 = 0; In0 = 0; #10;
    In1 = 0; In0 = 1; #10;
    In1 = 1; In0 = 0; #10;
    In1 = 1; In0 = 1; #10;
    In2 = 1; 
    In1 = 0; In0 = 0; #10;
    In1 = 0; In0 = 1; #10;
    In1 = 1; In0 = 0; #10;
    In1 = 1; In0 = 1; #10;
    $stop;
    end
endmodule