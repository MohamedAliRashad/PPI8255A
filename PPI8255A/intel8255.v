`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:24 11/23/2018 
// Design Name: 
// Module Name:    intel8255 
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
module intel8255(
    input RD,
    input WR,
    input CS,
    input [1:0] A,
    input RESET,
    inout [7:0] DATA_IN,
    inout [7:0] PORT_A,
    inout [7:0] PORT_B,
    inout [7:0] PORT_C
    );
	 wire [7:0] BUS;
	 wire EN_DATA;
	 wire EN_PortA, EN_PortB, EN_PortC_U, EN_PortC_L, EN_GControlA, EN_GControlB;
	 wire GControlA, GControlB, [4:0] GControlC_U, [4:0] GControlC_L;
	
	DataBusBuffer Data(.out(BUS),
    .in(DATA_IN),
	 .Enable(EN_DATA)
    );
	 
	EightBitPort PortA(
	 .Reset(RESET),
    .ControlEnable(EN_PortA),
    .GroupControl(GControlA),
    .Port(PORT_A),
    .DataBus(BUS)
    );
	
	EightBitPort PortB(
    .Reset(RESET),
	 .ControlEnable(EN_PortB),
    .GroupControl(GControlB),
    .Port(PORT_B),
    .DataBus(BUS)
    );

	FourBitPort PortC_Upper(
	 .Reset(RESET),
	 .ControlEnable(EN_PortC_U),
	 .GroupControl(GControlC_U[1:0]),
	 .DataBus(BUS[7:4]),
	 .PortBus(PORT_C[7:4])
	 );
	 
	FourBitPort PortC_Lower(
	 .Reset(RESET),
	 .ControlEnable(EN_PortC_L),
	 .GroupControl(GControlC_L[1:0]),
	 .DataBus(BUS[3:0]),
	 .PortBus(PORT_C[3:0])
	 );
	
	GroupControl_A GroupControl_A(
    .Reset(RESET),
	 .Bus(BUS),		 
    .Enable(EN_GControlA),
    .BigPort(GControlA),
    .SmallPort(GControlC_U),
	 );
	 
	GroupControl_B GroupControl_B(
    .Reset(RESET),
	 .Bus(BUS),		 
    .Enable(EN_GControlB),
    .BigPort(GControlB),
    .SmallPort(GControlC_L),
    );

	ReadWriteControl R/W_Control(
	  .RD(RD),						        
     .WR(WR),					           
    .A0(A[0]),						        
	 .A1(A[1]),                       				
     .Reset(RESET),
	  .CS(CS),						       
	  .data_bus(EN_DATA),				
	  .GControl({EN_GControlA, EN_GControlB}),   	      
	  .Port_A(EN_PortA),
	  .Port_B(EN_PortB),
	  .Port_C_Upper(EN_PortC_U),
	  .Port_C_Lower(EN_PortC_L)
    );

endmodule
