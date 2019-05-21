`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:02 11/28/2018 
// Design Name: 
// Module Name:    GroupControl_B 
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
module GroupControl_B(
    input Enable,
    input Reset,
    input [7:0] Bus,
    output BigPort,
    output [4:0] SmallPort
    );

	always @(Enable)
	begin
		if (Bus[7] == 1'b0 && Bus[3] == 1'b0)          // BSR Mode
		begin
			SmallPort[0] <= 1'b1;
			SmallPort[1] <= 1'b1;
			SmallPort[3:2] <= Bus[2:1];
			SmallPort[4] <= Bus[0];			
		end
		else if (Bus_Mode == 1'b1)
		begin
			BigPort <= ~Bus_IO[1];          // Send 1 For Output & 0 For Input .... Reversed than the datasheet because of a Stupid design choice 
			SmallPort_IO <= ~Bus_IO[0];     // Same Here ^_^
		end
	end

	always @(Reset)
	begin
	BigPort <= 0;
	SmallPort <= 5'b00000;
	end



endmodule
