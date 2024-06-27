`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:25 05/22/2024 
// Design Name: 
// Module Name:    car_parking_system 
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
module car_parking_system(clk,reset,vehicle,vehicle_password,front_sensor,back_sensor
    );
	 parameter START=3'b000;
	 parameter VEHICLE_DETECT=3'b001;
	 parameter WAIT_FOR_PASSWORD=3'b010;
	 parameter WRONG_PASSWORD=3'b011;
	 parameter RIGHT_PASSWORD=3'b100;
	 parameter VEHICLE_PARKED=3'b101;
	 parameter STOP=3'b110;
	 input clk,reset;
	 input [3:0]vehicle;                  //vehicle number
	 input [3:0]vehicle_password;
	 output reg front_sensor;             //detects vehicle
	 output reg back_sensor;              //detect exit of vehicle and parked
	 reg [3:0] vehicle_mem [0:5];         // memory to store vehicle number
	 //reg [3:0] vehicle_password1 [0:5];          //vehicle password
	 reg [3:0]pc=4'b0000;                         //Points vehicle and also the coounter to store number of vehicles parked
	 reg [2:0]k;                         //counter to keep track of number of times wrong password as been entered
	 //integer k=0;
	 reg [3:0]current_state,next_state;
	// initial begin
	 // vehicle_password1[0] = 4'b0000;
	 // vehicle_password1[1] = 4'b0001;
	  //vehicle_password1[2] = 4'b0010;
	 // vehicle_password1[3] = 4'b0011;
	 // vehicle_password1[4] = 4'b0100;
	 // vehicle_password1[5] = 4'b0101;
	// end
	  
	 always @(posedge clk)
	  begin
	    if(reset==1'b1)
		  begin
		   current_state<=START;
		  end
		 else begin
		   current_state<=next_state;
		  end
	  end
	  
	 always @(current_state)
	  begin
	    case(current_state)
		   START:begin
			       if(reset==1'b1)
					   begin
						  k=3'd0;
						end
			       vehicle_mem[pc]=vehicle;
					 next_state=VEHICLE_DETECT;
			      end
			VEHICLE_DETECT:begin
			                if(  vehicle_mem[pc]== vehicle)
								   begin
									  front_sensor=1;
									  next_state=WAIT_FOR_PASSWORD;
									  $monitor($time,"vehicle=%b",vehicle_mem[pc]);
									end
								 else 
								   begin
									  next_state=START;
									end
								end
			WAIT_FOR_PASSWORD:begin
			                    if(front_sensor==1)
									    begin
										  if(vehicle_password==4'b0110)
										    begin
											   next_state=RIGHT_PASSWORD;
											 end
											else
											 begin
											   next_state=WRONG_PASSWORD;
											 end
										 end
										else
										  begin
										   front_sensor=0;
										   next_state=START;
										  end  
			                  end
			WRONG_PASSWORD:begin
			                if(k<3'd3)
								  begin
									  if(vehicle_password==4'b0110)
										   begin
											   next_state=RIGHT_PASSWORD;
											end
									   else
											begin
											   next_state=WRONG_PASSWORD;
												 
											end
								  end
								 else begin
								      if(k==3'd3)begin
								       pc=pc+4'b0001;
										 if(pc>4'b0101)begin
										  pc=4'b0000;
										 end
										 front_sensor=0;
										 next_state=STOP;
										end
									end
			               end
			RIGHT_PASSWORD:begin
			                 back_sensor=1;
								  pc=pc+4'b0001;
										 if(pc>4'b0101)begin
										  pc=4'b0000;
										 end
								  $monitor($time,"Number of vehicles parked=%d",pc);
								  next_state=STOP;
			               end
		  STOP:begin
		        front_sensor=0;
				  back_sensor=0;
				  next_state=START;
		       end					
		 endcase
	  end
endmodule

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:50:21 05/22/2024
// Design Name:   car_parking_system
// Module Name:   D:/DSD_COURSE_project/carparkingsystem/tb_car_parking_system.v
// Project Name:  carparkingsystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: car_parking_system
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_car_parking_system;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] vehicle;
	reg [3:0] vehicle_password;

	// Outputs
	wire front_sensor;
	wire back_sensor;

	// Instantiate the Unit Under Test (UUT)
	car_parking_system uut (
		.clk(clk), 
		.reset(reset), 
		.vehicle(vehicle), 
		.vehicle_password(vehicle_password), 
		.front_sensor(front_sensor), 
		.back_sensor(back_sensor)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;#9;
		reset=0;
	end
	always #5 clk=~clk;
	initial begin
	 vehicle=4'b0001;#10;
	 vehicle_password=4'b0110;#50;
	 vehicle=4'b0010;#10;
	 vehicle_password=4'b0110;#50;
	 vehicle=4'b0011;#10;
	 vehicle_password=4'b0110;#50;
	 vehicle=4'b0100;#10;
	 vehicle_password=4'b0110;#50;
	 vehicle=4'b0101;#10;
	 vehicle_password=4'b0101;#20;//wrong password
	 vehicle_password=4'b0110;//correct password after two attempts
    #20 $finish;
	end
      
endmodule

