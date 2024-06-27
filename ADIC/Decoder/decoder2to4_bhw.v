module decoder2to4_bhw(i,y
    );
	 input [1:0] i;
    output [3:0]y;
	 reg [3:0]y;
	 always @(i)
	 begin
	  y[0]=(~i[1])&(~i[0]);
	  y[1]=(~i[1])&i[0];
	  y[2]=i[1]&(~i[0]);
	  y[3]=i[1]&i[0];
	  end

endmodule
module decoder_bhw_tb;

	// Inputs
	reg [1:0] i;

	// Outputs
	wire [3:0] y;

	// Instantiate the Design Under Test (DUT)
	decoder2to4_bhw dut (i,y
	);

	initial begin
		// Initialize Inputs
		i[1:0]=2'b00;#100;
		i[1:0]=2'b01;#100;
		i[1:0]=2'b10;#100;
		i[1:0]=2'b11;#100;

	end
      
endmodule

