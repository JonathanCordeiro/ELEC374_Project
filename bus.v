module bus (
	//Mux
	input [31:0]BusMuxInR0, input [31:0]BusMuxInR1, input [31:0]BusMuxInR2, input [31:0]BusMuxInR3, input [31:0]BusMuxInR4, input [31:0]BusMuxInR5, input [31:0]BusMuxInR6, input [31:0]BusMuxInR7,
	input [31:0]BusMuxInR8, input [31:0]BusMuxInR9, input [31:0]BusMuxInR10, input [31:0]BusMuxInR11, input [31:0]BusMuxInR12, input [31:0]BusMuxInR13, input [31:0]BusMuxInR14, input [31:0]BusMuxInR15,
	input [31:0]BusMuxInHI, input [31:0]BusMuxInLO, input [31:0]BusMuxInZHI, input [31:0]BusMuxInZLO, input [31:0]BusMuxInZMux, input [31:0]BusMuxInPC, input [31:0]BusMuxInMDR, input [31:0]BusMuxInPortIn, input [31:0]BusMuxInCSign,
	
	//Encoder
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, 
	input R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	input HIout, LOout, ZHIout, ZLOout, ZMuxOut, PCout, MDRout, PortInout, CSignout,
	output S0, S1, S2, S3, S4,
	output wire [31:0]BusMuxOut
);

reg [31:0]q;

always @ (*) begin
/*				(R0out or R1out or R2out or R3out or R4out or R5out or R6out or R7out or 
				R8out or R9out or R10out or R11out or R12out or R13out or R14out or R15out or
				HIout or LOout or ZHIout or ZLOout or PCout or MDRout or PortInout or CSignout
				BusMuxInR0 or BusMuxInR1 or BusMuxInR2 or BusMuxInR3 or BusMuxInR4 or BusMuxInR5 or BusMuxInR6 or BusMuxInR7 or 
				BusMuxInR8 or BusMuxInR9 or BusMuxInR10 or BusMuxInR11 or BusMuxInR12 or BusMuxInR13 or BusMuxInR14 or BusMuxInR15 or 
				BusMuxInHI or BusMuxInLO or BusMuxInZHI or BusMuxInZLO or BusMuxInPC or BusMuxInMDR or BusMuxInPortIn or BusMuxInCSign)*/
	if(R0out) begin
		q = BusMuxInR0;
	end
	if(R1out) begin
		q = BusMuxInR1;
	end
	if(R2out) begin
		q = BusMuxInR2;
	end
	if(R3out) begin
		q = BusMuxInR3;
	end
	if(R4out) begin
		q = BusMuxInR4;
	end
	if(R5out) begin
		q = BusMuxInR5;
	end
	if(R6out) begin
		q = BusMuxInR6;
	end
	if(R7out) begin
		q = BusMuxInR7;
	end
	if(R8out) begin
		q = BusMuxInR8;
	end
	if(R9out) begin
		q = BusMuxInR9;
	end
	if(R10out) begin
		q = BusMuxInR10;
	end
	if(R11out) begin
		q = BusMuxInR11;
	end
	if(R12out) begin
		q = BusMuxInR12;
	end
	if(R13out)begin
		q = BusMuxInR13;
	end
	if(R14out)begin
		q = BusMuxInR14;
	end
	if(R15out)begin
		q = BusMuxInR15;
	end
	if(HIout)begin
		q = BusMuxInHI;
	end
	if(LOout)begin
		q = BusMuxInLO;
	end
	if(ZHIout)begin
		q = BusMuxInZHI;
	end
	if(ZLOout)begin
		q = BusMuxInZLO;
	end
	if(ZMuxOut) begin
		q = BusMuxInZMux;
	end
	if(PCout)begin
		q = BusMuxInPC;
	end
	if(MDRout)begin
		q = BusMuxInMDR;
	end
	if(PortInout)begin
		q = BusMuxInPortIn;
	end
	if(CSignout) begin
		q =  BusMuxInCSign;
	end
end
assign BusMuxOut = q;
endmodule