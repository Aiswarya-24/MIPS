`timescale 1ns / 1ps
module tb_2;

reg clk1,clk2;
integer k;

mips b (clk1,clk2);

initial
begin
clk1=0;clk2=0;
repeat(50)
begin
#5 clk1=1; #5 clk1=0;         //Two phase clk generation
#5 clk2=1; #5 clk2=0;
end
end


initial
begin
  for (k=0; k<31; k=k+1)
 
     mips.Reg[k]=k;
  mips.Mem[0] = 32'h28010078;      
  mips.Mem[1] = 32'h0c631800;      
  mips.Mem[2] = 32'h20220000;      
  mips.Mem[3] = 32'h0c631800;     
  mips.Mem[4] = 32'h2842002d;     
  mips.Mem[5] = 32'h0c631800;      
  mips.Mem[6] = 32'h24220001;      
  mips.Mem[7] = 32'hfc000000;      
  mips.Mem[120]=85;    
     
mips.HALTED =0;
mips.PC=0;
mips.TAKEN_BRANCH=0;

#500


$display("Mem[120]: %4d /nMem[121]: %4d",
       mips.Mem[120], mips.Mem[121]);

end


  
endmodule
