`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:48 04/09/2024 
// Design Name: 
// Module Name:    channel_interleaver 
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

module channel_interleaver (clk,reset,n_slots,in_en,a,y,out_en);
	parameter K=2560;
   //parameter  n_slots = 2;       // Number of slots
	//parameter  n_row=480/n_slots;
	//parameter n_col=6*n_slots;
	input [4:0]n_slots;
   input [0:K+3]a;
	input in_en;
	output reg out_en;
	input clk,reset;
   output reg y;
   reg [0:0] a1[239:0][95:0];
	reg [0:2879]y1;
	reg [1:0]en;
   integer i,j,k;
   integer n;
   always @(posedge clk)
	 begin
      if(reset)
		 begin
		  i=0;
		  j=0;
		  k=0;
		  n=0;
		  en=2'b00;
		 end
		else
		begin
		case(n_slots)
	    5'd2:begin
		 if(in_en==1'b1)begin
		   if(en==2'b00)
		   begin
		    if(n>=0 && n<K+4)
			  begin
			   if(j<=11)
				 begin
				  a1[i][j]=a[n];
				  n=n+1;
				  j=j+1;
				  if(j>11)
				   begin
					 j=0;
					 i=i+1;
					 /*if(i==216)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end */
					end
				end
					 
		  end
		  else begin
			   if(j<=11)
				 begin
				  a1[i][j]=0;
				  n=n+1;
				  j=j+1;
				  if(j>11)
				   begin
					 j=0;
					 i=i+1;
					 if(i==240)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end
					end
				end

		  end
		 end
		 else if(en==2'b01)
		  begin
		    if(n<2880)
			  begin
			   if(i<=239)
				 begin
				  y1[n]=a1[i][j];
				  y=y1[n];
				  n=n+1;
				  i=i+1;
				  if(i==240)
				   begin
					 i=0;
					 j=j+1;
					 if(j==12)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  out_en=1'b1;
						  en=2'b10;
						 end
					end
				end
		   
		  end
		  end
		 else
		  begin
          $display("Matrix a1:");
          for (i = 0; i < 240; i = i + 1) begin
            for (j = 0; j < 12; j = j + 1) begin
              $write("%b ", a1[i][j]);
             end
            $display(""); // Newline after each row
           end
          $display("Matrix y:");
          for (i = 0; i < 2880; i = i + 1) begin
            $write("%b", y1[i]);
          end		   
		  end
		 
		 end
		 end
	    5'd4:begin
		 if(in_en==1'b1)begin
		   if(en==2'b00)
		   begin
		    if(n<K+4)
			  begin
			   if(j<=23)
				 begin
				  a1[i][j]=a[n];
				  n=n+1;
				  j=j+1;
				  if(j>23)
				   begin
					 j=0;
					 i=i+1;
					 /*if(i==216)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end */
					end
				end
					 
		  end
		  else begin
			   if(j<=23)
				 begin
				  a1[i][j]=0;
				  n=n+1;
				  j=j+1;
				  if(j>23)
				   begin
					 j=0;
					 i=i+1;
					 if(i==120)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end
					end
				end

		  end
		 end
		 else if(en==2'b01)
		  begin
		    if(n<2880)
			  begin
			   if(i<=119)
				 begin
				  y1[n]=a1[i][j];
				  y=y1[n];
				  n=n+1;
				  i=i+1;
				  if(i==120)
				   begin
					 i=0;
					 j=j+1;
					 if(j==24)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  out_en=1'b1;
						  en=2'b10;
						 end
					end
				end
		   
		  end
		  end
		 else
		  begin
          $display("Matrix a1:");
          for (i = 0; i < 120; i = i + 1) begin
            for (j = 0; j < 24; j = j + 1) begin
              $write("%b ", a1[i][j]);
             end
            $display(""); // Newline after each row
           end
          $display("Matrix y:");
          for (i = 0; i < 2880; i = i + 1) begin
            $write("%b ", y1[i]);
          end		   
		  end
		 end
		 end
	    5'd8:begin
		 if(in_en==1'b1)begin
		   if(en==2'b00)
		   begin
		    if(n<K+4)
			  begin
			   if(j<=47)
				 begin
				  a1[i][j]=a[n];
				  n=n+1;
				  j=j+1;
				  if(j>47)
				   begin
					 j=0;
					 i=i+1;
					 /*if(i==216)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end */
					end
				end
					 
		  end
		  else begin
			   if(j<=47)
				 begin
				  a1[i][j]=0;
				  n=n+1;
				  j=j+1;
				  if(j>47)
				   begin
					 j=0;
					 i=i+1;
					 if(i==60)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end
					end
				end

		  end
		 end
		 else if(en==2'b01)
		  begin
		    if(n<2880)
			  begin
			   if(i<=59)
				 begin
				  y1[n]=a1[i][j];
				  y=y1[n];
				  n=n+1;
				  i=i+1;
				  if(i==60)
				   begin
					 i=0;
					 j=j+1;
					 if(j==48)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  out_en=1'b1;
						  en=2'b10;
						 end
					end
				end
		   
		  end
		  end
		 else
		  begin
          $display("Matrix a1:");
          for (i = 0; i < 60; i = i + 1) begin
            for (j = 0; j < 48; j = j + 1) begin
              $write("%b ", a1[i][j]);
             end
            $display(""); // Newline after each row
           end
          $display("Matrix y:");
          for (i = 0; i < 2880; i = i + 1) begin
            $write("%b ", y1[i]);
          end		   
		  end
		 end
		 end
	    5'd16:begin
		 if(in_en==1'b1)begin
		   if(en==2'b00)
		   begin
		    if(n<K+4)
			  begin
			   if(j<=95)
				 begin
				  a1[i][j]=a[n];
				  n=n+1;
				  j=j+1;
				  if(j>95)
				   begin
					 j=0;
					 i=i+1;
					 /*if(i==216)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end */
					end
				end
					 
		  end
		  else begin
			   if(j<=95)
				 begin
				  a1[i][j]=0;
				  n=n+1;
				  j=j+1;
				  if(j>95)
				   begin
					 j=0;
					 i=i+1;
					 if(i==30)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end
					end
				end

		  end
		 end
		 else if(en==2'b01)
		  begin
		    if(n<2880)
			  begin
			   if(i<=29)
				 begin
				  y1[n]=a1[i][j];
				  y=y1[n];
				  n=n+1;
				  i=i+1;
				  if(i==30)
				   begin
					 i=0;
					 j=j+1;
					 if(j==96)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  out_en=1'b1;
						  en=2'b10;
						 end
					end
				end
		   
		  end
		  end
		 else
		  begin
          $display("Matrix a1:");
          for (i = 0; i < 30; i = i + 1) begin
            for (j = 0; j < 96; j = j + 1) begin
              $write("%b ", a1[i][j]);
             end
            $display(""); // Newline after each row
           end
          $display("Matrix y:");
          for (i = 0; i < 2880; i = i + 1) begin
            $write("%b ", y1[i]);
          end		   
		  end
		 end
		 end
	    default: y=0;
		 endcase
		 end
	 end

endmodule