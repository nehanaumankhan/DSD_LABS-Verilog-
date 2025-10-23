`timescale 1ns/1ps

module ram_16x4_tb();

    reg clk, rst;
    reg read_enable, write_enable, chip_select;
    reg [3:0] address;
    reg [3:0] d_in;
    wire [3:0] d_out;

    // Instantiate the RAM
    ram_16x4 DUT (
        .clk(clk),
        .rst(rst),
        .read_enable(read_enable),
        .write_enable(write_enable),
        .chip_select(chip_select),
        .address(address),
        .d_in(d_in),
        .d_out(d_out)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize values
        clk = 0; rst = 1; read_enable = 0; write_enable = 0; chip_select = 0; address = 0; d_in = 0;
        // Reset RAM
        @(posedge clk) rst = 0;
        // Write 1010 at address 3
        @(posedge clk) chip_select = 1; write_enable = 1; address = 4'd3; d_in = 4'b1010;
        // Stop writing
        @(posedge clk) write_enable = 0;
        // Read from address 3
        @(posedge clk) read_enable = 1; address = 4'd3;
        // Disable read
        @(posedge clk) read_enable = 0; chip_select = 0;
        @(posedge clk)
        // Finish simulation
        $stop;
    end

endmodule
