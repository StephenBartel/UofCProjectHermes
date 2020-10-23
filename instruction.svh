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
} instruction_type;

typedef union {
	jump_opcode_body jump;
	alu_opcode_body alu;
	memory_opcode_body memory;
} opcode_body;

typedef struct packed {
	opcode_body body;
	instruction_type type;
} opcode;

typedef struct packed {
	int imm;	// int is by default signed 32 bit
	logic [15:0] offset;
	logic [3:0] src;
	logic [3:0] dst;
	opcode_struct opcode;
} instruction;

`endif

