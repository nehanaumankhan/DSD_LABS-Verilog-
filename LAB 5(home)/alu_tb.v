`timescale 1ns/1ns

module alu_tb;
    reg  [7:0] op1, op2;
    reg  [2:0] operator;
    wire [7:0] result;
    wire c_flag, s_flag, z_flag, ov_flag;

    // Instantiate DUT
    alu dut (
        .op1     (op1),
        .op2     (op2),
        .res     (result),
        .operator(operator),
        .s_flag  (s_flag),
        .z_flag  (z_flag),
        .ov_flag (ov_flag),
        .c_flag  (c_flag)
    );

    // Named operators for readability
    localparam ADD = 3'b000,
               SUB = 3'b001,
               AND = 3'b010,
               OR  = 3'b011,    
               XOR = 3'b100,
               NOT = 3'b101,
               LSL = 3'b110,
               LSR = 3'b111;

    initial begin
        $display("Time\tOperator\top1\top2\tResult\tC\tZ\tS\tOV");
        $monitor("%0t\t%b\t%0d\t%0d\t%0d\t%b\t%b\t%b\t%b",
                 $time, operator, op1, op2, result, c_flag, z_flag, s_flag, ov_flag);

        // Test ADD
        op1 = 8'd50; op2 = 8'd70; operator = ADD; #10;  // 50 + 70 = 120
        op1 = 8'd127; op2 = 8'd1; operator = ADD; #10;  // overflow test

        // Test SUB
        op1 = 8'd100; op2 = 8'd50; operator = SUB; #10; // 100 - 50 = 50
        op1 = 8'd5;   op2 = 8'd10; operator = SUB; #10; // borrow case
        op1 = 8'd127; op2 = -8'd1; operator = SUB; #10; // signed overflow

        // Test AND / OR / XOR
        op1 = 8'hF0; op2 = 8'h0F; operator = AND; #10;
        op1 = 8'hF0; op2 = 8'h0F; operator = OR;  #10;
        op1 = 8'hAA; op2 = 8'h55; operator = XOR; #10;

        // Test NOT
        op1 = 8'h0F; operator = NOT; #10;

        // Test LSL / LSR
        op1 = 8'b10000001; operator = LSL; #10;
        op1 = 8'b10000001; operator = LSR; #10;

        // Finish
        $finish;
    end
endmodule
