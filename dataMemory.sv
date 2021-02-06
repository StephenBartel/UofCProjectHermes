`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 

// Create Date: 01/05/2021 12:50:49 PM
// Design Name: 
// Module Name: dataMemory
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

//`include "memory_opcode.svh";
`include "CPU_tb.sv";
module dataMemory(
    input clk,
    input memWrite, // 1 for writing to memory, 0 is for not. Will always output reads, up to the Mux to select. 
    input memRead, // 1 for reads, 0 for everything else
    input [1:0] sizeSelect, // 00 = word (4 bytes), 01 = half word (2 bytes), 10 = byte (1 byte), 11 = double word (8 bytes)
    input [63:0] writeData,
    output reg [63:0] readData,
    input [63:0] address,
    input data_read,
    input string file_name
    );
    
    parameter numData = 90;
    
    reg[7:0] initMemory[numData -1 :0];
    reg[7:0] byteMemory[numData*8 - 1:0];
    reg [63:0] offset;
    
    always @( posedge data_read)
        begin 
        
        string file_name_new = {file_name,".mem"};
        $readmemh(file_name_new, initMemory);
        
        for (int i = 0; i < numData; i++)
        begin    
                reg [7:0] data = initMemory[i];
                byteMemory[i] = data[7:0];
                /*
                byteMemory[i*8 + 1] = data[15:8];
                byteMemory[i*8 + 2] = data[23:16];
                byteMemory[i*8 + 3] = data[31:24];
                byteMemory[i*8 + 4] = data[39:32];
                byteMemory[i*8 + 5] = data[47:40];
                byteMemory[i*8 + 6] = data[55:48];
                byteMemory[i*8 + 7] = data[63:56];
                */
        end
        
        end
    
    
    
    always @ (memWrite, memRead, address)
    begin
    offset = address;
        if (memWrite == 1'b1 && memRead == 1'b0)
          begin
               byteMemory[offset] = writeData[7:0];
               if(sizeSelect != 2'h2)
               begin
                    byteMemory[offset + 1] = writeData[15:8];
                    if(sizeSelect != 2'h1)
                    begin
                        byteMemory[offset + 2] = writeData[23:16];
                        byteMemory[offset + 3] = writeData[31:24];
                        if(sizeSelect != 2'h0)
                        begin
                            byteMemory[offset + 4] = writeData[39:32];
                            byteMemory[offset + 5] = writeData[47:40];
                            byteMemory[offset + 6] = writeData[55:48];
                            byteMemory[offset + 7] = writeData[63:56];
                        end
                    end
               end
            end
            
        if (memRead == 1'b1 && memWrite == 1'b0)
          begin
              readData = 0;
              readData[7:0] = byteMemory[offset]; 
               if(sizeSelect != 2'h2)
               begin
                    readData[15:8] = byteMemory[offset + 1];
                    if(sizeSelect != 2'h1)
                    begin
                       readData[23:16] = byteMemory[offset + 2]; 
                       readData[31:24] = byteMemory[offset + 3]; 
                        if(sizeSelect != 2'h0)
                        begin
                             readData[39:32] = byteMemory[offset + 4]; 
                             readData[47:40] = byteMemory[offset + 5]; 
                             readData[55:48] = byteMemory[offset + 6]; 
                             readData[63:56] = byteMemory[offset + 7]; 
                        end
                    end
               end
            end
    end
endmodule
