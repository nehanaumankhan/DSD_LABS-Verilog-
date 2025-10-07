`timescale 1ns/1ns

module p_enc_8x3_tb;
    reg [7:0] D;
    wire [2:0] Q;
    wire v;

    //Just a variable for loop iterations
    //integer i;
    // Instantiate DUT
    p_enc_8x3 dut(
        .D (D),
        .Q (Q),
        .v (v)
    );

    // Stimulus
    initial begin
        
        // for (i = 0; i < 256; i = i + 1) begin
        //     D = i;
        //     #10;
        // end
        //Driving all 256 combinations of D[7:0], the waveform will be huge and you won’t fit it in one screenshot.
        //Showing the partial truth table output
        D = 8'b00000000; #10
        D = 8'b00000001; #10 
        D = 8'b00000010; #10 
        D = 8'b00000100; #10 
        D = 8'b00001000; #10 
        D = 8'b00010000; #10 
        D = 8'b00100000; #10 
        D = 8'b01000000; #10 
        D = 8'b10000000; #10 

        #10 $finish;
        #10  $finish;
    end

endmodule 
