module fs_case(a,b,bin,d,bout
    );
	 input a,b,bin;
	 output reg d,bout;
	 always @(*)
	  begin
	   case({a,b,bin})
		 3'b000:{d,bout}=2'b00;
		 3'b001:{d,bout}=2'b11;
		 3'b010:{d,bout}=2'b11;
		 3'b011:{d,bout}=2'b01;
		 3'b100:{d,bout}=2'b10;
		 3'b101:{d,bout}=2'b00;
		 3'b110:{d,bout}=2'b00;
		 3'b111:{d,bout}=2'b11;
		 endcase
		 end


endmodule

module fs_case_tb;

	// Inputs
	reg a;
	reg b;
	reg bin;

	// Outputs
	wire d;
	wire bout;

	// Instantiate the Desogn Under Test (DUT)
	fs_case dut (a,b,bin,d,bout
	);

	initial begin
		// Initialize Inputs
		{a,b,bin}=3'b000;#50;
		{a,b,bin}=3'b001;#50;
		{a,b,bin}=3'b010;#50;
		{a,b,bin}=3'b011;#50;
		{a,b,bin}=3'b100;#50;
		{a,b,bin}=3'b101;#50;
		{a,b,bin}=3'b110;#50;
		{a,b,bin}=3'b111;#50;


	end
      
endmodule
