`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 06:29:21 PM
// Design Name: 
// Module Name: tb_register_file
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


module tb_register_file;

    //Input variables that will be varied
    reg writeEnable_input; 
    reg [3:0] dst_input; 
    reg [3:0] src_input; 
    reg [63:0] dstWrite_input; 
    
    //Output wires that will be monitored
    wire [63:0] dstRead_output; 
    wire [63:0] srcRead_output;
    
     //**CLOCK**//
    reg clk; //Clock signal used in synchronizing the test
    localparam clock_half_period = 20; //Define the period of the clock in number of time units. 2*clock_half_period = clock_period
    //Generate clock signal
    always @(*) 
    begin
        clk = 1'b1; //1
        #clock_half_period;
        clk = 1'b0; //0
        #clock_half_period;
    end
    //**END CLOCK**//   
    
    //Instantiate the component we would like to test. 
    register_file UUT(.clk(clk),.dst(dst_input),.src(src_input),.dstRead(dstRead_output),.srcRead(srcRead_output),.dstWrite(dstWrite_input),.writeEnable(writeEnable_input);
    
    //Initialize the input values
    /*
    initial begin
            writeEnable_input = 1'b0; 
            dst_input = 4'b0; 
            src_input = 4'b0; 
            dstWrite_input = 64'b0;
    end
    */
    
    writeEnable_input_vector = {1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0};
    
    dst_input_vector = {4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111,4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111};
    src_input_vector = {4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111,4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111};
    
    
    dstWrite_input_vector = {64'b0001110010001111101111001011111110110101010011010111000011110000,64'b1010111110101100001001110001010110100111011111100111000110010000,
                            64'b1100100010000001110001001000001010101001111011001000001011001110,64'b1101011110001001011111111010000100000100101010010110011001000001,
                            64'b1101001100001111110111111110001111000101101010110011101010110111,64'b0011101101110000011001101100001110000000101101011001010011001001,
                            64'b0001100011000110110010001110111111010001111011101111101101001000,64'b0101110111011110110010011101010110010001110000110110100110110100,
                            64'b0010000010010001000000001111110010001100110111101001000100101100,64'b1011000111111001001011010001110100001110000111100001011101110001,
                            64'b0001001101000000011100101100111001101011010110000100011100110001,64'b1111000000101110110000111100100000011100000011110111011011100111,
                            64'b0010110101001001000100011011000010001010010100001100011011010010,64'b1110110110100010011000110111111110011001001100001001010100100000,
                            64'b0110001110100011010110001100100000011001110110000110111110010001,64'b0110001100000110100001000111111011111110010101111111100110101110};
                            
    
    dstRead_output_expected = {}; 
    srcRead_output_expected = {}; 
    int writeCounter = 0; 
    int readCounter = 0; 
    int totalCounter = 0; 
    
     //**SYNCHRONOUS ALWAYS BLOCK**//
    always @(posedge clk)
        begin
            writeEnable_input = writeEnable_input_vector[totalCounter]; 
            
            //Write cycle
            if(writeEnable_input == 1'b1) begin
                dst_input = dst_input_vector[writeCounter];
                dstWrite_input=dstWrite_input_vector[writeCounter];
                writeCounter+=1; 
            //Read cycle
            else 
                dst_input = dst_input_vector[readCounter];
                src_input = src_input_vector[readCounter]; 
                expectedOutput = dstWrite_input_vector[readCounter];
                if(dstRead_output!=expectedOutput)begin
                    $display("Test Failed for dstRead_output. dstRead=%d \t||\t expectedOutput=%d",dstRead_output,expectedOutput);
                end
                if(srcRead_output!=expectedOutput)begin
                    $display("Test Failed for srcRead_output. srcRead=%d \t||\t expectedOutput=%d",srcRead_output,expectedOutput);
                end
                readCounter+=1;
            end
            
            if(totalCounter>=31)
                $finish
            totalCounter+=1;

        end
   //**SYNCHRONOUS ALWAYS BLOCK END**//
   
endmodule
