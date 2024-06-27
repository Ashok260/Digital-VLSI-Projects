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
module mux2to1_str_tb;

	// Inputs
	reg [1:0]i;
	reg s;

	// Outputs
	wire y;

	// Instantiate the Design Under Test (DUT)
	mux2to1_str dut (i,s,y
	);

	initial begin
		// Initialize Inputs
		s=1'b0;i=2'b10;#100;
		s=1'b0;i=2'b01;#100;
		s=1'b1;i=2'b10;#100;
		s=1'b1;i=2'b01;#100;

	end
      
endmodule

