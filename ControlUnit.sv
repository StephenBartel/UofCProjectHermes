`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2021 01:38:34 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [7:0] opcode,
    output reg regwrite,
    output reg memtoreg,
    output reg memwrite,
    output reg memread, 
    output reg writesrc,
    output reg dstSelect,
    output reg [1:0] immExtend,
    output reg [3:0] Branch,
    output reg [3:0] alucontrol,
    output reg [1:0] alusrca,
    output reg [1:0] alusrcb,
    output reg bit_32
    );
    
    
    always @(*) begin
        
        case(opcode)
        
            8'h00: //Good
                begin
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1;
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b1;
                    dstSelect   <= 1'b1;
                    immExtend   <= 2'b10;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0100;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;
                end
            
            8'h07: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;
                end
            8'h0f:  //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01;
                    bit_32      <= 1'b0;          
                end            
            8'h17: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0001;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;          
                end            
            8'h1f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0001;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01;
                    bit_32      <= 1'b0;        
                end            
            8'h27: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0010;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;      
                end            
            8'h2f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0010;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01;
                    bit_32      <= 1'b0;       
                end            
            8'h37: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0011;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;      
                end            
            8'h3f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0011;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01;
                    bit_32      <= 1'b0;          
                end            
            8'h47: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0; 
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;              
                end            
            8'h4f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;               
                end            
            8'h57: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0101;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;              
                end            
            8'h5f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0101;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                                 
                end            
            8'h67: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0110;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'h6f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0110;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                                
                end            
            8'h77: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0111;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'h7f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0111;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'h87: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'h97: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1001;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                              
                end            
            8'h9f: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1001;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                               
                end            
            8'ha7: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1010;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                 
                end            
            8'haf: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1010;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                               
                end            
            8'hb7: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1011;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'hbf: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1011;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                                
                end            
            8'hc7: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;  
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'hcf: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'h04: //Good
                begin
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                            
                end            
            8'h0c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'h14: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0001;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                             
                end            
            8'h1c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0001;
                    alusrca     <= 1'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'h24: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0010;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h2c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0010;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'h34: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0011;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h3c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0011;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'h44: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h4c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                             
                end            
            8'h54: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0101;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h5c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0101;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'h64: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0; 
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0110;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h6c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0110;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                             
                end            
            8'h74: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0111;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h7c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0111;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                             
                end            
            8'h84: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h94: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1001;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'h9c: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1001;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'ha4: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0;
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1010;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                               
                end            
            8'hac: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;  
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1010;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'hb4: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1011;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                              
                end            
            8'hbc: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1011;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'hc4: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b1;                             
                end            
            8'hcc: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1100;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b1;                              
                end            
            8'hd4: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1101;
                    alusrca     <= 2'b01; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                              
                end            
            8'hdc: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b1110;
                    alusrca     <= 2'b01; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                               
                end            
            8'h18: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b01;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h20: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h28: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                              
                end            
            8'h30: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h38: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h40: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h48: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h50: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h58:  //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h61: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b10;
                    bit_32      <= 1'b0;                             
                end            
            8'h69: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b10;
                    bit_32      <= 1'b0;                             
                end            
            8'h71: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b10;
                    bit_32      <= 1'b0;                             
                end            
            8'h79: //Good
                begin 
                    regwrite    <= 1'b1;
                    memtoreg    <= 1'b1; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b1; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b10;
                    bit_32      <= 1'b0;                             
                end            
            8'h62: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b1; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h6a: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b1; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h72: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b1; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h7a: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b1; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h63: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h6b: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                              
                end            
            8'h73: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                           
                end            
            8'h7b: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b1;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b10;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                             
                end            
            8'h05: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0001;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h15: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0010;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01;
                    bit_32      <= 1'b0;                             
                end            
            8'h1d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0010;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00;
                    bit_32      <= 1'b0;                            
                end            
            8'h25: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0011;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01;
                    bit_32      <= 1'b0;                             
                end            
            8'h2d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0011;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                            
                end            
            8'h35: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0100;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                            
                end            
            8'h3d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0100;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                             
                end            
            8'ha5: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0101;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'had: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0101;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                             
                end            
            8'hb5: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0110;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'hbd: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0110;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                            
                end            
            8'h45: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0111;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'h4d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0111;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                             
                end            
            8'h55: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'h5d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1000;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00; 
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                             
                end            
            8'h65: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1001;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                             
                end            
            8'h6d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1001;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;       
                end            
            8'h75: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1010;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                               
                end            
            8'h7d: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1010;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'hc5: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1011;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                                 
                end            
            8'hcd: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1011;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'hd5: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0;
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1100;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b01; 
                    bit_32      <= 1'b0;                                
                end            
            8'hdd: //Good
                begin 
                    regwrite    <= 1'b0;
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0;
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0;
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b1100;
                    alucontrol  <= 4'b0000;
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
            8'h95: //Good
                begin 
                    regwrite    <= 1'b0; 
                    memtoreg    <= 1'b0; 
                    memwrite    <= 1'b0; 
                    memread     <= 1'b0; 
                    writesrc    <= 1'b0; 
                    dstSelect   <= 1'b0;
                    immExtend   <= 2'b00;
                    Branch      <= 4'b0000; 
                    alucontrol  <= 4'b0000; 
                    alusrca     <= 2'b00;
                    alusrcb     <= 2'b00; 
                    bit_32      <= 1'b0;                                
                end            
        endcase
    end
endmodule
