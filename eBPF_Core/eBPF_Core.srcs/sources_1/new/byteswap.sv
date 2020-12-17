`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Felipe Cupido
// 
// Create Date: 11/14/2020 02:10:06 PM
// Design Name: 
// Module Name: byteswap
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      Byteswap changes the order of bytes so that the output is either in Big Endian (BE) or Little Endian (LE) ordering.
//      If opcode is 0xd4 then the output is to be in LE ordering. Since our system uses LE by default, this requires no change
//      If the opcode is 0xdc then the output is to be BE. So we reverse the order of our bytes. Note that the bits within any given byte 
//          remain in the same order relative to each other.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module byteswap64(
    input [63:0] src,
    output [63:0] dst,
    input [7:0] opcode
    );
    // We only need to check opcode[3], that is the only bit that changes in the opcode
    assign dst = (opcode[3] == '0)? src : {src[7:0], src[15:8], src[23:16], src[31:24], src[39:32], src[47:40], src[55:48], src[63:56]};  
    
endmodule

module byteswap32(
    input [31:0] src,
    output [31:0] dst,
    input [7:0] opcode
    );
    assign dst = (opcode[3] == '0)? src : {src[7:0], src[15:8], src[23:16], src[31:24]};  
    
endmodule


module byteswap16(
    input [31:0] src,
    output [31:0] dst,
    input [7:0] opcode
    );
    // Only swap the lowest 2 bytes, leave the upper 2 bytes unchaged
    assign dst = (opcode[3] == '0)? src : {src[31:16], src[7:0], src[15:8]};  
endmodule
