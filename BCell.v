module BCell(
	x,
	y,
	c,
	G,
	P,
	S
);


input wire	x;
input wire	y;
input wire	c;
output wire	G;
output wire	P;
output wire	S;

wire	P_ALTERA_SYNTHESIZED;




assign	P_ALTERA_SYNTHESIZED = y ^ x;

assign	S = c ^ P_ALTERA_SYNTHESIZED;

assign	G = x & y;

assign	P = P_ALTERA_SYNTHESIZED;

endmodule