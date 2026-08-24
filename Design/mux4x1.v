`timescale 1ns/1ps
module mux4x1(
input I0,I1,I2,I3,
input[1:0] S,
output reg Y);

always@(*) begin
case(S)
	2'b00: Y=I0;
	2'b01: Y=I1;
	2'b10: Y=I2;
	2'b11: Y=I3;
	default Y=1'bx;
endcase
end
endmodule
