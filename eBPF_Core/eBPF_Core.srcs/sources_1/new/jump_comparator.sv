`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 02:40:27 PM
// Design Name: 
// Module Name: jump_comparator
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

`include "jump_opcode.svh"


module jump_comparator(
    input [63:0] a,
    input [63:0] b,
    input jumpOp_e op,
    output reg jump
    );
    
    always_comb @(a, b, op) begin
        case(op)
            JA  : jump = '1;
            JEQ : jump = a == b;
            JGT : jump = a > b;
            JGE : jump = a >= b;
            JSET: jump = & a & b;
            JNE : jump = a != b;
            JSGT: jump = $signed(a) > $signed(b);
            JSGE: jump = $signed(a) >= $signed(b);
            JLT : jump = a < b;
            JLE : jump = a <= b; // Why is this the lte operator??
            JSLT: jump = $signed(a) < $signed(b);
            JSLE: jump = $signed(a) <= $signed(b);
            default: jump = '0;
        endcase
    end


endmodule
