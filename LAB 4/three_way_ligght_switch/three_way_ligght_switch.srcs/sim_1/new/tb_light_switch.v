`timescale 1ns/1ns
module tb_light_switch;
    reg x1, x2, x3;
    wire f;
    // Instantiate the Unit Under Test (UUT)
    three_way_light_switch dut (
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .f(f)
    );

    initial begin
        
        x1 = 0; x2 = 0; x3 = 0; #10;
        x1 = 0; x2 = 0; x3 = 1; #10;
        x1 = 0; x2 = 1; x3 = 0; #10;
        x1 = 0; x2 = 1; x3 = 1; #10;
        x1 = 1; x2 = 0; x3 = 0; #10;
        x1 = 1; x2 = 0; x3 = 1; #10;
        x1 = 1; x2 = 1; x3 = 0; #10;
        x1 = 1; x2 = 1; x3 = 1; #10;
        $stop; // end simulation
    end

endmodule