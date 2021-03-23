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
    output reg [63:0] instruction,
    input read_request,
    output reg readReady,
    input read_instruct,
    input string file_name,
    input reset
    );
    
    parameter NumInstructions = 5;
    //parameter File = "instructions.txt";
   
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
        $readmemh("add.bytes", mem);
    end
    
    always @(posedge reset)
    begin
        
    end
    always @(*)
    begin
        if(read_request == 1'b1)
        begin
            instructionShifted <= instructionAddress >>> 3;
            instruction <= ((instructionShifted) < NumInstructions)? mem[instructionShifted] : 64'd0;
            readReady <= 1'b1;
        end
    end
    //assign instruction = mem[1];
endmodule
