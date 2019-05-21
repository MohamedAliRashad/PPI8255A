`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:22:07 11/25/2018
// Design Name:   EightBitPort
// Module Name:   C:/Xilinx/Projects/PPI8255A/EightBitPort_tb.v
// Project Name:  PPI8255A
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EightBitPort
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EightBitPort_tb;

	// Inputs
	reg ControlEnable;
	reg GroupControl;

	// Bidirs
	wire [7:0] Out;
	wire [7:0] In;
	
	//reg [7:0] OUT;
	//reg [7:0] IN;
	
	// Instantiate the Unit Under Test (UUT)
	EightBitPort uut (
		.ControlEnable(ControlEnable), 
		.GroupControl(GroupControl), 
		.Port(Out), 
		.DataBus(In)
	);

	
	assign Out = 8'b101;
	//assign In = IN;

	initial begin
		#10
		$monitor("%b , %b , %b , %b" ,ControlEnable , GroupControl , Out, In);
		ControlEnable <= 0;
		GroupControl <= 0;
		//#10
		//ControlEnable <= 1;
		//GroupControl <= 0;
		#10
		GroupControl <= 0;
		#5
		ControlEnable <= 1;
		#5 
		ControlEnable <= 0;
		#5
		GroupControl <= 1;
		#5 
		ControlEnable <= 1;
				

	end
      
endmodule

