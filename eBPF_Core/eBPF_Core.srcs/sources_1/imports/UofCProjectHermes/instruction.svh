`ifndef INSTRUCTION_SVH
`define INSTRUCTION_SVH

`include "alu_opcode.svh"
`include "jump_opcode.svh"
`include "memory_opcode.svh"

typedef enum [2:0] {
	LD    = 3'h0,
	LDX   = 3'h1,
	ST    = 3'h2,
	STX   = 3'h3,
	ALU32 = 3'h4,
	JMP   = 3'h5,
	ALU64 = 3'h7
} instructionType_e;

typedef union {
	jumpOpcodeBody_s jump;
	aluOpcodeBody_s alu;
	memoryOpcodeBody_s memory;
} opcodeBody_u;

typedef struct packed {
	opcodeBody_u body;
	instructionType_e type;
} opcode_s;

typedef struct packed {
	int imm;	// int is by default signed 32 bit
	logic [15:0] offset;
	logic [3:0] src;
	logic [3:0] dst;
	opcode_s opcode;
} instruction_s;

`endif

