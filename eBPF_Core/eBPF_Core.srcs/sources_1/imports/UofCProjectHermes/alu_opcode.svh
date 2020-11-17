`ifndef ALU_OPCODE_SVH
`define ALU_OPCODE_SVH

typedef enum [3:0] {
	ADD = 4'h0,
	SUB = 4'h1,
	MUL = 4'h2,
	DIV = 4'h3,
	OR  = 4'h4,
	AND = 4'h5,
	LSH = 4'h6,
	RSH = 4'h7,
	NEG = 4'h8,
	MOD = 4'h9,
	XOR = 4'ha,
	MOV = 4'hb,
	ARSH = 4'hc,
	BYTESHIFT = 4'hd
} aluOp_e;

typedef struct packed {
	aluOp_e op;
	logic imm_or_reg;
} aluOpcodeBody_s;

`endif