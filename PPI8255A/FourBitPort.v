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
module FourBitPort(
    input ControlEnable,
	 input Reset,
    input [4:0] GroupControl,
    inout [3:0] Port,
    inout [3:0] DataBus
    );
	 
	 reg [3:0] Data;
	 reg [3:0] BSR_Data;

	 assign Port = (GroupControl[0] && ControlEnable)? Data: 4'bz;	           // Output Mode <GControl = 1>
	 assign DataBus = (!GroupControl[0] && ControlEnable)? Data:4'bz;       // Input Mode <GControl = 0>

	always @(DataBus or Port or GroupControl or BSR_Data)
	 begin
	 if (GroupControl[0] && !GroupControl[1]) begin
		Data <= DataBus;
		end
	 else if (GroupControl[0] && GroupControl[1]) begin
		Data <= BSR_Data;
		end
	 else if (!GroupControl[0] && !GroupControl[1]) begin
		Data <= Port;
	   end
	 casex (GroupControl)
	 5'bx001x: BSR_Data[0] <= GroupControl[4];
	 5'bx011x: BSR_Data[1] <= GroupControl[4];
	 5'bx101x: BSR_Data[2] <= GroupControl[4];
	 5'bx111x: BSR_Data[3] <= GroupControl[4];
	 default: BSR_Data <= 4'b0000;
	 endcase
	 
	 end
	 
	 always @(Reset)
	 begin
	 Data <= 4'b0000;
	 end
	
endmodule
