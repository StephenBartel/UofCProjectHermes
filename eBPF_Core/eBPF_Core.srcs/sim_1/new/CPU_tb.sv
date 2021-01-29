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


//`include "memory_opcode.svh"
`define fileNames(extension) `"add.extension`"
module CPU_tb(

    );
    
    reg [63:0] instructionFromMem;
    reg [63:0] dataFromMem;
    reg [63:0] firstInstructionAddress = 0;
    reg reset;
    reg clk;
    reg memWrite; 
    reg memRead;
    reg [1:0] sizeSelect;
    reg [63:0] writeData;
    reg [63:0] addressForData;
    reg [63:0] addressForInstruction;
    string file_name;
    
    
    CPU CPU(.instructionFromMem(instructionFromMem), .dataFromMem(dataFromMem), .firstInstructionAddress(firstInstructionAddress)
    ,.reset(reset), .clk(clk), .memWrite(memWrite), .memRead(memRead), .sizeSelect(sizeSelect), .writeData(writeData), .addressForData(addressForData),
    .addressForInstruction(addressForInstruction));
    
    
    reg instruct_read;
    reg data_read;
    instructionMemory instructionMemory(.instructionAddress(addressForInstruction), .instruction(instructionFromMem), .read_instruct(instruct_read), .file_name(file_name));
    dataMemory dataMemory(.clk(clk), .memWrite(memWrite), .memRead(memRead), .sizeSelect(sizeSelect), .writeData(writeData), .readData(dataFromMem), .address(addressForData), .data_read(data_read), .file_name(file_name));
    
    
    
       
   //reg clk;
   
   reg [63:0] instructionRetrieved;
   reg [63:0] addressToAccess;
   reg [63:0] resultFromFile [1:0];
   
   assign instructionRetrieved = instructionFromMem;
   assign addressToAccess = addressForInstruction;
   integer numSuccess = 0;
   
    initial
  	begin
    clk = 0; 
  	     forever
  	         #5 clk = !clk;   
  	end
    
   
initial
begin
    $display("Beginning CPU tests!"); 
    numSuccess = 0;
    file_name = "add";
    instruct_read = 1;
    data_read = 1;
    reset = 1;
    #15 reset = 0;
    $readmemh("add.res" ,resultFromFile);
    $display("Expected result : %h ", resultFromFile[0] );
    $display(CPU.rFile.gprs[0]);
    if(CPU.rFile.gprs[0] == resultFromFile[0]) numSuccess ++ ;
    instruct_read = 0;
    data_read = 0;
    resultFromFile[0] = 0;
    #5;

end


 
endmodule
