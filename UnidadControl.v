module UnidadControl(
input clk,
input rst,
input [4:0]status,
input [3:0]R,
input [3:0]ubInputData,
input [3:0]ubCredential,

output reg [3:0]oA_T,
output reg [3:0]oB_T,
output reg [3:0]oOp_T, 
output [3:0]ubCont,
output reg vfnLED_On

);




reg [3:0]Pc;
reg [3:0]ubCounter;




assign ubCont = ubCounter;

always @(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		Pc = 4'd0;
		ubCounter = 4'd0;
		vfnLED_On = 1'b0;
	end
	else
	begin
		case (Pc)
			4'd0:
			begin
				oA_T = ubInputData;
				oB_T = ubCredential;
				oOp_T = 4'd0;
				Pc = Pc + 4'd1;
			end
			4'd1:
			begin
				if(status[3])
					Pc = 4'd3;
				else
					Pc = 4'd2;
			end
			4'd2:
			begin
				if(status[4])
					Pc = 4'd6;
				else
					Pc = 4'd8;
			end
			4'd3:
			begin
				oA_T = ubCounter;
				oB_T = 4'd1;
				oOp_T = 4'd13;
				Pc = Pc + 4'd1;
			end
			4'd4:
			begin
				ubCounter = R;
				Pc = Pc + 4'd1;
			end
			4'd5:
			begin
				Pc = 4'd0;
			end
			4'd6:
			begin
				vfnLED_On = 1'd1;
				Pc = Pc +4'd1;
			end
			4'd7:
			begin
				Pc = 4'd10;
			end
			4'd8:
			begin
				oA_T = ubCounter;
				oB_T = 4'd1;
				oOp_T = 4'd0;
				Pc = Pc + 4'd1;
			end
			4'd9:
			begin
				ubCounter = R;
				Pc = Pc + 4'd1;
			end
			4'd10:
			begin
				Pc = 4'd0;
			end
		endcase
	end
end


endmodule
