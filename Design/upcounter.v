`timescale 1ns/1ps
module upcounter(
input clk, rst,
input  en,
output reg[3:0] C);

always@(posedge clk or posedge rst)begin
if(rst)
C<=4'b0000;
else if(en)
C<=C+1;
end
endmodule

