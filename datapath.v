module datapath(
	input PCout, IncPC, ZLOout, Zin, CSignout, MDRout,
			PCin, MDRin, MARin, IRin, 
	input [31:0] MDatain,
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
			R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
			clock, read, write, clear,
			ZMuxEnbale, ZSelect, ZMuxOut, AND, aluin,
			
	input [4:0] aluControl,
	input Yin,
	output out
);

wire [31:0] BusMuxOut; 
wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
				BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15;
wire [31:0] BusMuxInZHI, BusMuxInZLO;
wire [31:0] BusMuxInPC, IRout;
wire [31:0] BusMuxInMDR;
wire [31:0] BusMuxInPortIn;
wire Inport;
wire [31:0] BusMuxInCSign;
wire [31:0] BusMuxInY;
wire [31:0] BusMuxInHI, BusMuxInLO;
wire [63:0] ZMuxIn; 
wire [31:0] BusMuxInZMux;

wire HIout, LOout, ZHIout, PortInout;
assign HIout = 0; assign LOout = 0; assign ZHIout = 0; assign PortInout = 0;
//General Purpose Registers
register R0(clear, clock, R0in, BusMuxOut, BusMuxInR0);
register R1(clear, clock, R1in, BusMuxOut, BusMuxInR1);
register R2(clear, clock, R2in, BusMuxOut, BusMuxInR2);
register R3(clear, clock, R3in, BusMuxOut, BusMuxInR3);
register R4(clear, clock, R4in, BusMuxOut, BusMuxInR4);
register R5(clear, clock, R5in, BusMuxOut, BusMuxInR5);
register R6(clear, clock, R6in, BusMuxOut, BusMuxInR6);
register R7(clear, clock, R7in, BusMuxOut, BusMuxInR7);
register R8(clear, clock, R8in, BusMuxOut, BusMuxInR8);
register R9(clear, clock, R9in, BusMuxOut, BusMuxInR9);
register R10(clear, clock, R10in, BusMuxOut, BusMuxInR10);
register R11(clear, clock, R11in, BusMuxOut, BusMuxInR11);
register R12(clear, clock, R12in, BusMuxOut, BusMuxInR12);
register R13(clear, clock, R13in, BusMuxOut, BusMuxInR13);
register R14(clear, clock, R14in, BusMuxOut, BusMuxInR14);
register R15(clear, clock, R15in, BusMuxOut, BusMuxInR15);

//registers
register HI(clear, clock, HIin, BusMuxOut, BusMuxInHI);
register LO(clear, clock, LOin, BusMuxOut, BusMuxInLO);
register ZHI(clear, clock, ZHIin, BusMuxOut, BusMuxInZHI);
register ZLO(clear, clock, ZLOin, BusMuxOut, BusMuxInZLO);
register IR(clear, clock, IRin, BusMuxOut, IRout);
register Y(clear, clock, Yin, BusMuxOut, BusMuxInY);

//Devices
MDR MDR(clock, clear, read, MDRin, BusMuxOut, MDatain, BusMuxInMDR);
register InPort(clear, clock, Inport, BusMuxOut, BusMuxInPortIn);

//register CSign(clear, clock, CSignIn, BusMuxOut, BusMuxInCSign);
ALU alu(BusMuxInY, BusMuxOut, aluControl, aluin, ZMuxIn);
ZMux ZMUX(ZMuxIn, ZSelect, ZMuxEnbale, BusMuxInZMux);


//bus
bus bus(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,
	BusMuxInHI, BusMuxInLO, BusMuxInZHI, BusMuxInZLO, BusMuxInZMux, BusMuxInPC, BusMuxInMDR, BusMuxInPortIn, BusMuxInCSign,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, 
	R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	HIout, LOout, ZHIout, ZLOout, ZMuxOut, PCout, MDRout, PortInout, CSignout,
	S0, S1, S2, S3, S4, BusMuxOut);
assign out = BusMuxInR1;
endmodule
