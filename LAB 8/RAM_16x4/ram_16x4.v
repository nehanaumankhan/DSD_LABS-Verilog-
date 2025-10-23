module ram_16x4(
    input       clk, rst,
    input       read_enable, write_enable, chip_select,
    input       [3:0] address, //2^4 = 16 addresses
    input       [3:0] d_in,    //4-bits data input
    output reg  [3:0] d_out    //4-bits data output
);
// 16 locations each of 4-bits width
reg [3:0] buffer [0:15];
integer i;
always@(posedge clk or posedge rst) 
    begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1) begin
                buffer[i] <= '0;
            end
            d_out <= '0;
        end
        else if (chip_select && write_enable) 
            buffer[address] <= d_in;
        else if (chip_select && read_enable)
            d_out <= buffer[address];
        else
            d_out <= 4'bzzzz;
    end

endmodule