// and datapath_tb.v file: <This is the filename>
`timescale 1ns/10ps
module and_tb();
	 reg PCout, IncPC, Zlowout, Zin, CSignout, MDRout,
			PCin, MDRin, IRin,
			R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
			R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
			Clock, Read, write, clear, AND, aluin,
			ZMuxEnbale, ZSelect, ZMuxOut, Yin;
	reg [31:0] Mdatain;	
	reg [4:0] aluControl;

	 parameter	Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
					Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
					T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
	reg [3:0] Present_state = Default;

	datapath DUT(	 PCout, IncPC, Zlowout, Zin, CSignout, MDRout,
			PCin, MDRin, MARin, IRin, Mdatain,
			R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
			R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
			Clock, Read, write, clear,
			ZMuxEnbale, ZSelect, ZMuxOut, AND, aluin,
			aluControl,Yin, out);

// add test logic here
initial
	begin
		Clock = 0;
		forever #10 Clock = ~ Clock;
end
always @(posedge Clock) // finite state machine; if clock rising-edge
	begin
		case (Present_state)
			Default : #40 Present_state = Reg_load1a;
			Reg_load1a : #40 Present_state = Reg_load1b;
			Reg_load1b : #40 Present_state = Reg_load2a;
			Reg_load2a : #40 Present_state = Reg_load2b;
			Reg_load2b : #40 Present_state = Reg_load3a;
			Reg_load3a : #40 Present_state = Reg_load3b;
			Reg_load3b : #40 Present_state = T0;
			T0 : #40 Present_state = T1;
			T1 : #40 Present_state = T2;
			T2 : #40 Present_state = T3;
			T3 : #40 Present_state = T4;
			T4 : #40 Present_state = T5;
 
	endcase
 end

always @(Present_state) // do the required job in each state
	begin
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin
								PCout <= 0; Zlowout <= 0; MDRout <= 0; // initialize the signals
								R0out<= 0; R1out<= 0; R2out<= 0; R3out<= 0; R4out<= 0; R5out<= 0; R6out<= 0; R7out<= 0;
								R8out<= 0; R9out<= 0; R10out<= 0; R11out<= 0; R12out<= 0; R13out<= 0; R14out<= 0; R15out<= 0;
								R0in<= 0; R1in<= 0; R2in<= 0; R3in<= 0; R4in<= 0; R5in<= 0; R6in<= 0; R7in<= 0; 
								R8in<= 0; R9in<= 0; R10in<= 0; R11in<= 0; R12in<= 0; R13in<= 0; R14in<= 0; R15in<= 0;
								R2out <= 0; R3out <= 0; Zin <= 0;
								PCin <=0; MDRin <= 0; IRin <= 0; Yin <= 0;
								IncPC <= 0; Read <= 0; AND <= 0;
								ZMuxOut <= 0; CSignout <= 0;
								R1in <= 0; R2in <= 0; R3in <= 0; Mdatain <= 32'h00000000;
			end
			Reg_load1a: begin
									Mdatain <= 32'h00000012;
									Read = 0; MDRin = 0; // the first zero is there for completeness
									#10 Read <= 1; MDRin <= 1;
									#15 Read <= 0; MDRin <= 0;
			end
			Reg_load1b: begin
									#10 MDRout <= 1; R2in <= 1;
									#15 MDRout <= 0; R2in <= 0; // initialize R2 with the value $12
			end
			Reg_load2a: begin
									Mdatain <= 32'h00000014;
									#10 Read <= 1; MDRin <= 1;
									#15 Read <= 0; MDRin <= 0;
			end
			Reg_load2b: begin
									 #10 MDRout <= 1; R3in <= 1;
									 #15 MDRout <= 0; R3in <= 0; // initialize R3 with the value $14
			end
			Reg_load3a: begin
									Mdatain <= 32'h00000018;
									#10 Read <= 1; MDRin <= 1;
									#15 Read <= 0; MDRin <= 0;
			end
			Reg_load3b: begin
									 #10 MDRout <= 1; R1in <= 1;
									 #15 MDRout <= 0; R1in <= 0; // initialize R1 with the value $18
			end

			T0: begin 													// see if you need to de-assert these signals
								#10 PCout <= 1; IncPC <= 1; Zin <= 1;
								#15 PCout <= 0; IncPC <= 0; Zin <= 0;
			end
			T1: begin
								#10 Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
								Mdatain <= 32'h28918000; // opcode for “and R1, R2, R3”
								#15 Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
			end
			T2: begin
								#10 MDRout <= 1; IRin <= 1;
								#15 MDRout <= 0; IRin <= 0;
			end
			T3: begin
								#10 R2out <= 1; Yin <= 1;
								#15 R2out <= 0; Yin <= 0;
			end
			T4: begin
								#10 R3out <= 1; aluControl <= 5'b00101; aluin <= 1;
								#15 R3out <= 0; aluin <= 0;
			end
			T5: begin
							  #10 ZMuxOut <= 1; ZMuxEnbale <= 1; ZSelect <= 0; R1in <= 1;
							  #15 ZMuxOut <= 0; R1in <= 0;
			end
		endcase
	end
endmodule 