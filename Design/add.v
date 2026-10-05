// Add module
module add(
input[3:0] C0,                           
input[3:0] C1,input[3:0] C2,input[3:0] C3,
output reg[4:0] Total);

assign Total=C0+C1+C2+C3;
endmodule
