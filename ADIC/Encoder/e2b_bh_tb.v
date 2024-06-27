`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:46:06 05/09/2023
// Design Name:   e2b_bhw_tb
// Module Name:   D:/DSD USING VERILOG/fulladder/behaviouraldescription_programs/e2b_bh_tb.v
// Project Name:  behaviouraldescription_programs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: e2b_bhw_tb
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module e2b_bh_tb;

	// Inputs
	reg [3:0] e;

	// Outputs
	wire [3:0] b;

	// Instantiate the Unit Under Test (UUT)
	e2b_bhw_tb uut (
		.e(e), 
		.b(b)
	);

	initial e=4'b0000;
	always #20 e=e+4'b0001;
		// Initialize Inputs
		

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	
      
endmodule

