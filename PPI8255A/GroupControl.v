`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:06 11/25/2018 
// Design Name: 
// Module Name:    GroupControl 
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
module GroupControl_A(
    input [7:0] Bus,
    input Enable,
	 input Reset,
    output reg BigPort,
    output reg [4:0]SmallPort
    );
	 

	always @(Enable, Reset)
	begin
		if (Enable == 1 && Bus[7] == 1'b0 && Bus[3] == 1'b1)          // BSR Mode
		begin
			SmallPort[0] <= 1'b1;
			SmallPort[1] <= 1'b1;
			SmallPort[3:2] <= Bus[2:1];
			SmallPort[4] <= Bus[0];			
		end
		else if (Enable == 1 && Bus[7] == 1'b1)
		begin
			BigPort <= ~Bus[1];          // Send 1 For Output & 0 For Input .... Reversed than the datasheet because of a Stupid design choice 
			SmallPort[0] <= ~Bus[0];     // Same Here ^_^
			SmallPort[4:1] <= 4'bzzzz;
		end
		else if (Reset == 1)
		begin
			BigPort <= 0;
			SmallPort <= 5'b00000;
		end

	end



endmodule
