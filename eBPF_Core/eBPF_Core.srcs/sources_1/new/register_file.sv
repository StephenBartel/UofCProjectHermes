`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 02:23:17 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input clk,
    input [3:0] dst,
    input [3:0] src,
    output logic [63:0] dstRead,
    output logic [63:0] srcRead,
    input logic [63:0] dstWrite,
    input writeEnable
    );
    
    typedef logic [63:0] register;
    
    register [16:0] bank;
    logic [3:0] last_dst;
    
    // read step
    always_ff @(posedge clk) begin
        dstRead <= bank[dst];
        srcRead <= bank[src];
    end
    
    // write step is on opposite edge of clock to prevent data collisions
    always_ff @(negedge clk) begin
        if (writeEnable)
            bank[dst] <= dstWrite;
    end
    
endmodule