module lookaheadadder(
		input wire [31:0] X,
		input wire [31:0] Y,
		input wire select,
		output wire [31:0]s);

wire c;
reg [31:0] B;
assign c = select;
always @ (*) begin
	B = Y;
	if(select)
		B = ~B;
	end
	
thirtyTwoBitAdder adder(
	.c0(c),
	.X(X[31:0]),
	.Y(B[31:0]),
	.Gpp(g),
	.Ppp(p),
	.S(s[31:0]));
endmodule