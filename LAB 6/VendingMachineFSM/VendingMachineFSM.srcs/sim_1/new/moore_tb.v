`timescale 1ns/1ps

module tb_moore;

    // Testbench signals
    reg clk, rst;
    reg [1:0] coin;   // 00 = 0¢, 01 = 5¢, 10 = 10¢
    wire out;

    // Instantiate DUT (Device Under Test)
    moore uut (
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

        // === Test 1: Insert 5¢ + 10¢ ? should output 1 at 15¢ ===
        @(posedge clk); coin = 2'b01;   // insert 5¢
        @(posedge clk); coin = 2'b00;   // no coin
        @(posedge clk); coin = 2'b10;   // insert 10¢
        @(posedge clk); coin = 2'b00;   // FSM should output 1 here

        // === Test 2: Insert 10¢ + 10¢ ? output should pulse again ===
        repeat(2) @(posedge clk);       // wait a couple cycles
        coin = 2'b10;                   // insert 10¢
        @(posedge clk); coin = 2'b10;   // another 10¢ (total 20¢)
        @(posedge clk); coin = 2'b00;   // FSM resets after dispensing

        // === Test 3: Insert 5¢ + 5¢ + 5¢ ===
        repeat(2) @(posedge clk);
        coin = 2'b01; @(posedge clk);
        coin = 2'b01; @(posedge clk);
        coin = 2'b01; @(posedge clk);   // total 15¢ now
        coin = 2'b00; @(posedge clk);

        // Finish simulation after a few more cycles
        repeat(5) @(posedge clk);
        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time | Coin | Out");
        $monitor("%4t |  %b  |  %b", $time, coin, out);
    end

endmodule
