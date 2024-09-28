`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:43:49 05/18/2024
// Design Name:   DMRS_NSC12
// Module Name:   D:/DSD_COURSE_project/DMRS_final/tb_DMRS_NSC12.v
// Project Name:  DMRS_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DMRS_NSC12
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_DMRS_NSC12;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] y10;
	wire [31:0] y11;
	wire [31:0] y20;
	wire [31:0] y21;
   integer f1,f2,n;
	// Instantiate the Unit Under Test (UUT)
	DMRS_NSC1 uut (
		.clk(clk), 
		.y10(y10), 
		.y11(y11), 
		.y20(y20), 
		.y21(y21)
	);

initial begin
		// Initialize Inputs
		clk = 0;
	end
	always #5 clk=~clk;	
	initial begin 
	  	  f1=$fopen("real_img1.txt","w");
		  f2=$fopen("real_img2.txt","w");#170;
	  for(n=0;n<10240;n=n+1)begin
       $fstrobe(f1,"ru(%d)= %b + j %b\n",n,y10,y20);#10;
			end
	  for(n=0;n<10240;n=n+1)
		begin
        $fstrobe(f2,"ru(%d)= %b + j %b\n",n+10240,y11,y21); #10; 
	    end
	       #10 $fclose(f1);
	       #10 $fclose(f2);
	        #1000;$finish;
   end
      
endmodule