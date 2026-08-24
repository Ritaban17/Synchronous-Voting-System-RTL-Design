module svm(
input wire D0,D1,D2,D3,
input wire clk,rst,
input wire[1:0] sel,
output wire[3:0] C0,
output wire[3:0] C1,
output wire[3:0] C2,
output wire[3:0] C3,
output wire[4:0] Total
);

wire[3:0] decoderout;

mux4x1 block1(
	.I0(D0), .I1(D1), .I2(D2), .I3(D3),	
	.S(sel), 
	.Y(y));

decoder2x4 block2(
	.A(sel),
	.en(y),
	.Y(decoderout));

register block3_r0(.R(decoderout[0]), .clk(clk), .rst(rst), .Q(Q0));
register block3_r1(.R(decoderout[1]), .clk(clk), .rst(rst), .Q(Q1));
register block3_r2(.R(decoderout[2]), .clk(clk), .rst(rst), .Q(Q2));
register block3_r3(.R(decoderout[3]), .clk(clk), .rst(rst), .Q(Q3));


upcounter block4_c0(.clk(clk), .rst(rst), .en(Q0), .C(C0));
upcounter block4_c1(.clk(clk), .rst(rst), .en(Q1), .C(C1));
upcounter block4_c2(.clk(clk), .rst(rst), .en(Q2), .C(C2));
upcounter block4_c3(.clk(clk), .rst(rst), .en(Q3), .C(C3));

add block5(.C0(C0), .C1(C1), .C2(C2), .C3(C3), .Total(Total));
endmodule


