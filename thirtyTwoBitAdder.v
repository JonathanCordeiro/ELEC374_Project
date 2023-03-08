module thirtyTwoBitAdder(
	c0,
	X,
	Y,
	Gpp,
	Ppp,
	S
);


input wire	c0;
input wire	[31:0] X;
input wire	[31:0] Y;
output wire	Gpp;
output wire	Ppp;
output wire	[31:0] S;

wire	c1;
wire	c2;
wire	c3;
wire	c4;
wire	[31:0] S_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;





SixteenBitAdder	b2v_inst(
	.c0(c0),
	.X(X[15:0]),
	.Y(Y[15:0]),
	.Gpp(SYNTHESIZED_WIRE_1),
	.Ppp(SYNTHESIZED_WIRE_0),
	.S(S_ALTERA_SYNTHESIZED[15:0]));


carrylookaheadlogic	b2v_inst4(
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
	.Gp(Gpp),
	
	.Pp(Ppp));


SixteenBitAdder	b2v_inst5(
	.c0(c1),
	.X(X[31:16]),
	.Y(Y[31:16]),
	.Gpp(SYNTHESIZED_WIRE_3),
	.Ppp(SYNTHESIZED_WIRE_2),
	.S(S_ALTERA_SYNTHESIZED[31:16]));

assign	S = S_ALTERA_SYNTHESIZED;

endmodule