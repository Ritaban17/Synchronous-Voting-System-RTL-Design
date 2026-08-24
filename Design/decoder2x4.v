module decoder2x4(
input[1:0] A,
input en,
output reg[3:0] Y);

always@(A[1:0],en) begin
	if(!en)
		Y=4'b0000;
	else
		case(A)
			2'b00: Y[0]=1'b1;
			2'b01: Y[1]=1'b1;
			2'b10: Y[2]=1'b1;
			2'b11: Y[3]=1'b1;
		endcase
	end

	endmodule
