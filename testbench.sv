// Code your testbench here
// or browse Examples
 `timescale 1ns/1ps

module test_trans;
  reg CLK, Load, Clear;
  reg[9:0] Data;
  wire [4:0] Count;
  integer K,i;
  Transition_Calculator(.CLK(CLK),.Load(Load),.Clear(Clear),.Data(Data),.Count(Count));


initial begin 
  $dumpfile("dump.vcd");
  $dumpvars;
  
  CLK = 0;

  for (K=0;K<1024;K=K+1) begin
      Clear=1;
    Data=K;
    Load=1;
    #40;
  end 
  Clear=1;
    Load=0;
    Data=12;
    #40;
    Clear=0;
     #40;
  
end
  
  
  
  
  //clock generator
initial begin
  for(i =0 ; i<4200; i = i+1)
begin
#10 CLK <= ~CLK;
end
end

  
  initial begin
    $monitor(" time =%2d,Load=%b , Clear=%b , Data=%b, Count=%d",$time,Load,Clear,Data,Count);	
  end
endmodule