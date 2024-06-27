module dec3to8_str_(i,e,y
    );
	 input [1:0]i;
	 input e;
	 output [7:0]y;
	 wire w;
	 not n1(w,e);
	 dec2to4_str n2(i[1:0],w,y[3:0]);
	 dec2to4_str n3(i[1:0],e,y[7:4]);
endmodule
module dec2to4_str(i,e,y
    );
	 input [1:0]i;
	 input e;
	 output [3:0]y;
	 wire w[2:1];
	 not n1(w[1],i[0]);
	 not n2(w[2],i[1]);
	 and n3(y[0],e,w[2],w[1]);
	 and n4(y[1],e,i[0],w[2]);
	 and n5(y[2],e,w[1],i[1]);
	 and n6(y[3],e,i[0],i[1]);
endmodule
module dec3to8_str_tb;

	// Inputs
	reg [1:0] i;
	reg e;

	// Outputs
	wire [7:0] y;

	// Instantiate the design Under Test (DUT)
	dec3to8_str_ dut (i,e,y
	);

	initial begin
		// Initialize Inputs
		{e,i[1],i[0]}=3'b000;#100;
		{e,i[1],i[0]}=3'b001;#100;
		{e,i[1],i[0]}=3'b010;#100;
		{e,i[1],i[0]}=3'b011;#100;
		{e,i[1],i[0]}=3'b100;#100;
		{e,i[1],i[0]}=3'b101;#100;
		{e,i[1],i[0]}=3'b110;#100;
		{e,i[1],i[0]}=3'b111;#100;

	end
      
endmodule

