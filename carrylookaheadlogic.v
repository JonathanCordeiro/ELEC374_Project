module carrylookaheadlogic(
	c0,
	P0,
	G0,
	G1,
	P1,
	P2,
	G2,
	P3,
	G3,
	c1,
	c2,
	c3,
	c4,
	Gp,
	Pp
);


input wire	c0;
input wire	P0;
input wire	G0;
input wire	G1;
input wire	P1;
input wire	P2;
input wire	G2;
input wire	P3;
input wire	G3;
output wire	c1;
output wire	c2;
output wire	c3;
output wire	c4;
output wire	Gp;
output wire	Pp;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;

assign	Gp = SYNTHESIZED_WIRE_5;
assign	Pp = SYNTHESIZED_WIRE_4;



assign	SYNTHESIZED_WIRE_2 = P1 & P2 & P3 & G0;

assign	SYNTHESIZED_WIRE_0 = P0 & P1 & P2 & P3;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_0 & c0;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | G3 | SYNTHESIZED_WIRE_3;

assign	c4 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_8 = G0 & P1;

assign	SYNTHESIZED_WIRE_7 = P0 & c0 & P1;

assign	c1 = G0 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_6 = c0 & P0;

assign	SYNTHESIZED_WIRE_9 = G1 & P2;

assign	SYNTHESIZED_WIRE_1 = G2 & P3;

assign	c2 = SYNTHESIZED_WIRE_7 | G1 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_11 = P2 & P1 & G0;

assign	SYNTHESIZED_WIRE_10 = c0 & P0 & P1 & P2;

assign	SYNTHESIZED_WIRE_3 = G1 & P2 & P3;

assign	c3 = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10 | G2 | SYNTHESIZED_WIRE_11;


endmodule