module alu (
	input [7:0] op1, op2, 
	input [2:0] operator,
	output reg [7:0] res, 
	output reg s_flag, c_flag, z_flag, ov_flag 	
);
localparam ADD = 3'b000,
           SUB = 3'b001,
           AND = 3'b010,
           OR  = 3'b011,    
           XOR = 3'b100,
           NOT = 3'b101,
           LSL = 3'b110,
           LSR = 3'b111;
reg [8:0] temp;

always @(*) begin 
	//good practice to avoid latches
	c_flag = 0;
	ov_flag = 0;
	res = 0;

	case (operator)
		ADD: 
			begin
				temp = {1'b0, op1} + {1'b0, op2};
				res = temp[7:0];
				c_flag = temp[8];
				// Overflow occurs when:  
				// Two negative numbers are added and an answer comes positive or 
				// Two positive numbers are added and an answer comes as negative. 
				ov_flag = (op1[7] && op2[7] && !res[7]) | (!op1[7] && !op2[7] && res[7]);
			end
		SUB: 
			begin
				temp = {1'b0, op1} - {1'b0, op2};
				res = temp[7:0];
				c_flag = ~temp[8]; //indicating borrow
				ov_flag = (op1[7] != op2[7]) && (res[7] != op1[7]);
			end
		AND: res = op1 & op2;
		OR : res = op1 | op2;
		XOR: res = op1 ^ op2;
		NOT: res = ~op1;
		LSL: res = op1 << 1;
		LSR: res = op1 >> 1;
	endcase 
	//common for all operations
	z_flag = (res == '0);
	s_flag = res[7];
end
endmodule