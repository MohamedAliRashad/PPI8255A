`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:58 11/16/2018 
// Design Name: 
// Module Name:    ReadWriteControl 
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
module ReadWriteControl(
    input RD,						            // Active Low
    input WR,					           	  // Active Low
    input A0,						          // Selection Pin
	 input A1,                       	// Selection Pin			
    input CS,						        // Active Low
	 input Reset,
	 output reg data_bus,				 // Activate Data Buffer Bus
	 output reg [1:0] GControl,		// Group Controls   	      
	 output reg Port_A,
	 output reg Port_B,
	 output reg Port_C_Upper,
	 output reg Port_C_Lower
    );
	 
	 
	 always @(RD, WR, A0, A1, CS, Reset)
	 begin
	 case ({A1,A0,RD,WR,CS, Reset})	 
	 6'b000100: Port_A <= 1'b1;                            // Read From Port A 
	 6'b010100: Port_B <= 1'b1;                            // Read From Port B
	 6'b100100: {Port_C_Upper, Port_C_Lower} <= 2'b11;     // Read From Port C
	 6'b001000: Port_A <= 1'b1;                            // Write To Port A
	 6'b011000: Port_B <= 1'b1;                            // Write To Port B
	 6'b101000: {Port_C_Upper, Port_C_Lower} <= 2'b11;     // Write To Port C
	 6'b111000: GControl <= 2'b11;                         // Read From Bus To Group Control
	 default: {data_bus, GControl, Port_A, Port_B, Port_C_Upper, Port_C_Lower} <= 7'b0000000; // open drain everything if there is a problem
	 endcase
	 end
	
endmodule
