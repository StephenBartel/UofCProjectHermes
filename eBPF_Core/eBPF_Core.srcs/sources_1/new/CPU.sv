`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2021 02:07:28 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input [63:0] instructionFromMem,
    input [63:0] dataFromMem,
    input [63:0] firstInstructionAddress,
    input reset,
    input clk,
    output memWrite, 
    output memRead,
    output [1:0] sizeSelect,
    output [63:0] writeData,
    output [63:0] addressForData,
    output [63:0] addressForInstruction
    );
    
   //wire clk = clk; 
   assign instruction = instructionFromMem;
   wire [63:0] instruction;
        wire [31:0] imm = instruction[63:32];
        wire[15:0] offset = instruction[31:16];
        wire[3:0]src = instruction[15:12];
        wire[3:0] dst = instruction[11:8];
        wire[7:0] opcode = instruction[7:0];
   assign sizeSelect = opcode[4:3];
   wire [63:0] nextInstruction; // input to the PC
   wire [63:0] offsetAddress; //current instruction + jump offset
   wire [63:0] instructionNumber; //current instruction
   wire [63:0] nextOrFirstInstruction; // input to the PC
   
   wire [63:0] offsetExtended;
   wire [63:0] operandA;
   wire [63:0] operandB;
   wire [63:0] ALUResult;
   assign addressForData = ALUResult;
   wire [63:0] dstWrite;
   wire [63:0] srcRead;
   wire [63:0] dstRead;
   wire [63:0] immExtended;
   wire [63:0] immSignExtended;
   wire [63:0] immLeftPad;
   wire [63:0] immRightPad;
   wire PCSrc;
   wire [63:0] writeData;
   assign writeData = writeData;
   wire [63:0] readData;
   assign readData = dataFromMem;
   wire [63:0] dataAddress;
   assign addressForData = dataAddress;
   
   
   //exception handler wires:
   wire opcodeExc;
   wire excCaught;
   wire arithmeticExc;
   wire [63:0] errorData;
   wire instructionMemoryExc;
   wire dataMemoryExc;
   
   //Control unit signals
   wire writeSrc;
   wire memToReg;
   wire regWrite;
   wire memWrite;
   assign memWrite = memWrite;
   wire memRead;
   assign memRead = memRead;
   wire[3:0] comparatorControl; //Telling the comparator control what kind of jump operation will occur
   wire[3:0] ALUControl;
   wire[1:0] ALUSrcA;
   wire[1:0] ALUSrcB;
   wire ALUBitSelect;
   wire PCContinue;
   wire [1:0] immExtend;
   
   //PC portion of diagram
   assign nextOrFirstInstruction = (reset == 1'b1) ? firstInstructionAddress : nextInstruction;  
   PC PC(.inputInstruction(nextOrFirstInstruction), .outputInstruction(instructionNumber), .clk(clk), .continueRunning(PCContinue));
   
   //Instruction incrementation
   SixteenBitSignExtend offsetExtender(.a(offset), .b(offsetExtended));
   assign addressForInstruction = instructionNumber << 3;
   Hardware_Adder_64bit offsetAdder(.a(instructionNumber + 1), .b(offsetExtended), .c(offsetAddress));
   assign nextInstruction = (PCSrc == 1'b1) ? offsetAddress : instructionNumber + 1;
    
    //Jump comparator
   jump_comparator jComparator(.a(operandA), .b(operandB), .op(comparatorControl), .jump(PCSrc));
   
   //Immediate extentsion
   ThirtyTwoBitSignExtend ThirtyTwoBitSignExtend(.a(imm), .b(immSignExtended));
   
   ThirtyTwoBitLeftPad ThirtyTwoBitLeftPad( .a(imm), .out(immLeftPad));
   ThirtyTwoBitRightPad ThirtyTwoBitRightPad( .a(imm), .out(immRightPad));
   ThreeToOneMux ImmMux(.a(immSignExtended), .b(immLeftPad), .c(immRightPad), .out(immExtended), .selector(immExtend));
   
   
   register_file rFile(.clk(clk), .dst(dst), .src(src), .dstRead(dstRead), .srcRead(srcRead), .dstWrite(dstWrite), .writeEnable(regWrite));
   
   //Mux ouputs to ALU
   ThreeToOneMux MuxA (.a(dstRead), .b(immExtended), .c(offsetExtended), .out(operandA), .selector(ALUSrcA));//May need to swap the selector A/B
   ThreeToOneMux MuxB (.a(srcRead), .b(immExtended), .c(offsetExtended), .out(operandB), .selector(ALUSrcB));
   
   ALU ALU(.ALUControl(ALUControl), .is32Bit(ALUBitSelect), .operandA(operandA), .operandB(operandB), .ALUResult(ALUResult), .arithmeticExc(arithmeticExc));
  
   
   assign dstWrite = (memToReg == 1'b1) ? readData : ALUResult;
   assign writeData = (writeSrc == 1'b1 ) ? srcRead : immExtended;
  
  
   ControlUnit controlUnit(.opcode(opcode), .regwrite(regWrite), .memtoreg(memToReg), .memwrite(memWrite), .memread(memRead), .writesrc(writeSrc),
    .Branch(comparatorControl), .alucontrol(ALUControl), .alusrca(ALUSrcA), .alusrcb(ALUSrcB), .bit_32(ALUBitSelect), .immExtend(immExtend));
   
endmodule
