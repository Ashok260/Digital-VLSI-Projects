module memor_ram(addr,data_in,wr,cs,oe,clk
    );
	 parameter addr_width=10;
	 parameter data_width=8;
	 parameter depth=1024;
	 input [addr_width-1:0]addr;
	 input [data_width-1:0]data_in;
	 input wr,cs,oe,clk;
	 reg [data_width-1:0] mem [depth-1:0];
	 reg [data_width-1:0]temp_data;
	 always@(posedge clk)
	  begin
	   if(cs&wr)
		  mem[addr]<=data_in;
		 end
		always@(posedge clk)
		begin
		if(cs&!wr)
		 temp_data<=mem[addr];
		end
	assign data_in=cs&oe&!wr?temp_data:8'hz;
	/*initial begin
	repeat(20)
	begin
	 $display("Address: %b, Data: %b",addr,data_in);
	 end
	end*/
endmodule

module memory_ram_tb;

	// Inputs
	reg [9:0] addr;
	reg [7:0]data_in;
	reg wr;
	reg cs;
	reg oe;
	reg clk;
	integer k,myseed,i;

	// Instantiate the Design Under Test (DUT)
	memor_ram dut (addr,data_in,wr,cs,oe,clk
	);
	initial clk=1'b0;
	always #10 clk=~clk;
	

	initial begin
	// Initialize Inputs
	for(k=0;k<1024;k=k+1)

	  begin
	   #10 data_in=(k+20*k)%256;wr=1;cs=1;
	   #2 addr=k;cs=0;
		cs=1;oe=1;
		 $display("Address: %d, Data: %b",addr,data_in);
	  end
	/*for(i=0;i<1024;i=i+1)
	  begin
	    #10 addr=i;
		cs=1;oe=1;
		 $display("Address: %d, Data: %b",addr,data_in);
	  end*/	
        end
	/* repeat(20)
	  begin
	    #2 addr=$random(myseed)%1024;
		cs=1;oe=1;
		 $display("Address: %d, Data: %b",addr,data_in);
		 end
	  
          end */
   initial myseed =35;
endmodule
