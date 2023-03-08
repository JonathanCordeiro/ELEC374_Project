module NonRestoringDivision(
		input signed [31:0] Q, M,
		output wire [31:0] quotient, remainder
);

reg [32:0] a, m;
wire [31:0] twosComp;
integer k, i;
assign twosComp = ~M + 1;

reg signed [64:0] divide;
initial a = 32'h000000000;

always @(*) begin
	if(M[31] == 1)begin
		m = twosComp;
		k = 1;
	end
	else begin
		m = M;
		k = 0;
	end
	divide = {a, Q};
	for (i =0; i < 32; i = i + 1) begin
		divide = divide << 1;
		if(divide[64] == 0) begin
			divide[64:32] = divide[64:32] - m;
			divide[0] = 1;
		end
		else if(divide[64] == 1)begin
			divide[64:32] = divide[64:32] + m;
			divide[0] = 0;
		end
		if(divide[64] == 0)
			divide[0] = 1;
		else if(divide[64] == 1)
			divide[0] = 0;
	end
	if(divide[64] == 1)
		divide[64:32] = divide[64:32] + m;
	if(k == 1)
		divide [64:32] = ~divide[64:32] + 1;
end
assign quotient = divide[31:0];
assign remainder = divide[63:32];
endmodule