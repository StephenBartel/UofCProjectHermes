`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 05:32:02 PM
// Design Name: 
// Module Name: instrucitonMemory
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


module instructionMemory(
    input [63:0] instructionAddress,
    output [63:0] instruction
    );
    
    parameter NumInstructions = 15;
    parameter File = "instructions.txt";
    
    reg [63:0] mem [0 : NumInstructions - 1] ;
    
    initial 
    begin
        $readmemh(File, mem);
    end
    
    
    assign instruction = ((instructionAddress) < NumInstructions)? mem[instructionAddress] : 64'd0;
    //assign instruction = mem[1];
endmodule
