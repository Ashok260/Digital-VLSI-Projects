module comp_1bit_ccase(a,b,g,e,l
    );
	 input a,b;
	 output reg g,e,l;
	 always @(*)
	  begin
	   case({a,b})
		 2'b00:{g,e,l}=3'b010;
		 2'b01:{g,e,l}=3'b001;
		 2'b10:{g,e,l}=3'b100;
		 2'b11:{g,e,l}=3'b010;
		 endcase
		end
endmodule
module comp_1bit_case_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire g;
	wire e;
	wire l;

	// Instantiate the Design Under Test (DUT)
	comp_1bit_ccase dut (a,b,g,e,l
	);

	initial begin
		// Initialize Inputs
		{a,b}=2'b00;#100;
		{a,b}=2'b01;#100;
		{a,b}=2'b10;#100;
		{a,b}=2'b11;#100;

	end
      
endmodule

