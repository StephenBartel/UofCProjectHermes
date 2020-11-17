`ifndef MEMORY_OPCODE_SVH
`define MEMORY_OPCODE_SVH

typedef enum [2:0] {
	MEM = 3'h6,
	IMM = 3'h0
} memoryMode_e;

typedef enum [1:0] {
	W  = 2'h0,
	H  = 2'h1,
	B  = 2'h2,
	DW = 2'h3
} dataSize_e;

typedef struct packed {
	memoryMode_e mode;
	dataSize_e size;
} memoryOpcodeBody_s;

`endif