`timescale 1ns/1ns

module p_enc_4x2_tb;
    reg [3:0] D;
    wire [1:0] Q;
    wire v;

    //Just a variable for loop iterations
    integer i;
    // Instantiate DUT
    p_enc_4x2 dut(
        .D (D),
        .Q (Q),
        .v (v)
    );

    // Stimulus
    initial begin
        
        for (i = 0; i < 8; i = i + 1) begin
            D = i;
            #10;
        end
        #10  $finish;
    end

endmodule 
