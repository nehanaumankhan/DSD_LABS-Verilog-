`timescale 1ns/1ns
module sub_tb;
    // Inputs
    reg x, y, bin;
    // Outputs
    wire d, bout;
    // Instantiate the Unit Under Test (UUT)
    FullSubtractor dut (
        .x(x),
        .y(y),
        .bin(bin),
        .d(d),
        .bout(bout)
    );

    initial begin
        // Case 0: a=0, b=0, bin=0
        x = 0; y = 0; bin = 0; #10;
        // Case 1: a=0, b=0, bin=1
        x = 0; y = 0; bin = 1; #10;
        // Case 2: a=0, b=1, bin=0
        x = 0; y = 1; bin = 0; #10;
        // Case 3: a=0, b=1, bin=1
        x = 0; y = 1; bin = 1; #10;
        // Case 4: a=1, b=0, bin=0
        x = 1; y = 0; bin = 0; #10;
        // Case 5: a=1, b=0, bin=1
        x = 1; y = 0; bin = 1; #10;
        // Case 6: a=1, b=1, bin=0
        x = 1; y = 1; bin = 0; #10;
        // Case 7: a=1, b=1, bin=1
        x = 1; y = 1; bin = 1; #10;

        $stop; // end simulation
    end

endmodule