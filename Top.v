module Top(
	input fastclk,
	input rst,
	input [3:0]ubData,
	input [3:0]ubCre,
	output [7:0]disp1,
	output [7:0]disp2,
	output [7:0]disp3,
	output led
);
wire [3:0]A;
wire [3:0]B;
wire [4:0]Status;
wire [3:0]R;
wire [3:0]Op;

wire clk;
wire [3:0]ubCont;



Prescaler P(
	.fast_clock						(fastclk),
	.rst								(rst),
	.enable							(clk)
);


UnidadAritmetica ALU(
	.iA						(A), 
	.iB						(B), 
	.Op							(Op),
	.Status							(Status),
	.R									(R)
);

UnidadControl Uc(
	.clk								(clk),
	.rst								(rst),
	.status							(Status),
	.R									(R),
	.oA_T								(A),
	.oB_T								(B),
	.oOp_T								(Op),
	.ubInputData					(ubData),
	.ubCredential					(ubCre),
	.ubCont							(ubCont),
	.vfnLED_On						(led)
);

dec4bits DecR(
	.num				(ubCont),
	.disp				(disp1[6:0]),
	.sig				(disp1[7])
);

dec4bits DecD(
	.num				(ubData),
	.disp				(disp2[6:0]),
	.sig				(disp2[7])
);

dec4bits DecC(
	.num				(ubCre),
	.disp				(disp3[6:0]),
	.sig				(disp3[7])
);

endmodule
