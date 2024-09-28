`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:02 06/18/2024 
// Design Name: 
// Module Name:    dmrs_all 
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
module dmrs_all(clk,reset,dmrs_en,Nsc,real_part,img_part,dmrs_done
    );
	 parameter Nsc3_phi0=1,Nsc3_phi1=3,Nsc3_phi2=3;
	 parameter Nsc6_phi0=-3,Nsc6_phi1=1,Nsc6_phi2=3,Nsc6_phi3=1,Nsc6_phi4=-3,Nsc6_phi5=-1;
	 parameter Nsc12_phi0=3,Nsc12_phi1=1,Nsc12_phi2=-1,Nsc12_phi3=-1,Nsc12_phi4=3,Nsc12_phi5=3,Nsc12_phi6=-3,Nsc12_phi7=1,Nsc12_phi8=3,Nsc12_phi9=1,Nsc12_phi10=3,Nsc12_phi11=3;
	 parameter three_tone_cs=2;
	 parameter six_tone_cs=2;	  
	 input [3:0]Nsc;
	 input reset,dmrs_en;
	 input clk;
	 output reg[31:0]real_part,img_part;
	 output reg dmrs_done;
	 //reg [1:0]three_tone_cs=2;
	 //reg [1:0]six_tone_cs=3;
	 wire [31:0]y10,y11,y20,y21;
	  reg signed [11:0]angle;
	 reg [7:0]alpha;
	 integer i=0,j=0;
	 real_DMRS n1(clk,reset,y10,y11);
	 real_DMRS n2(clk,reset,y20,y21);
	 always @(posedge clk)
	  begin
	  dmrs_done=1'b0;
	  if(reset==1'b0)begin
	   if(dmrs_en==1)
		begin
		dmrs_done=1'b0;
	    case(Nsc)
		    4'd1: begin
			        	  j=j+1;
	                 if(j>17)
		                begin
		                 if(i<10240)
			                begin
								   real_part=y10;
									img_part=y20;
				               $display("ru(%d)= %b + j %b",i,y10,y20);
				                i=i+1;
				               end
			               else if(i>=10240 && i<20480)begin
								   real_part=y11;
									img_part=y21;
				               $display("ru(%d)= %b + j %b",i,y11,y21);
				               i=i+1;
				               end
				        else begin
				                i=0;
				                j=0;
									 dmrs_done=1'b1;
				              end
				   
			          end

			       end
			 4'd3: begin
			         $display("DMRS sequence for Nsc=%d of three tone cyclic shift=%d,ru(%d) is:",Nsc,three_tone_cs,i);
			         if(three_tone_cs==0)
						  begin
						   alpha=0;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc3_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc3_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc3_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 //i=0;
							 //dmrs_done=1'b1;
							 i=i+1;
							 end
							 else begin
							  dmrs_done=1'b1;
							  i=0;
							  end
							end
						else if(three_tone_cs==1)
						 begin
						   alpha=120;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc3_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc3_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc3_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 //i=0;
							 //dmrs_done=1'b1;
							 i=i+1;
							 end
							 else begin
							  dmrs_done=1'b1;
							  i=0;
							  end
						 end
						else if(three_tone_cs==2)
						 begin
						   alpha=240;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc3_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc3_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc3_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 //i=0;
							 //dmrs_done=1'b1;
							 i=i+1;
							 end
							 else begin
							  dmrs_done=1'b1;
							  i=0;
							  end
						 end
						else begin
						  real_part=0;
						  img_part=0;
						 end
			       end
			 4'd6: begin
			         $display("DMRS sequence for Nsc=%d of six tone cyclic shift=%d , ru(%d) is:",Nsc,six_tone_cs,i);
			         if(six_tone_cs==0)
						  begin
						   alpha=0;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc6_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc6_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc6_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==3)
							 begin
							 angle=((alpha*i)+(Nsc6_phi3 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==4)
							 begin
							 angle=((alpha*i)+(Nsc6_phi4 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==5)
							 begin
							 angle=((alpha*i)+(Nsc6_phi5 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 //i=0;
							 //dmrs_done=1'b1;
							 i=i+1;
							 end
							 else begin
							  i=0;dmrs_done=1'b1;
							 end
						  end
			         else if(six_tone_cs==1)
						  begin
						   alpha=60;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc6_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc6_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc6_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==3)
							 begin
							 angle=((alpha*i)+(Nsc6_phi3 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==4)
							 begin
							 angle=((alpha*i)+(Nsc6_phi4 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==5)
							 begin
							 angle=((alpha*i)+(Nsc6_phi5 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 //i=0;
							 //dmrs_done=1;
							 i=i+1;
							 end
							else begin
							 dmrs_done=1'b1;
							 i=0;
							end
						  end
			       else if(six_tone_cs==2)
						  begin
						   alpha=120;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc6_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc6_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc6_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==3)
							 begin
							 angle=((alpha*i)+(Nsc6_phi3 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==4)
							 begin
							 angle=((alpha*i)+(Nsc6_phi4 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==5)
							 begin
							 angle=((alpha*i)+(Nsc6_phi5 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 //i=0;
							 //dmrs_done=1'b1;
							 i=i+1;
							 end
							else begin
							 i=0;
							 dmrs_done=1'b1;
							 end
						  end
			         else if(six_tone_cs==3)
						  begin
						   alpha=240;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc6_phi0 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc6_phi1 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc6_phi2 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==3)
							 begin
							 angle=((alpha*i)+(Nsc6_phi3 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==4)
							 begin
							 angle=((alpha*i)+(Nsc6_phi4 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==5)
							 begin
							 angle=((alpha*i)+(Nsc6_phi5 * 45));
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 //i==0;
							 //dmrs_done=1;
							 end
							 else begin
							  i=0;
							  dmrs_done=1'b1;
							 end
						  end

						else begin
						  real_part=0;
						  img_part=0;
						 end
			       end
          4'd12:begin
						   alpha=0;
						  if(i==0)begin
							 angle=((alpha*i)+(Nsc12_phi0 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							end
							else if(i==1)
							 begin
							 angle=((alpha*i)+(Nsc12_phi1 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==2)
							 begin
							 angle=((alpha*i)+(Nsc12_phi2 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==3)
							 begin
							 angle=((alpha*i)+(Nsc12_phi3 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==4)
							 begin
							 angle=((alpha*i)+(Nsc12_phi4 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==5)
							 begin
							 angle=((alpha*i)+(Nsc12_phi5 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==6)
							 begin
							 angle=((alpha*i)+(Nsc12_phi6 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;							  
							 end
							else if(i==7)
							 begin
							 angle=((alpha*i)+(Nsc12_phi7 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==8)
							 begin
							 angle=((alpha*i)+(Nsc12_phi8 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==9)
							 begin
							 angle=((alpha*i)+(Nsc12_phi9 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==10)
							 begin
							 angle=((alpha*i)+(Nsc12_phi10 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 end
							else if(i==11)
							 begin
							 angle=((alpha*i)+(Nsc12_phi11 * 45));
							 //$display("%b:%d",angle,angle);
							 get_sin_cos(angle,real_part,img_part);
							 $display("ru(%d)=%b + j %b",i,real_part,img_part);
							 i=i+1;
							 //i=0;
							 //dmrs_done=1'b1;
							 end
                    else begin
						   i=0;
                      dmrs_done=1'b1;
                     end							 
			       end
			default : begin real_part=0;img_part=0;end
		  endcase
		  end
		 end
		  else begin dmrs_done=0; end

	  end

 task get_sin_cos;
        input signed [11:0] angle;
        output reg  [31:0] cos_val;
        output reg  [31:0] sin_val;
        begin
            case (angle)
                45  :   begin sin_val = 32'h3f34fdf4;cos_val = 32'h3f34fdf4; end
               -45  :   begin sin_val = 32'hbf34fdf4;cos_val = 32'h3f34fdf4; end
                135 :   begin sin_val = 32'h3f34fdf4;cos_val = 32'hbf34fdf4; end
               -135 :   begin sin_val = 32'hbf34fdf4;cos_val = 32'hbf34fdf4; end
                375:    begin cos_val = 32'h3f774539;sin_val =32'h3e84816f; end
                255:    begin cos_val = 32'hbe84816f;sin_val = 32'hbf774539; end
                615:    begin sin_val = 32'hbf774539;cos_val = 32'hbe84816f; end
                105:    begin cos_val = 32'hbe84816f;sin_val =32'h3f774539; end
                225:    begin cos_val = 32'hbf34fdf4;sin_val = 32'hbf34fdf4; end
                165:    begin sin_val = 32'h3e84816f;cos_val = 32'hbf774539; end
                405:    begin cos_val = 32'h3f34fdf4;sin_val = 32'h3f34fdf4; end
                345:    begin cos_val = 32'h3f774539;sin_val = 32'hbe84816f; end
                555:    begin sin_val = 32'hbe84816f;cos_val = 32'hbf774539; end
                285:    begin cos_val = 32'h3e84816f;sin_val =32'hbf774539; end
                765:    begin cos_val = 32'h3f34fdf4;sin_val = 32'h3f34fdf4; end
                825:    begin sin_val = 32'h3f774539;cos_val = 32'hbe84816f; end
                1155:    begin cos_val =32'h3e84816f;sin_val =32'h3f774539; end
                default: begin cos_val =0;sin_val=0;end
            endcase
        end
    endtask
endmodule
