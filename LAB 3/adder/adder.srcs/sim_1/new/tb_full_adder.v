`timescale 1ns/1ns
module tb_full_adder;
    reg a, b, cin;
    // Outputs
    wire sum, cout;
    // Instantiate the Unit Under Test (UUT)
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Case 0: a=0, b=0, cin=0
        a = 0; b = 0; cin = 0; #10;
        // Case 1: a=0, b=0, cin=1
        a = 0; b = 0; cin = 1; #10;
        // Case 2: a=0, b=1, cin=0
        a = 0; b = 1; cin = 0; #10;
        // Case 3: a=0, b=1, cin=1
        a = 0; b = 1; cin = 1; #10;
        // Case 4: a=1, b=0, cin=0
        a = 1; b = 0; cin = 0; #10;
        // Case 5: a=1, b=0, cin=1
        a = 1; b = 0; cin = 1; #10;
        // Case 6: a=1, b=1, cin=0
        a = 1; b = 1; cin = 0; #10;
        // Case 7: a=1, b=1, cin=1
        a = 1; b = 1; cin = 1; #10;

        $stop; // end simulation
    end

endmodule