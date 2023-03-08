module MDR(
	input clk, clear, MDRin, read, 
	input [31:0] BusMuxOut, 
	input [31:0] Mdatain,
	output [31:0] BusMuxInMDR); 

//reg [31:0] Din;
//reg [31:0] In;
reg [31:0] Din;

always @ (posedge clk)
begin
	if(MDRin) begin
		if(clear) Din <= 32'b0;
		if(read)	Din <= Mdatain;
		else Din <= BusMuxOut;
	end
end
assign BusMuxInMDR = Din;
endmodule