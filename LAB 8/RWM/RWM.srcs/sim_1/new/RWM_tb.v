`timescale 1ns/1ns

module RWM_tb;
    reg clk, rst, chip_select, read_enable, write_enable;
    reg [7:0] data_in;
    wire [7:0] data_out; 
    
    RWM dut(
    .clk(clk),
    .rst(rst),
    .chip_select(chip_select),
    .read_enable(read_enable),
    .write_enable(write_enable),
    .d_in(data_in),
    .d_out(data_out)
    );
    
    initial clk = 0;
    always
    #5 clk = ~clk;
    
    initial begin
        rst = 1;    @(posedge clk);
        @(posedge clk); rst = 0;
        chip_select = 1;        
        read_enable = 0;    
        write_enable = 1; 
        data_in = 1; 
        @(posedge clk); read_enable = 0;    data_in = 2;
        @(posedge clk); data_in = 3;
        @(posedge clk); data_in = 4;        write_enable = 0;
        @(posedge clk); data_in = 5;
        @(posedge clk); data_in = 6;        read_enable = 0;
        @(posedge clk); data_in = 7;        write_enable = 1;
        @(posedge clk); write_enable = 1;   read_enable = 0;
        @(posedge clk);
        $stop;
    end
    
endmodule