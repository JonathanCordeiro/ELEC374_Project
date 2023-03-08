module ALU(
	input [31:0]YMuxOut, 
	input [31:0]BusMuxOut, 
	input [4:0]ALUControl,
	input ALUin,
	output wire [63:0]ZMuxIn
);
reg [31:0]A;
reg [31:0]B;
reg [63:0]C;
wire [63:0]boothOutput;
wire [31:0]lookaheadOut;
wire [31:0] Q, R;
integer i, x;
lookaheadadder addSub(A,B,ALUControl[2],lookaheadOut);
BoothAlgorithm mul(A, B, boothOutput);
NonRestoringDivision div(A, B, Q, R);

always @ (*) begin
	A = YMuxOut;
	B = BusMuxOut;
	/*
	//add
	if (ALUControl == 5'b00011) begin
		C = A + B;
	end
	//sub
	else if (ALUControl)
	*/
	
	case(ALUControl)
		
		5'b00011 : begin//add
			C = lookaheadOut;
		end
		
		5'b00100 : begin //sub
			C = lookaheadOut;
		end
		
		5'b00101 : begin //and
			for (i =0; i < 32; i = i+ 1) C[i] = A[i] & B[i];
			//C = A & B;
		end
		
		5'b00110 : begin //or
			for (i =0; i < 32; i = i+ 1) C[i] = A[i] | B[i];
			//C = A | B;
		end
		
		5'b00111 : begin //shr
			C = A >> B;
		end
		
		5'b01000 : begin //shra
			C = A >>> B;
		end
		
		5'b01001 : begin //shl
			C = A << B;
		end
		
		5'b01010 : begin //ror
			//C = A >> B;
			//C[31] = YMuxOut[0];
			/*for (x = 0; x < B; x = x+1)begin
				for (i = 0 ; i < 31 ; i = i + 1) begin 
					C[i] = A[i+1];
			  end 
			  C[31] = A[0];
			end*/
			C = (A >> B) | (A << 32-B);
		end
		
		5'b01011 : begin //rol
			//C = A << B;
			//C[0] = YMuxOut[31];
			/*for (i = 1 ; i < 32 ; i = i + 1) begin 
            C[i] = A[i-1];
		  end 
        C[0] = A[31];*/
		  C = (A << B) | (A >> 32-B);
		end
		
		5'b01111 : begin //mul
			C = boothOutput;
		end
		
		5'b10000 : begin //div
			C = {R, Q};
		end
		
		5'b10001 : begin //negate
			for (i =0; i < 32; i = i+ 1) C[i] = ~A[i];
			//C = ~A;
			C = C + 1;
		end
		
		5'b10010 : begin //not
			for (i =0; i < 32; i = i+ 1) C[i] = ~A[i];
			//C = ~A;
		end
		
	endcase
	end	
assign ZMuxIn = C;
endmodule