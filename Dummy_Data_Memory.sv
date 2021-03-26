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

	dataMemory memory(
		.clk(clk),
		.memWrite(memWrite),
		.memRead(memRead),
		.sizeSelect(block_size),
		.writeData(write_data),
		.readData(read_data),
		.file_name("")
	);



	always @(posedge read_request) begin
		#($urandom_range(5,50) * 1ns);
		read_ready = 1'b1;
		#5ns
		read_ready = 1'b0;
	end

	always @(posedge write_request) begin
		#($urandom_range(5,50) * 1ns);
		write_ready = 1'b1;
		#5ns
		write_ready = 1'b0;
		#($urandom_range(5,50) * 1ns);
		write_finished = 1'b1;
		#5ns
		write_finished = 1'b0;
	end


endmodule : Dummy_Data_Memory