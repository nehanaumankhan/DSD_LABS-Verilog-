module pipo_siso_reg(
    input        clk, rst, enable, shift_loadbar, serial_in,
    input        [7:0]  parallel_in,
    output       reg serial_out,
    output       reg [7:0] parallel_out    );
always@(negedge rst or posedge clk) begin

    if (!rst) begin
        parallel_out        <= 'b0;
        serial_out          <= 'b0;
    end
    else begin
        if (enable) begin
            if (!shift_loadbar) 
                parallel_out    <= parallel_in;
            else begin
                serial_out      <= serial_in;
                parallel_out    <= {parallel_out[6:0], serial_in};
            end            
        end
    end
    
end    
endmodule
