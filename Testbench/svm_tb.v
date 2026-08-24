`timescale 1ns/1ps
module svm_tb;
reg clk,rst;
reg D0,D1,D2,D3;
reg[1:0] sel;
wire[3:0] C0;
wire[3:0] C1;
wire[3:0] C2;
wire[3:0] C3;
wire[4:0] Total;

svm uut(.clk(clk), .rst(rst), .D0(D0), .D1(D1), .D2(D2), .D3(D3), .sel(sel), .C0(C0), .C1(C1), .C2(C2), .C3(C3), .Total(Total));

initial begin
	$dumpfile("svm.vcd");
	$dumpvars();
	$monitor("time=%d | rst=%d | D0=%b | D1=%b | D2=%b | D3=%b | sel=%2b | C0=%3b | C1=%3b | C2=%3b | C3=%3b | Total=%5b ",$time,rst,D0,D1,D2,D3,sel,C0,C1,C2,C3,Total);
	
end



always #5 clk=~clk;
initial begin
	clk=0; rst=1; D0=0;D1=0;D2=0;D3=0; sel=2'b00; 

	#10 rst=0; 
	sel=2'b00; D0=1;
       	#10 D0=0; 
	
	#10 sel=2'b01; D1=1; 
	#10 D1=0; 

	#10 sel=2'b10; D2=1; 
	#10 D2=0; 

	#10 sel=2'b11; D3=1; 
	#10 D3=0;

	#10 sel=2'b00; D0=1; 
	#10 D0=0; 

	#10 sel=2'b00; D0=1; 
	#10 D0=0; 

	#10 sel=2'b10; D2=1; 
	#10 D2=0;

	#10 sel=2'b01; D1=1; 
	#10 D1=0;

	#10 sel=2'b00; D2=1; 
	#10 D2=0;

        #10 sel=2'b11; D2=1;D3=1;
        #10 D2=0;D3=0;
		
        $finish;
end
endmodule
