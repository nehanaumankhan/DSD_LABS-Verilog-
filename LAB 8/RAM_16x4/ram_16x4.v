module ram_16x4(
    input        clk, rst,
    input        read_enable, write_enable, chip_select,
    input  [3:0] address,
    inout  [3:0] data   // Bidirectional data bus 
);

reg [3:0] buffer [0:15]; // 16 locations, each 4 bits
reg [3:0] temp_data;      // Holds data during read
integer i;

// Output control (Tri-state buffer)
assign data = (chip_select && read_enable && !write_enable) ? temp_data : 4'bz;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        for (i = 0; i < 16; i = i + 1)
            buffer[i] <= 4'b0000; // Reset all memory
        temp_data <= 4'b0000;
    end
    else if (chip_select && write_enable && !read_enable) begin
        buffer[address] <= data;  // Write to memory
    end
    else if (chip_select && read_enable && !write_enable) begin
        temp_data <= buffer[address]; // Read from memory
    end
end

endmodule
