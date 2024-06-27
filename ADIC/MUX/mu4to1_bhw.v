module mu4to1_bhw(i,s,y
    );
	 input [3:0]i;
	 input [1:0]s;
	 output y;
	 reg y;
	 always @(i,s)
	 begin
	 y=(~s[1]&(~s[0])&i[0])|(~(s[1])&s[0]&i[1])|(~s[0]&s[1]&i[2])|(s[1]&s[0]&i[3]);
	 end
endmodule
module mux4to1_bhw_tb;

	// Inputs
	reg [3:0] i;
	reg [1:0] s;

	// Outputs
	wire y;

	// Instantiate the Design Under Test (DUT)
	mu4to1_bhw dut (i,s,y
	);

	initial begin
		// Initialize Inputs
		s=2'b00;i=4'b0001;#20;
		s=2'b01;i=4'b0010;#20;
		s=2'b10;i=4'b0100;#20;
		s=2'b11;i=4'b1000;#20;
		s=2'b00;i=4'b1110;#20;
		s=2'b01;i=4'b1101;#20;
		s=2'b10;i=4'b1011;#20;
		s=2'b11;i=4'b0111;#20;

	end
      
endmodule

