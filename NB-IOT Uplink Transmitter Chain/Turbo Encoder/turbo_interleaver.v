`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:58 07/28/2024 
// Design Name: 
// Module Name:    turbo_interleaver 
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
module turbo_interleaver #(parameter K=40)(in_data,out_data);

   input [0:K-1]in_data;//msb to lsb;
   output reg [0:K-1]out_data;
   integer i;
   reg[11:0]out_index;
	reg [9:0]f1,f2;
   always @(*)
     begin 
        for(i=0;i<K;i=i+1)
      //for(i=K;i>0;i=i-1)
           begin
			     get_f1_f2(K,f1,f2);
              out_index=((f1*i)+(f2*i*i))%K;
              //$display("%d",out_index);
              out_data[i]=in_data[out_index];
				  
            end
      end

task get_f1_f2;
    input  [11:0] k;   
    output reg [9:0] f1;  
    output reg [9:0] f2;  
 case(k)
 12'd40: begin
 f1= 10'd3;
 f2= 10'd10;
 end
12'd48:begin
 f1= 10'd7;
 f2= 10'd12; 
 end
 12'd56:begin
f1= 10'd19; 
f2=10'd42; 
end  
12'd64: begin
f1= 10'd7; 
f2=10'd16;  
end  
12'd72:begin
f1= 10'd7;
f2= 10'd18;
end  
12'd80:begin
f1= 10'd11;
f2= 10'd20; 
end
12'd88:begin
f1= 10'd5;
f2=10'd22; 
end  
 12'd96:begin
f1= 10'd11;
f2=10'd24;   
end
12'd104:begin 
f1=10'd7;
f2=10'd26;
end
   
 12'd112:begin
		  f1=10'd41; 
		  f2=10'd84;
end		  
        12'd120:begin
f1=10'd103; 
f2=10'd90;  
end
        12'd128:begin 
		 f1=10'd15; f2=10'd32;
end		 
        12'd136:begin
		  f1=10'd9; f2=10'd34;
end		  
        12'd144:begin
		  f1=10'd17; f2=10'd108;
end		 
   12'd152:begin
f1=10'd9; f2=10'd38;
end
   
        12'd160:begin
		  f1=10'd21; f2=10'd120;
end		  
        12'd168:begin
		  f1=10'd101; f2=10'd84;
end
		  
        12'd176: begin f1=10'd21; f2=10'd44;end		  // K=176, f1=9, f2=58
        12'd184: begin f1= 10'd57; f2=10'd46;end   // K=184, f1=9, f2=68
        12'd192: begin f1=10'd23; f2= 10'd48;end   // K=192, f1=9, f2=60
        12'd200: begin f1=10'd13; f2=10'd50;end  // K=200, f1=21, f2=80
        12'd208: begin f1= 10'd27; f2=10'd52;end   // K=208, f1=9, f2=88
        12'd216: begin f1=10'd11; f2=10'd36; end  // K=216, f1=9, f2=72
        12'd224: begin f1=10'd27; f2=10'd56; end  // K=224, f1=9, f2=92
        12'd232: begin f1=10'd85;f2= 10'd58;end   // K=232, f1=9, f2=78
        12'd240: begin f1=10'd29; f2= 10'd60; end // K=240, f1=33, f2=100
      12'd248: begin f1=10'd33; f2=10'd62;end   // K=248, f1=9, f2=82
        12'd256: begin f1=10'd15;f2= 10'd32;end  // K=256, f1=11, f2=82
      12'd264: begin f1=10'd17; f2= 10'd198;end  // K=264, f1=21, f2=98
     12'd272: begin f1=10'd33; f2=10'd68;end // K=272, f1=33, f2=108
        12'd280:begin f1= 10'd103; f2= 10'd210;end // K=280, f1=15, f2=120
       12'd288:  begin f1=10'd19; f2= 10'd36;end // K=288, f1=11, f2=102
       12'd296: begin f1=10'd19; f2= 10'd74;end // K=296, f1=15, f2=118
        12'd304: begin f1=10'd37; f2= 10'd76;end // K=304, f1=35, f2=112
       12'd312: begin f1=10'd19; f2= 10'd78;end   // K=312, f1=9, f2=80
    12'd320: begin f1= 10'd21; f2= 10'd120;end // K=320, f1=15, f2=116
        12'd328: begin f1= 10'd21; f2=10'd82;end // K=328, f1=27, f2=110
      12'd336:begin f1= 10'd115; f2=10'd84;end  // K=336, f1=9, f2=106
       12'd344: begin f1= 10'd193; f2= 10'd86; end // K=344, f1=9, f2=100
     12'd352: begin f1= 10'd21;f2= 10'd44;end  // K=352, f1=9, f2=112
       12'd360:begin f1= 10'd133; f2= 10'd90;end  // K=360, f1=9, f2=114
12'd368: begin f1= 10'd81; f2=10'd46;end // K=368, f1=27, f2=108
       12'd376: begin f1= 10'd45; f2=10'd94;end  // K=376, f1=9, f2=100
		  12'd384: begin f1= 10'd23;f2= 10'd48;end
		 12'd392: begin f1= 10'd243; f2= 10'd98;end
		12'd400: begin f1= 10'd151;f2= 10'd40;end
		 12'd408:begin f1= 10'd155;f2= 10'd102;end
		  12'd416:begin f1= 10'd25; f2=10'd52;end
		12'd424: begin f1= 10'd51;f2= 10'd106;end
	     12'd432: begin f1= 10'd47; f2=10'd72;end
		 12'd440: begin f1=10'd91;f2= 10'd110;end
		 12'd448: begin f1= 10'd29; f2= 10'd168;end
		  12'd456: begin f1= 10'd29; f2= 10'd114;end
		  12'd464: begin f1=10'd247; f2= 10'd58;end
        12'd472: begin f1= 10'd29; f2= 10'd118;end
	  12'd480: begin f1= 10'd89; f2= 10'd180;end
	     12'd488: begin f1= 10'd91;f2= 10'd122;end
	   12'd496: begin f1= 10'd157;f2= 10'd62;end
	    12'd504:begin f1= 10'd55;f2= 10'd84;end
	  12'd512:begin f1= 10'd31;f2= 10'd64;end
	     12'd528: begin f1= 10'd17;f2=10'd66;end
	  12'd544: begin f1= 10'd35;f2= 10'd68;end
		12'd560: begin f1=10'd227; f2= 10'd420;end
		 12'd576: begin f1= 10'd65; f2=10'd96;end
		 12'd592: begin f1= 10'd19;f2= 10'd74;end
		12'd608: begin f1= 10'd37;f2= 10'd76;end
	12'd624: begin f1= 10'd4;f2= 10'd234;end
		12'd640: begin f1=10'd39;f2= 10'd80;end
		12'd656:begin f1= 10'd185;f2= 10'd82;end
	12'd672: begin f1= 10'd43;f2= 10'd252;end
		  12'd688:begin f1= 10'd21;f2= 10'd86;end
		 12'd704: begin f1= 10'd155;f2= 10'd44;end
		12'd720: begin f1= 10'd79; f2= 10'd120;end
		12'd736: begin f1= 10'd139;f2= 10'd92;end
		12'd752:begin f1= 10'd23;f2= 10'd94;end
		12'd768:begin f1= 10'd217;f2= 10'd48;end
	    12'd784:begin f1= 10'd25;f2= 10'd98;end
	   12'd800:begin f1=10'd17; f2=10'd80;end
		12'd816:begin f1= 10'd127;f2= 10'd102;end
  	  12'd832:begin f1= 10'd25; f2= 10'd52;end
		12'd848:begin f1= 10'd239;f2=10'd106;end
	    12'd864: begin f1= 10'd17; f2= 10'd48;end
	  12'd880:begin f1=10'd137;f2= 10'd110;end
	12'd896: begin f1= 10'd215;f2= 10'd112;end   
		12'd912: begin f1=10'd29; f2=10'd114;end
	12'd928: begin f1= 10'd15; f2= 10'd58;end
	12'd944: begin f1=10'd147; f2=10'd118;end
	  12'd960: begin f1=10'd29;f2= 10'd60;end
	  12'd976:begin f1= 10'd59;f2= 10'd122;end
	  12'd992:begin f1= 10'd65; f2=10'd124;end
	  12'd1008:begin f1= 10'd55; f2= 10'd84;end
	  12'd1024:begin f1= 10'd31;f2= 10'd64;end
	   12'd1056:begin f1= 10'd17;f2= 10'd66;end
	 12'd1088: begin f1=10'd171; f2= 10'd204;end
	   12'd1120: begin f1=10'd67;f2= 10'd140;end
12'd1152: begin f1=10'd35; f2=10'd72;end
	 12'd1184: begin f1=10'd19;f2= 10'd74;end
	  12'd1216: begin f1= 10'd39;f2=10'd76;end
	  12'd1248:begin f1=10'd19;f2=10'd78;end
	12'd1280: begin f1=10'd199;f2= 10'd240;end
	  12'd1312: begin f1= 10'd21;f2= 10'd82;end
	   12'd1344: begin f1=10'd211; f2=10'd252;end
	   12'd1376: begin f1=10'd21;f2= 10'd86;end
	  12'd1408: begin f1=10'd43;f2= 10'd88;end
	  12'd1440:begin f1= 10'd149; f2=10'd60;end
	   12'd1472: begin f1=10'd45;f2= 10'd92;end	
		12'd1504:begin f1=10'd49; f2=10'd846;end
	   12'd1536: begin f1=10'd71;f2= 10'd48;end
	   12'd1568: begin f1=10'd13; f2=10'd28;end
	   12'd1600: begin f1=10'd17; f2=10'd80;end
	   12'd1632:begin f1=10'd25; f2= 10'd102;end
	 12'd1664:begin f1= 10'd183;f2= 10'd104;end
	   12'd1696:begin f1= 10'd55;f2=10'd954;end
	   12'd1728:begin f1= 10'd127;f2= 10'd96;end
	12'd1760: begin f1=10'd27;f2= 10'd110;end
	   12'd1792: begin f1=10'd29;f2= 10'd112;end
	   12'd1824:begin f1=10'd29;f2= 10'd114;end
	   12'd1856:begin f1=10'd57;f2= 10'd116;end
12'd1888:begin f1=10'd45;f2= 10'd354;end
12'd1920:begin f1= 10'd31;f2= 10'd120;end
12'd1952:begin f1= 10'd59;f2= 10'd610;end
	   12'd1984: begin f1=10'd185; f2=10'd124;end
	 12'd2016:begin f1= 10'd113; f2=10'd420;end
	  12'd2048:begin f1= 10'd31; f2= 10'd64;end
	   12'd2112:begin f1=10'd17 ;f2= 10'd66;end
	  12'd2176: begin f1=10'd171; f2=10'd136;end
	   12'd2240: begin f1=10'd209;f2= 10'd420;end
	   12'd2304:begin f1= 10'd253; f2=10'd216;end
	  12'd2368: begin f1= 10'd367; f2= 10'd444;end
	 12'd2432: begin f1=10'd265; f2= 10'd456;end
	   12'd2496: begin f1= 10'd181; f2= 10'd468;end
	   12'd2560:begin f1= 10'd39;f2= 10'd80;end
		default: begin f1=10'd0;f2=10'd0;end
    endcase
 endtask
endmodule