module mealy(
    input clk, rst,
    input [1:0] coin, //00 = 0 cent, 01 = 5 cents, 10 = 10 cents 
    output reg out
);
localparam S0 = 2'b00, S5 = 2'b01, S10 = 2'b10;
reg [1:0] present_state, next_state;

//OUTPUT LOGIC & NEXT STATE COMBINATIONAL LOGIC (Both depends upon Present State and Inputs)
always @ (*) begin
    casez ({coin,present_state})
        {2'b00,S0}: begin
            next_state = S0; out = 0;
        end
        {2'b01,S0}, {2'b00,S5} : begin
            next_state = S5; out = 0;
        end
        {2'b10,S0}, {2'b01,S5}, {2'b00,S10} : begin 
            next_state = S10; out = 0;
        end
        {2'b10,S5}, {2'b01,S10}, {2'b10,S10}: begin
            next_state = S0; out = 1;
        end
        default: begin 
            next_state = S0; out = 0;
        end    
    endcase
end

// STATE REGISTER SEQUENTIAL LOGIC
always @ (posedge clk or posedge rst) begin
    if (rst) present_state <= S0;
    else present_state <= next_state;
end

endmodule