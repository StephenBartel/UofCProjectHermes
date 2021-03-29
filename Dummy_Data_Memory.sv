module Dummy_Data_Memory(
	input clk,

	input read_request,
	input write_request,
	output reg read_ready,
	output reg write_ready,
	output reg write_finished,
	input [63:0] address,
	input [1:0] block_size,
	input [63:0] write_data,
	output [63:0] read_data
);

	byte memory [logic[63:0]];
	logic read_ready_ns, write_ready_ns, write_finished_ns;

	always_ff @(posedge clk) begin
		read_ready <= read_ready_ns;
		write_ready <= write_ready_ns;
		write_finished <= write_finished_ns;
		write_finished_ns <= write_ready;

		if (read_request) begin
			read_ready_ns <= 1'b1;
			write_ready_ns <= 1'b0;
			case(block_size)
				2'b10: memory[address] <= write_data[7:0];
				2'b01: memory[address + 1:address] <= write_data[15:0];
				2'b00: memory[address + 3:address] <= write_data[31:0];
				2'b11: memory[address + 7:address] <= write_data;
			endcase
		end else if (write_request) begin
			write_ready_ns <= 1'b1;
			read_ready_ns <= 1'b0;
			case(block_size)
				2'b10: read_data[7:0] <= memory[address];
				2'b01: read_data[15:0] <= memory[address + 1:address];
				2'b00: read_data[31:0] <= memory[address + 3:address];
				2'b11: read_data <= memory[address + 7:address];
			endcase
		end else {write_ready_ns, read_ready_ns} <= '0;

	end

endmodule : Dummy_Data_Memory