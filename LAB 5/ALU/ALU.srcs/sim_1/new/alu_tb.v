`timescale 1ns/1ns
module alu_tb;
    reg [5:0] op1, op2;
    reg [2:0] operation;
    wire [5:0] result;
    wire s_flag, c_flag, z_flag, ov_flag;
    
   alu dut(
    .op1(op1),
    .op2(op2),
    .operation(operation),
    .result(result),
    .s_flag(s_flag),
    .c_flag(c_flag),
    .z_flag(z_flag),
    .ov_flag(ov_flag)
   );
   
   initial begin
   operation = 3'b000; op1 = 6'b001010; op2 = 6'b111010; #5;
   operation = 3'b001; op1 = 6'b001010; op2 = 6'b111010; #5; 
   operation = 3'b010; op1 = 6'b001010; op2 = 6'b111010; #5; 
   operation = 3'b011; op1 = 6'b001010; op2 = 6'b111010; #5; 
   operation = 3'b001; op1 = 6'b111010; op2 = 6'b111010; #5; 
   operation = 3'b101; op1 = 6'b001010; #5;
   operation = 3'b110; op1 = 6'b001010; #5;
   operation = 3'b111; op1 = 6'b001010; #5;
   $stop;
   end
endmodule