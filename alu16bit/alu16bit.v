module alu16bit (
 input [15:0] A, B,
 input [3:0] ALU_Sel, // Operation select
 output reg [15:0] ALU_Out,
 output reg CarryOut
);

 reg [16:0] tmp; // temporary for carry/borrow
 always @(*) begin
 // Default assignments
 tmp = 17'h00000;
 ALU_Out = 16'h0000;
 CarryOut = 1'b0;
 case(ALU_Sel)
 4'b0000: tmp = A + B; // Addition
 4'b0001: tmp = A - B; // Subtraction
 4'b0010: tmp = A & B; // AND
 4'b0011: tmp = A | B; // OR
 4'b0100: tmp = A ^ B; // XOR
 4'b0101: tmp = ~(A | B); // NOR
 4'b0110: tmp = ~(A & B); // NAND
 4'b0111: tmp = ~(A ^ B); // XNOR
 4'b1000: tmp = A << 1; // Logical ShiftLeft
 4'b1001: tmp = A >> 1; // Logical ShiftRight
 4'b1010: tmp = {A[14:0], A[15]}; // Rotate Left
 4'b1011: tmp = {A[0], A[15:1]}; // Rotate Right
 4'b1100: tmp = (A > B) ? 16'd1 : 16'd0; // Greatercomparison
 4'b1101: tmp = (A == B) ? 16'd1 : 16'd0; // Equalcomparison
 default: tmp = 17'h00000;
 endcase
 // Assign outputs
 ALU_Out = tmp[15:0];
 CarryOut = tmp[16];
 end
endmodule
