`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:43 05/18/2024 
// Design Name: 
// Module Name:    real_DMRS 
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
module real_DMRS(clk,reset,y1,y2
    );
	 input clk,reset;
	 output reg [31:0]y1,y2;
	 wire [3:0]out1,out2;
	 wn i1 (clk,reset,out1,out2);
	 parameter [31:0] r=32'b00111111001101001111110111110100;
	 parameter [31:0] p=32'b10111111001101001111110111110100;
	 integer i=0,j=0;
	 reg [31:0]r1 [0:10239];  //10240
	 reg [31:0]r2 [0:10239];
	 always @(posedge clk)
	  begin
	   if(reset==1'b0)begin
	    j=j+1;
		if(j>16) begin
	    if(i<10240)
		  begin
		   if(out1==4'b1111)
			 begin
			   y1=p;
			   r1[i]=y1;
				//$display("r1(%d)=%b",i,r1[i]);
				//i=i+1;
			 end
			else begin 
			 y1=r;
			 r1[i]=y1;
			// $display("r1(%d)=%b",i,r1[i]);
			// i=i+1;
			 end
			 i=i+1;
			end
			else begin
			 if(i>=10240 && i<20480)
			  begin
		      if(out2==4'b1111)
			     begin
			     y2=p;
			     r2[i]=y2;
				 // $display("r2(%d)=%b",i,r2[i]);
				 // i=i+1;
			     end
			   else 
				 begin 
				   y2=r;
					r2[i]=y2;
				 //  $display("r2(%d)=%b",i,r2[i]);
					//i=i+1;
				  end
				 	i=i+1;
				 end

			end
		  end
		 end
		end
endmodule