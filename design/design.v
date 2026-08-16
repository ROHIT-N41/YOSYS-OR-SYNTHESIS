module counter_4bit_up (
 input wire clk,
 input wire reset,
 output reg [3:0] count // ERROR 1: Missing comma
);
always @(posedge clk or posedge reset) begin

 if (reset)
 count <= 4'b0000;
 else
 count <= count + 1; // ERROR 2: Missing semicolon
end
endmodule
