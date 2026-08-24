`timescale 1ns/1ps
module register(
input R,
input clk,rst,
output reg Q);

always@(posedge clk or posedge rst)begin
if(rst)
Q<=1'b0;
else
Q<=R;
end
endmodule
