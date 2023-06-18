// Code your design here
module Transition_Calculator(CLK,Load,Clear,Data,Count);
  input CLK, Load, Clear;
  input[9:0] Data;
  output reg[4:0] Count;
  integer i;
  always @(posedge CLK,negedge Clear,Data)
    begin
      if(Clear==0)
        Count= 0;
      
      else if(Load==1 && CLK==1) begin
                Count= 0;
        for(i=0;i<9 ; i=i+1)
          begin
            if(Data[i]!= Data[i+1])
              Count= Count+1;
            else ;
          end end
    end
endmodule