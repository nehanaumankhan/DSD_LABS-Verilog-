module alu(
    input [5:0] op1, op2, //operands
    input [2:0] operation,
    output reg [5:0] result,
    output reg [0:0] s_flag, c_flag, z_flag, ov_flag
    );
    reg [5:0] op2_comp;
    reg [6:0] temp;
    localparam  ADD = 3'b000,
                SUB = 3'b001,
                AND = 3'b010,
                OR  = 3'b011,
                XOR = 3'b100,
                NOT = 3'b101,
                LSR = 3'b110,
                LSL = 3'b111;
                
    always@(*)
    begin
        ov_flag = 0;
        c_flag = 0;
        case (operation)
        ADD: 
            begin
                temp = {1'b0, op1} + {1'b0, op2};
                result =  temp[5:0];
                c_flag = temp[6];
                ov_flag = (op1[5] && op2[5] && !result[5]) || (!op1[5] && !op2[5] && result[5]);
            end
         SUB: 
            begin
                op2_comp = ~op2 +1;
                temp = {1'b0, op1} + {1'b0, op2_comp};
                result =  temp[5:0];
                c_flag = ~temp[6]; // 1 = no borrow, 0 = borrow 
                ov_flag = (op1[5] && op2_comp[5] && !result[5]) || (!op1[5] && !op2_comp[5] && result[5]);  
            end
         AND: result = op1 & op2;
         OR : result = op1 | op2;
         XOR: result = op1 ^ op2;
         NOT: result = ~op1;
         LSR: 
            begin 
                result = op1 >> 1;
                c_flag = op1[0]; 
            end
         LSL: 
            begin 
                 result = op1 << 1;
                 c_flag = op1[5]; 
            end
        endcase
        s_flag = result[5];
        z_flag = (result == 6'b000000);
    end
                   
endmodule