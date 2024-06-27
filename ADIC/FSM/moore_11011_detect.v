module moore_11011_detect(clk,reset,din,y
    );
	 input clk,din,reset;
	 output reg y;
	 reg [2:0] cst,nst;
	 parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
	 always @(posedge clk)
	   begin
		  if(reset==1'b1) 
		   cst<=s0;
		  else
		    cst<=nst;
		  end
		
	always @(din or cst)
	begin
	   case(cst)
		 s0: begin
		       if(din==1'b1)
				   begin
					  nst=s1;
					  y=1'b0;
					 end
					else
					 begin
					  nst=s0;
					  y=1'b0;
					 end
				end
		 s1: begin
		       if(din==1'b1)
				   begin
					  nst=s2;
					  y=1'b0;
					 end
					else
					 begin
					  nst=s0;
					  y=1'b0;
					 end
				end
		 s2: begin
		       if(din==1'b0)
				   begin
					  nst=s3;
					  y=1'b0;
					 end
					else
					 begin
					  nst=s2;
					  y=1'b0;
					 end
				end
		 s3: begin
		       if(din==1'b1)
				   begin
					  nst=s4;
					  y=1'b0;
					 end
					else
					 begin
					  nst=s0;
					  y=1'b0;
					 end
				end
		 s4: begin
		       if(din==1'b1)
				   begin
					  nst=s5;
					  y=1'b0;
					 end
					else
					 begin
					  nst=s0;
					  y=1'b0;
					 end
				end
		 s5: begin
		       if(din==1'b1)
				   begin
					  nst=s2;
					   y=1'b1;
					 end
					else
					 begin
					  nst=s3;
					  y=1'b0;
					 end
				end
		endcase
	end
endmodule

module tb_moore_11011_detect;

	// Inputs
	reg clk;
	reg reset;
	reg din;
   reg [31:0]data;
	integer i;
	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	moore_11011_detect uut (
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.y(y)
	);

	initial 
	   begin
		  clk=1'b0;
		  reset=1'b1;#15
		  reset=1'b0;
		 end
	always #5 clk=~clk;
	initial 
	  begin
	    data=32'b01011011011001101101100101101100;
		 #15;
	    for(i=0;i<32;i=i+1)
		  begin
		    din=data[31-i];#10;
			end
		   
		end

      
endmodule

