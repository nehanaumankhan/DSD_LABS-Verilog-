`timescale 1ns/1ns

module tb_AND;
    // Inputs
    reg a;
    reg b;
    // Outputs
    wire c;

    // Instantiate the Design Under Test (UUT)
    AND_GATE dut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Initialize Inputs
        a = 0; b = 0;
        //Test Case 1
        #10; a = 1; b = 0;
        //Test Case 2
        #10; a = 1; b = 1;
        //Test Case 3
        #10; a = 0; b = 1;
        //Test Case 4
        #10; a = 1; b = 1;
        #10;
    end
endmodule