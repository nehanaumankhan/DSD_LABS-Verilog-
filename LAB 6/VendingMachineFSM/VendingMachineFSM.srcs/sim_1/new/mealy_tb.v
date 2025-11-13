`timescale 1ns/1ns

module tb_mealy;

    // Testbench signals
    reg clk, rst;
    reg [1:0] coin;   // 00 = 0¢, 01 = 5¢, 10 = 10¢
    wire out;

    // Instantiate DUT (Device Under Test)
    mealy uut (
        .clk(clk),
        .rst(rst),
        .coin(coin),
        .out(out)
    );

    // Clock generation: 10 ns period (100 MHz)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        coin = 2'b00;

        // Apply reset for one cycle
        @(posedge clk);
        rst = 0;

        // === Test 1: 5¢ + 10¢ ? should output 1 when total reaches 15¢ ===
        @(posedge clk); coin = 2'b01;   // Insert 5¢
        @(posedge clk); coin = 2'b00;   // No coin
        @(posedge clk); coin = 2'b10;   // Insert 10¢ (expect out=1 here, Mealy)
        @(posedge clk); coin = 2'b00;   // No coin

        // === Test 2: 10¢ + 10¢ ===
        repeat(2) @(posedge clk);
        coin = 2'b10; @(posedge clk);   // Insert 10¢
        coin = 2'b10; @(posedge clk);   // Another 10¢ (expect out=1)
        coin = 2'b00; @(posedge clk);   // No coin

        // === Test 3: 5¢ + 5¢ + 5¢ ===
        repeat(2) @(posedge clk);
        coin = 2'b01; @(posedge clk);   // 5¢
        coin = 2'b01; @(posedge clk);   // 10¢ total
        coin = 2'b01; @(posedge clk);   // 15¢ (expect out=1)
        coin = 2'b00; @(posedge clk);

        // Finish simulation
        repeat(5) @(posedge clk);
        $finish;
    end

endmodule
