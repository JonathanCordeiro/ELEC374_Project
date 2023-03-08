module FourBitAdder(
	c0,
	X,
	Y,
	Gp,
	Pp,
	S
);


input wire	c0;
input wire	[3:0] X;
input wire	[3:0] Y;
output wire	Gp;
output wire	Pp;
output wire	[3:0] S;

wire	c1;
wire	c2;
wire	c3;
wire	c4;
wire	[3:0] S_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;





BCell	b2v_inst(
	.x(X[0]),
	.y(Y[0]),
	.c(c0),
	.G(SYNTHESIZED_WIRE_1),
	.P(SYNTHESIZED_WIRE_0),
	.S(S_ALTERA_SYNTHESIZED[0]));


BCell	b2v_inst1(
	.x(X[1]),
	.y(Y[1]),
	.c(c1),
	.G(SYNTHESIZED_WIRE_3),
	.P(SYNTHESIZED_WIRE_2),
	.S(S_ALTERA_SYNTHESIZED[1]));


BCell	b2v_inst2(
	.x(X[2]),
	.y(Y[2]),
	.c(c2),
	.G(SYNTHESIZED_WIRE_5),
	.P(SYNTHESIZED_WIRE_4),
	.S(S_ALTERA_SYNTHESIZED[2]));


BCell	b2v_inst3(
	.x(X[3]),
	.y(Y[3]),
	.c(c3),
	.G(SYNTHESIZED_WIRE_7),
	.P(SYNTHESIZED_WIRE_6),
	.S(S_ALTERA_SYNTHESIZED[3]));


carrylookaheadlogic	b2v_inst6(
	.c0(c0),
	.P0(SYNTHESIZED_WIRE_0),
	.G0(SYNTHESIZED_WIRE_1),
	.P1(SYNTHESIZED_WIRE_2),
	.G1(SYNTHESIZED_WIRE_3),
	.P2(SYNTHESIZED_WIRE_4),
	.G2(SYNTHESIZED_WIRE_5),
	.P3(SYNTHESIZED_WIRE_6),
	.G3(SYNTHESIZED_WIRE_7),
	.c1(c1),
	.c2(c2),
	.c3(c3),
	.c4(c4),
	.Gp(Gp),
	
	.Pp(Pp));

assign	S = S_ALTERA_SYNTHESIZED;

endmodule