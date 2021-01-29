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
    output [63:0] instruction,
    input read_instruct,
    input string file_name
    );
    
    parameter NumInstructions = 15;
    parameter File = "instructions.txt";
    
    reg [63:0] mem [0 : NumInstructions - 1] ;
    reg [63:0] instructionShifted;
    
    always @ (posedge read_instruct)
    begin
        string file_name_new = {file_name, ".bytes"};
        $readmemh(file_name_new, mem);
    end
    
    assign instructionShifted = instructionAddress >>> 3;
    assign instruction = ((instructionShifted) < NumInstructions)? mem[instructionShifted] : 64'd0;
    //assign instruction = mem[1];
endmodule
