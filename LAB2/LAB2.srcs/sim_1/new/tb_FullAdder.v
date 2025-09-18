`timescale 1ns/1ns
module tb_full_adder;
    // Inputs
    reg x, y, cin;
    // Outputs
    wire s, cout;
    // Instantiate the Unit Under Test (UUT)
    FullAdder dut (
        .x(x),
        .y(y),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Case 0: a=0, b=0, cin=0
        x = 0; y = 0; cin = 0; #10;
        // Case 1: a=0, b=0, cin=1
        x = 0; y = 0; cin = 1; #10;
        // Case 2: a=0, b=1, cin=0
        x = 0; y = 1; cin = 0; #10;
        // Case 3: a=0, b=1, cin=1
        x = 0; y = 1; cin = 1; #10;
        // Case 4: a=1, b=0, cin=0
        x = 1; y = 0; cin = 0; #10;
        // Case 5: a=1, b=0, cin=1
        x = 1; y = 0; cin = 1; #10;
        // Case 6: a=1, b=1, cin=0
        x = 1; y = 1; cin = 0; #10;
        // Case 7: a=1, b=1, cin=1
        x = 1; y = 1; cin = 1; #10;

        $stop; // end simulation
    end

endmodule