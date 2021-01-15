`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 10:41:53 AM
// Design Name: 
// Module Name: CPU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU_tb(

    );
    
    wire [63:0] instructionFromMem;
    wire [63:0] dataFromMem;
    wire [63:0] firstInstructionAddress;
    wire reset;
    //wire clk;
    wire memWrite; 
    wire memRead;
    wire [1:0] sizeSelect;
    wire [63:0] writeData;
    wire [63:0] addressForData;
    wire [63:0] addressForInstruction;
    
    
    CPU CPU(.instructionFromMem(instructionFromMem), .dataFromMem(dataFromMem), .firstInstructionAddress(firstInstructionAddress)
    ,.reset(reset), .clk(clk), .memWrite(memWrite), .memRead(memRead), .sizeSelect(sizeSelect), .writeData(writeData), .addressForData(addressForData),
    .addressForInstruction(addressForInstruction));
    
    instructionMemory instructionMemory(.instructionAddress(addressForInstruction), .instruction(instructionFromMem));
    dataMemory dataMemory(.clk(clk), .memWrite(memWrite), .memRead(memRead), .sizeSelect(sizeSelect), .writeData(writeData), .readData(dataFromMem), .address(addressForData));
    
    
    
       
   reg clk;
   
   reg [63:0] instructionRetrieved;
   reg [63:0] addressToAccess;
   
   assign instructionRetrieved = instructionFromMem;
   assign addressToAccess = addressForInstruction;

   
    always
        #5 clk = !clk;
   
  	initial
  	begin
  	     
  	     
  	     for(int i = 0; i< 16; i++)
  	     begin
  	         addressToAccess = i;
  	         #10;
  	     end
  	     
  	end
    
endmodule
