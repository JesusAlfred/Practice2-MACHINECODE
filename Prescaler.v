module Prescaler
#(parameter DATA_WIDTH=24 , parameter MAXCOUNT=24'd25000000)
(
	input fast_clock,
	input rst,
	output enable
);



reg [DATA_WIDTH-1:0] cont;//LLegar a 5000 para 10Khz

assign enable = (cont== MAXCOUNT)? 1'b1:1'b0;

always @(posedge fast_clock or negedge rst)
begin
	if(!rst)
	begin
		cont = {DATA_WIDTH{1'b0}};
	end
	else if(cont<MAXCOUNT)
	begin
		cont = cont + {{(DATA_WIDTH-1){1'b0}}, 1'b1};
	end
	else
		cont = {DATA_WIDTH{1'b0}};
end
endmodule
