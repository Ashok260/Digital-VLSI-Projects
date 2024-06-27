module dec3to8_case(i,y
    );
	 input [2:0]i;
	 output reg [7:0]y;
	 always @(*)
	   begin
		  case(i)
		   3'b000:y=8'b00000001;
		   3'b001:y=8'b00000010;
		   3'b010:y=8'b00000100;
		   3'b011:y=8'b00001000;
		   3'b100:y=8'b00010000;
		   3'b101:y=8'b00100000;
		   3'b110:y=8'b01000000;
		   3'b111:y=8'b10000000;
		  endcase
		end


endmodule
module dec3to8_case_tb;

	// Inputs
	reg [2:0] i;

	// Outputs
	wire [7:0] y;

	// Instantiate the Design Under Test (DUT)
	dec3to8_case dut (i,y
	);

	initial begin
		// Initialize Inputs
		i=3'b000;#50;
		i=3'b001;#50;
		i=3'b010;#50;
		i=3'b011;#50;
		i=3'b100;#50;
		i=3'b101;#50;
		i=3'b110;#50;
		i=3'b111;#50;


	end
      
endmodule
