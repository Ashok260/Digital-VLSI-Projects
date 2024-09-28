`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:24 05/18/2024 
// Design Name: 
// Module Name:    wn 
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
module wn(clk,reset,out1,out2);
   input clk,reset;
	 reg [3:0]mem[0:15];
	 reg [3:0]Wn[0:15];
	 output reg [3:0]out1,out2;
	 reg [3:0]out;
    reg [3:0]r1 [0:10239];  //10240
	 reg [3:0]r2 [0:10239];
	 wire [0:20479] c;
	 integer i=0,j=0,k=0;
	 initial $readmemb("in.txt",mem);
	 DMRS_nsc1_cn i1(clk,reset,c);
	 always @(posedge clk)begin
	 if(reset==1'b0)begin
	  if(i<16)begin
	   out=mem[i];
		Wn[i]=out;
		i=i+1;
		end
     if(i==16 && j<10240)begin  //
		out1=(1-2*c[j])*Wn[j%16];
		r1[j]=out1;	
		//$display("r1(%d)=%b",j,r1[j]);
		j=j+1;
      end
     if(j>=10240 && j<20480) begin
		out2=(1-2*c[j])*Wn[j%16];
		r2[k]=out2;	
		//$display("r2(%d)=%b",j,r2[k]);
		j=j+1;
		k=k+1;
	  end
	 end
	end

endmodule