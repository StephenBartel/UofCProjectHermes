`ifndef MEMORY_OPCODE_SVH
`define MEMORY_OPCODE_SVH

typedef enum [2:0] {
	MEM = 3'h6,
	IMM = 3'h0
} memory_mode;

typedef enum [1:0] {
	W  = 2'h0,
	H  = 2'h1,
	B  = 2'h2,
	DW = 2'h3
} data_size;

typedef struct packed {
	memory_mode mode;
	data_size size;
} memory_opcode_body;

`endif