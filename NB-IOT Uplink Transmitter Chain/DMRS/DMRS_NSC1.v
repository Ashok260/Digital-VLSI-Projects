`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:42:49 05/18/2024 
// Design Name: 
// Module Name:    DMRS_NSC12 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DMRS_NSC1(clk,y10,y11,y20,y21
    );
	 parameter cos_45=0.707;
	 input clk;
	 output wire [31:0]y10,y11,y20,y21;
	 real_DMRS n1(clk,y10,y11);
	 real_DMRS n2(clk,y20,y21);
	 integer i=0,j=0;
	 always @(posedge clk)
	  begin
	  j=j+1;
	   if(j>17)
		 begin
		    if(i<10240)
			   begin
				 $display("ru(%d)= %b + j %b",i,y10,y20);
				 i=i+1;
				end
			  else if(i>=10240 && i<20480)begin
				  $display("ru(%d)= %b + j %b",i,y11,y21);
				  i=i+1;
				  end
				else begin
				  i=0;
				  j=0;
				 end
				   
			  end
	  end
	 
endmodule
