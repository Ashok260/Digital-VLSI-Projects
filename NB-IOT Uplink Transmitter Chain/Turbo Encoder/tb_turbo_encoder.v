`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:14:25 07/28/2024
// Design Name:   turboencoder
// Module Name:   D:/DSD_COURSE_project/start/tb_turbo_encoder.v
// Project Name:  start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: turboencoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_turbo_encoder;
   parameter K=2560;
	// Inputs
	reg clk;
	reg rst;
	reg [0:K-1] din;

	// Outputs
	wire systematic_rsc1;
	wire parity_rsc1;
	wire parity_rsc2;
	wire sys_rsc1;
	wire par_rsc1;
	wire par_rsc2;
	//wire [1:3] m;
	//wire [1:3] n;
	//wire done1,done2;

	// Instantiate the Unit Under Test (UUT)
	turboencoder #(.K(K)) uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.sys_rsc1(sys_rsc1), 
		.par_rsc1(par_rsc1), 
		.par_rsc2(par_rsc2),
		.systematic_rsc1(systematic_rsc1), 
		.parity_rsc1(parity_rsc1), 
		.parity_rsc2(parity_rsc2)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;#3
		rst=0;
	end
	always #5 clk=~clk;
	initial begin
	  //din=40'b0101010101010101010101010101010101010101;
   //din=40'b1110100001111010001011010101101101111110;
	//	din=48'b101000001111010110100000111101011111000111100101;
    //din=48'b101000001111010110100000111101011111000111111000;
		//din=48'b000111111000111110101111000001011010111100000101;
      din=2560'h7edab45e17ce0983e736ec33ee03ecde23225f1318c48b08773ec3249c4846f7264b523ee07f7f984090fba690f7f520814b50ad76664c9addc935e56727638f7f47fc46351d58656c3e03f81ae340939ef49033fa370e809f0cf8a0b6b30e799582897d97d5867c252165e9dfa2a1299bd36ea00e3730b5bd429ee764c8fd55513ed7d7bc6390307c3e22f1c1c57b225d701fced758822d0f2ede3a656e2498daed4f39bd1288d8b55b5220397c1e3a801f350ed19f1ae858d6ef7dd68565ed6c872245e697eaba8e994fa4c5b735e3e126a81499106c067857d736656fefbcdaa01a78e2b6c203b208ffa7241cba0f9c0d203d0a66a52818fe5ef4724250b7b0faa35e294a7b8109485273bc3b040020cd0df0be05596086854a3aba586b06e6047ff700dd871e0e65a4eea6e8bf562f63dfb9dc30755fd79d0b6e7dcd04b5;

    end  
	 
endmodule

