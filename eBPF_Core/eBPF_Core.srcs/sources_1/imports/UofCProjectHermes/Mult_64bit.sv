`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 04:20:38 PM
// Design Name: 
// Module Name: Mult_64bit
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

`include "constants.svh"

module Mult_64bit(
    input [63:0] a,
    input [63:0] b,
    output [63:0] y
    );
    //Can expand or do custom implementation. Reason for implementing as module
    //Used 128 bit result for 2x64bit multiplication. Can truncate or select fewer bits
    //as necessary
    assign y = a*b;
    
endmodule
