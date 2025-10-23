module RWM(
    input clk, rst,
    input [7:0] d_in,
    input read_enable, write_enable, chip_select,
    output reg [7:0] d_out
);
// 8-bits buffer
reg [7:0] buffer;
always@(posedge clk or posedge rst) 
    begin
        if (rst) begin
            buffer <= '0;
            d_out <= '0;
        end
        else if (chip_select) 
        begin
            if (write_enable) begin
                buffer <= d_in;
                d_out <= buffer;
            end
            else if (read_enable)
                d_out <= buffer;
            else
                d_out <= 8'bzzzzzzzz;
        end
    end

endmodule