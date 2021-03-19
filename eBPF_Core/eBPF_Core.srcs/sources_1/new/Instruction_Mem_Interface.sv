`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2021 09:46:32 AM
// Design Name: 
// Module Name: Instruction_Mem_Interface
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


module Instruction_Mem_Interface(
    input reg [63:0] coreAddress,
    input reg [63:0] memInstruction,
    input reg readReady,
    input instructionMemExc,
    input clk,
    output reg readRequest,
    output reg [63:0] memAddress,
    output reg [63:0] coreInstruction
    );
    
    reg [1:0] state;
    reg [2:0] nextState;

    always @(coreAddress) begin
    
        state = 2'b01;
    
    end
    
    always @(posedge clk) begin
        state <= nextState;
    end

    always @(state, coreAddress, readReady) begin
    
        if (state == 2'b00) begin
        
            readRequest = 1'b0;
            memAddress = 64'b0;
        
        end else if (state == 2'b01) begin
        
            // Core Address Changed -> Read Request
            readRequest = 1'b1;
            memAddress = coreAddress;
            nextState = 2'b01;
        
        end else if (state == 2'b10) begin
            
            // Wait until we get readReady
            if (readReady == 1'b1) begin
                
                coreInstruction = memInstruction;
                readRequest = 1'b0;
                nextState = 2'b0;
                
            end
        
        end else begin
        
            // Some random default state
            readRequest = 1'b0;
            coreInstruction = 64'b0;
            memAddress = 64'b0;
            nextState = 2'b0;
        
        end
    
    end
    
endmodule
