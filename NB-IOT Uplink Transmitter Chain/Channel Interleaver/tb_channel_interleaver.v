`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:23 04/09/2024
// Design Name:   channel_interleaver
// Module Name:   D:/DSD USING VERILOG/channelinterleaver/tb_channel_interleaver.v
// Project Name:  channelinterleaver
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: channel_interleaver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_channel_interleaver;
// Inputs
   parameter K=2560;
	//parameter n_slots=4;
	reg [0:K+3] a;
	reg clk;
	reg reset;
	reg in_en;
	reg [4:0]n_slots;
	// Outputs
	wire  y;
	wire out_en;
	// Instantiate the Unit Under Test (UUT)
	channel_interleaver #(.K(K))uut(
	 .clk(clk),
	 .reset(reset),
	 .n_slots(n_slots),
	 .in_en(in_en),
		.a(a), 
		.y(y),
		.out_en(out_en)
	);
	initial begin
	 clk=1;
	 reset=1;#3;
	 reset=0;
	 n_slots=5'd16;
	 in_en=1;
	 end
	always #5 clk=~clk;

	initial begin
		a=2564'h187fff9f72a3300187fc0cffffcccffb3c00cffe19e0001866dc31ff9e00ccc0000cd99119ffcc007660000619d1ccffe6003e78000333064c3fe7801dff9b3007e330033ff980ff9f3c055660030ff9e07fcfcc01fa600187fcf0bfe6cf01519c00cbfe6840064cff9167ff9e0067c0060c3fee5c7fcd0061e003033fe64cffe78030f001930fe8fbbff3001979519f36e187f46dd519f6fd30cc88cff99b3fd3057e33ce8e67fc8b3fe3341566983261ff72e5566188fbae546600fd668fbaa32659ff67802acc3267f1167ddf99803f4c1167f6e5c33559e02a13ee5cad30648b3ffcf335530658ce8f72e7fe6eefcce8f666dc3267ff3ee5466dc3199147ddff999df59916866abf4c0030ccb866aa6ddfaa3380193322ddf995ca8559800c33a3dca8cb3fefc66006662cb3feb0dca1f27edbb248be60ea9358a201a8810 ;
		//$display("%h",y);
		//a=44'b11001100111100110011110011001111001100111100;
		#57620;$finish;
end
 
endmodule