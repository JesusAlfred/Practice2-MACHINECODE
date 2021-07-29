`timescale 1ns / 1ps
module test ();

parameter CLK_PERIOD = 2;

reg fastclk;
reg rst;
reg [3:0]ubData;
reg [3:0]ubCre;
wire [3:0]Cont;
wire led;
wire [3:0]Pc;

always #(CLK_PERIOD) fastclk = ~fastclk;

Top T(
	.fastclk								(fastclk), 
	.rst								(rst), 
	.ubData								(ubData),
	.ubCre							(ubCre),
	.led									(led),
	.Cont								(Cont),
	.Pc					(Pc)
);
initial
begin
	#2 fastclk = 1'b0;
	#2 rst = 1'b1;
	#2 rst = 1'b0;
	#2 rst = 1'b1;
	
	#2 ubData = 4'd4;
	 ubCre = 4'd2;
	#2 rst = 1'b1;
	#2 rst = 1'b0;
	#2 rst = 1'b1;
	#200;
	
	#2 ubData = 4'd2;
	 ubCre = 4'd4;
	
	#200;
	
	
	#2 ubData = 4'd1;
	 ubCre = 4'd1;
	
	#20;
	$display("Fin de simulación");
	$stop;
end

endmodule