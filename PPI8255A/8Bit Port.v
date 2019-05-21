module EightBitPort ( ControlEnable , GroupControl , BigBus ,SmallBus );
input  ControlEnable , GroupControl;
inout [7:0] BigBus;
inout [7:0] SmallBus;

 assign  SmallBus = (GroupControl && ControlEnable)? BigBus: 8'bzzzzzzzz ;
 assign  BigBus = (!GroupControl && ControlEnable)? SmallBus: 8'bzzzzzzzz ;
endmodule

module test ();

reg enable;
reg control;

 reg [7:0] A ;
 reg [7:0] B ;


initial
begin
$monitor("%b , %b , %b , %b" ,enable , control , A , B);
 enable = 1;
 control = 1;
 A = 8'b00000000;
 B = 8'b11111111;

end

EightBitPort porty (enable,control,A,B );


endmodule 