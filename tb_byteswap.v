`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 07:16:24 PM
// Design Name: 
// Module Name: tb_byteswap
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


module tb_byteswap;

    
    reg [31:0] src_32;
    reg [31:0] out_32; 
    
    reg [63:0] src_64;
    reg [63:0] out_64;
    
    byteswap32 UUT_32( .src(src_32), .dst(out_32));
    byteswap64 UUT_64( .src(src_64), .dst(out_64)); 
    
    integer inputFile_32;
    integer inputFile_64; 
    integer outputFile_32; 
    integer outputFile_64; 
    integer resultFile_32;
    integer resultFile_64; 
    
    `define NULL 0    
    
    integer inputData_32; 
    integer outputData_32; 
    integer inputData_64;
    integer outputData_64;
    
    integer data_input32; 
    integer data_output32;
    integer data_input64;
    integer data_output64;
    
    initial begin
      inputFile_32 = $fopen("GV_Input32_ByteSwap.txt", "r");
      if (inputFile_32 == `NULL) begin
        $display("inputFile_32 handle was NULL");
        $finish;
      end
      
      inputFile_64 = $fopen("GV_Input64_ByteSwap.txt", "r");
      if (inputFile_64 == `NULL) begin
        $display("inputFile_64 handle was NULL");
        $finish;
      end
      
      outputFile_32 = $fopen("GV_Output32_ByteSwap.txt", "r");
      if (outputFile_32 == `NULL) begin
        $display("outputFile_32 handle was NULL");
        $finish;
      end
      
      outputFile_64 = $fopen("GV_Output64_ByteSwap.txt", "r");
      if (outputFile_64 == `NULL) begin
        $display("outputFile_64 handle was NULL");
        $finish;
      end
      
      resultFile_32 = $fopen("tb_ByteSwap_Result_32.txt", "w");
      if (resultFile_32 == `NULL) begin
        $display("resultFile_32 handle was NULL");
        $finish;
      end
      
      resultFile_64 = $fopen("tb_ByteSwap_Result_64.txt", "w");
      if (resultFile_64 == `NULL) begin
        $display("resultFile_64 handle was NULL");
        $finish;
      end
      
    end
    
    integer error_32bit = 0; 
    integer error_64bit = 0; 
    parameter clock_period=10;
    reg clk; 
    always 
        #(clock_period/2) clk=~clk;

    integer always_64_done = 0; 
    integer alwyas_32_done = 0; 
    
    always @(posedge clk) begin
       
        data_input64 = $fscanf(inputFile_64, "%d\n", inputData_64);         
        data_output64 = $fscanf(outputFile_64, "%d\n", outputData_64);
         
        if (!$feof(outputFile_64) && !$feof(inputFile_64)) begin
            src_64 = inputData_64;
            #50
            if(out_64 != outputData_64)
                error_64bit = error_64bit + 1; 
        else
            $fclose(outputFile_64);
            $fclose(inputFile_64);
            $fwrite(resultFile_64, "Number of errors in 64-bit ByteSwap : %d\n",error_64bit);
            $fclose(resultFile_64);
            always_64_done = 1;
        end
        
    end
    
    always @(posedge clk) begin
        data_input32 = $fscanf(inputFile_32, "%d\n", inputData_32); 
        data_output32 = $fscanf(outputFile_32, "%d\n", outputData_32); 
        
        if (!$feof(inputFile_32) && !$feof(outputFile_32)) begin
            #50
            src_32 = inputData_32; 
            if(out_32 != outputData_32)
                error_32bit = error_32bit + 1; 
        else
            $fclose(outputFile_32);
            $fclose(inputFile_32);
            $fwrite(resultFile_32, "Number of errors in 32-bit ByteSwap : %d\n",error_32bit);
            $fclose(resultFile_32);
            alwyas_32_done = 1; 
        end
    end
    
    always @(posedge clk) begin
        if (alwyas_32_done == 1 && always_64_done == 1)
            $finish;
    end
        
endmodule
