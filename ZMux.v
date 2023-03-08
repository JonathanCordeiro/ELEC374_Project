module ZMux(
		input [63:0] ZMuxIn,
		input ZSelect,
		input ZMuxEnable,
		output wire [31:0]BusMuxOut
);

reg [31:0]Zout;
always @(ZMuxEnable) begin
	if (ZSelect) begin	
		Zout = ZMuxIn[63:32];
	end
	else begin
		Zout = ZMuxIn[31:0];
	end
end
assign BusMuxOut = Zout;
endmodule