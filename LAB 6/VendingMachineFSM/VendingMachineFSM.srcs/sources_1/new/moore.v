module moore(
    input clk, rst,
    input [1:0] coin, //00 = 0 cent, 01 = 5 cents, 10 = 10 cents 
    output reg out
);
localparam S0 = 2'b00, S5 = 2'b01, S10 = 2'b10, S15 = 2'b11 ;
reg [1:0] present_state, next_state;

//NEXT STATE COMBINATIONAL LOGIC (Depends upon Present State and Inputs)
always @ (*) begin
    casez ({coin,present_state})
        {2'b00,S0}: next_state = S0;
        {2'b01,S0}, {2'b00,S5}: next_state = S5;
        {2'b10,S0}, {2'b01,S5}, {2'b00,S10}: next_state = S10;
        {2'b10,S5}, {2'b01,S10}, {2'b10,S10}: next_state = S15;
        default: next_state = S0;    
    endcase
end

// STATE REGISTER SEQUENTIAL LOGIC
always @ (posedge clk or posedge rst) begin
    if (rst) present_state <= S0;
    else present_state <= next_state;
end

//OUTPUT COMBINATIONAL LOGIC
always @(present_state) begin
    case (present_state)
        S15: out = 1'b1;
        default: out = 1'b0;
    endcase
end

endmodule