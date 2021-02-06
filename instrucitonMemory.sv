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
    input string file_name,
    input reset
    );
    
    parameter NumInstructions = 60;
    parameter File = "instructions.txt";
   
   typedef logic [63:0] memLine ;
    
    memLine mem [NumInstructions - 1 : 0] ;
    reg [63:0] instructionShifted;
    string file_name_new ;
    always @ (posedge read_instruct)
    begin
        for(int i = 0 ; i < NumInstructions ; i++)
        begin
            mem[i] = 64'h95;
        end
        file_name_new = {file_name, ".bytes"};
        $readmemh(file_name_new, mem);
    end
    
    always @(posedge reset)
    begin
        
    end
    
    assign instructionShifted = instructionAddress >>> 3;
    assign instruction = ((instructionShifted) < NumInstructions)? mem[instructionShifted] : 64'd0;
    //assign instruction = mem[1];
endmodule
