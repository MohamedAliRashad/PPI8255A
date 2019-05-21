`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:50 11/25/2018 
// Design Name: 
// Module Name:    EightBitPort 
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
module EightBitPort(
    input ControlEnable,
    input GroupControl,
	 input Reset,
    inout [7:0] Port,
    inout [7:0] DataBus
    );
	 
	 reg [7:0] Data;

	 assign Port = (ControlEnable && GroupControl)? Data: 8'bz;          // Output Mode <GControl = 1> (Write Operation)
	 assign DataBus = (ControlEnable && !GroupControl)? Data:8'bz;       // Input Mode <GControl = 0> (Read Operation)

	 always @(DataBus or Port)
	 begin
	 if (GroupControl) begin
		Data <= DataBus;
		end
	 else if (!GroupControl) begin
		Data <= Port;
	 end
	 end
	 
	 always @(Reset)
	 begin
	 Data <= 8'b00000000;
	 GroupControl <= 0;
	 end
	
endmodule
