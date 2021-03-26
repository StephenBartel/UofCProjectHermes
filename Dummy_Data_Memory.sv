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

	logic memWrite, memRead;
	assign memWrite = ~read_request & write_request;
	assign memRead = read_request & ~write_request;

	logic read_ready_flag, write_ready_flag, write_finished_flag;

	dataMemory memory(
		.clk(clk),
		.memWrite(memWrite),
		.memRead(memRead),
		.sizeSelect(block_size),
		.write_data(write_data),
		.read_data(read_data),
		.file_name("")
	);

	initial begin
		read_ready <= 1'b0;
		write_ready <= 1'b0;
		write_finished <= 1'b0;
		read_ready_flag <= 1'b0;
		write_ready_flag <= 1'b0;
		write_finished_flag <= 1'b0;

	end

	always @(posedge read_request) begin
		#($urandom_range(5,50) * 1ns);
		read_ready_flag = 1'b1;
		#($urandom_range(5,50) * 1ns);
		read_ready_flag = 1'b0;
	end

	always @(posedge write_request) begin
		#($urandom_range(5,50) * 1ns);
		write_ready_flag = 1'b1;
		#($urandom_range(5,50) * 1ns);
		write_finished_flag = 1'b1;
		#($urandom_range(5,50) * 1ns);
		write_ready_flag = 1'b0;
		write_finished_flag = 1'b0;
	end

	always_ff @(posedge clk) begin
		read_ready <= read_ready_flag & ~read_ready;
		write_ready <= write_ready_flag & ~write_ready;
		write_finished <= write_finished_flag & ~write_finished;
	end


endmodule : Dummy_Data_Memory