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
module mux4to1_str_tb;

	// Inputs
	reg [3:0] i;
	reg [1:0] s;

	// Outputs
	wire y;

	// Instantiate the design Under Test (DUT)
	mux4to1_str dut (i,s,y
	);

	initial begin
		// Initialize Inputs
		s=2'b00;i=4'b0001;#100
		s=2'b01;i=4'b0010;#100
		s=2'b10;i=4'b0100;#100;
		s=2'b11;i=4'b1000;#100;
		s=2'b00;i=4'b1110;#100
		s=2'b01;i=4'b1101;#100
		s=2'b10;i=4'b1011;#100;
		s=2'b11;i=4'b0111;#100;
	end
      
endmodule

