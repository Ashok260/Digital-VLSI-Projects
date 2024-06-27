module mux8to1_str(i,s,y
    );
	 input [7:0]i;
	 input [2:0]s;
	 output y;
	 wire [2:1]w;
	 mux4to1_str n1(i[3:0],s[1:0],w[1]);
	 mux4to1_str n2(i[7:4],s[1:0],w[2]);
	 mux2to1_str n3(w[2:1],s[2],y);
endmodule
module mux4to1_str(i,s,y
    );
	 input [3:0]i;
	 input [1:0]s;
	 output y;
	 wire [2:1]w;
	 mux2to1_str n1(i[1:0],s[0],w[1]);
	 mux2to1_str n2(i[3:2],s[0],w[2]);
	 mux2to1_str n3(w[2:1],s[1],y);
endmodule
module mux2to1_str(i,s,y
    );
	 input s;
	 input [1:0]i;
	 output y;
	 wire w1,w2,w3;
	 //y=s'i0+si1;
	 not i1(w1,s);
	 and i2(w2,w1,i[0]);
	 and i3(w3,s,i[1]);
	 or i4(y,w2,w3);
endmodule
module mux8to1_str_tb;

	// Inputs
	reg [7:0] i;
	reg [2:0] s;

	// Outputs
	wire y;

	// Instantiate the design Under Test (DUT)
	mux8to1_str dut (i,s,y
	);

	initial begin
		// Initialize Inputs
		s=3'b000;i=8'b00000001;#100;
		s=3'b001;i=8'b00000010;#100;
		s=3'b010;i=8'b00000100;#100;
		s=3'b011;i=8'b00001000;#100;
		s=3'b100;i=8'b00010000;#100;
		s=3'b101;i=8'b00100000;#100;
		s=3'b110;i=8'b01000000;#100;
		s=3'b111;i=8'b10000000;#100;
		s=3'b000;i=8'b11111110;#100;
		s=3'b001;i=8'b11111101;#100;
		s=3'b010;i=8'b11111011;#100;
		s=3'b011;i=8'b11110111;#100;
		s=3'b100;i=8'b11101111;#100;
		s=3'b101;i=8'b11011111;#100;
		s=3'b110;i=8'b10111111;#100;
		s=3'b111;i=8'b01111111;#100;

	end
      
endmodule
