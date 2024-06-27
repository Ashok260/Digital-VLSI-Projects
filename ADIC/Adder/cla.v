module cla(A,B,Cin,SUM,Cout );
input [3:0] A, B;
input Cin;
output [3:0] SUM;
output Cout;
wire [3:0] G, P, C;
 assign G = A&B;
 assign P = A^B;
 	assign C[0] = Cin;
 	assign C[1] = G[0] | (P[0] & C[0]);
 	assign C[2] = G[1] | ((P[1]&G[0]) | (P[1]&P[0]&C[0]));
assign C[3] = G[2] | ((P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0])); 
assign SUM = A^B^C;
assign Cout = G[3] | ((P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&C[0]));
endmodule

module cla_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Cin;

	// Outputs
	wire [3:0] SUM;
	wire Cout;

	// Instantiate the Design Under Test (DUT)
	cla dut (A,B,Cin,SUM,Cout);

	initial begin
		// Initialize Inputs
		A=4'b0000;B=4'b0011;Cin=1'b0;#100;
		A=4'b1000;B=4'b0001;Cin=1'b0;#100;
		A=4'b0100;B=4'b0111;Cin=1'b0;#100;
		A=4'b0010;B=4'b0101;Cin=1'b0;#100;


	end
      
endmodule

