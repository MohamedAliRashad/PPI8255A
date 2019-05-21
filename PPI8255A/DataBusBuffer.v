`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:57 11/25/2018 
// Design Name: 
// Module Name:    DataBusBuffer 
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
module DataBusBuffer(
    inout [7:0] out,
    inout [7:0] in,
	 input Enable
    );
	 
assign out = Enable ? in : 8'bz;

endmodule
