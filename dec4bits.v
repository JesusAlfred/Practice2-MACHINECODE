module dec4bits(
input [3:0] num,
output reg [6:0] disp,
output reg sig
);

always @(*)
begin
	case (num)
		4'b0000:
			begin
				sig = ~1'b0;
				disp = ~7'b0111111;
			end
		4'b0001:
			begin
				sig = ~1'b0;
				disp = ~7'b0000110;
			end
		4'b0010:
			begin
				sig = ~1'b0;
				disp = ~7'b1011011;
			end
		4'b0011:
			begin
				sig = ~1'b0;
				disp = 7'b0110000;
			end
		4'b0100:
			begin
				sig = ~1'b0;
				disp = 7'b0011001;
			end
		4'b0101:
			begin
				sig = ~1'b0;
				disp = 7'b0010010;
			end
		4'b0110:
			begin
				sig = ~1'b0;
				disp = 7'b0000011;
			end
		4'b0111:
			begin
				sig = ~1'b0;
				disp = 7'b1111000;
			end
		4'b1000:
			begin
				sig = ~1'b1;
				disp = 7'b0000000;
			end
		4'b1001:
			begin
				sig = ~1'b1;
				disp = 7'b1111000;
			end
		4'b1010:
			 begin
				sig = ~1'b1;
				disp = 7'b0000011;
			end
		4'b1011:
			begin
				sig = ~1'b1;
				disp = 7'b0010010;
			end
		4'b1100:
			begin
				sig = ~1'b1;
				disp = 7'b0011001;
			end
		4'b1101:
			begin
				sig = ~1'b1;
				disp = 7'b0110000;
			end
		4'b1110:
			begin
				sig = ~1'b1;
				disp = ~7'b1011011;
			end
		4'b1111:
			begin
				sig = ~1'b1;
				disp = ~7'b0000110;
			end
	endcase
end

endmodule
