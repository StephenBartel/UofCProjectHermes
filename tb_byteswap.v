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
 
    //increase simulation time. 
       
    reg [31:0] src_32;
    reg [31:0] imm_32; 
    wire [31:0] dst_32; 
    reg [3:0] ALUControl_32; 
    
    reg [63:0] src_64;
    reg [63:0] imm_64; 
    wire [63:0] dst_64; 
    reg [3:0] ALUControl_64; 
    
    byteswap32 UUT_32( .src(src_32), .imm(imm_32), .dst(dst_32), .ALUControl(ALUControl_32));
    byteswap64 UUT_64( .src(src_64), .imm(imm_64), .dst(dst_64), .ALUControl(ALUControl_64)); 
    
    integer inputFile_32;
    integer inputFile_64; 
    integer outputFile_32_16; 
    integer outputFile_32_32; 
    integer outputFile_64_16;
    integer outputFile_64_32;  
    integer outputFile_64_64; 
    integer resultFile_32;
    integer resultFile_64; 
    
    `define NULL 0    
    
    //integer inputData_32; 
    reg [31:0] inputData_32;
    //integer outputData_32_16;
    reg [31:0] outputData_32_16;
    //integer outputData_32_32;  
    reg [31:0] outputData_32_32;
    //integer inputData_64;
    reg [63:0] inputData_64; 
    //integer outputData_64_16;
    reg [63:0] outputData_64_16;
    //integer outputData_64_32;
    reg [63:0] outputData_64_32;
    //integer outputData_64_64;
    reg [63:0] outputData_64_64;
    
    integer data_input32; 
    integer data_output32_16;
    integer data_output32_32;
    integer data_input64;
    integer data_output64_16;
    integer data_output64_32;
    integer data_output64_64;
    
    reg clk; 
    initial begin
      clk = 0; 
    
      inputFile_32 = $fopen("/home/stephen/Documents/GV_Input32_ByteSwap.txt", "r");
      if (inputFile_32 == `NULL) begin
        $display("inputFile_32 handle was NULL");
        $finish;
      end
      
      inputFile_64 = $fopen("/home/stephen/Documents/GV_Input64_ByteSwap.txt", "r");
      if (inputFile_64 == `NULL) begin
        $display("inputFile_64 handle was NULL");
        $finish;
      end
      
      outputFile_32_16 = $fopen("/home/stephen/Documents/GV_Output32_16_ByteSwap.txt", "r");
      if (outputFile_32_16 == `NULL) begin
        $display("outputFile_32_16 handle was NULL");
        $finish;
      end
      
      outputFile_32_32 = $fopen("/home/stephen/Documents/GV_Output32_32_ByteSwap.txt", "r");
      if (outputFile_32_32 == `NULL) begin
        $display("outputFile_32_32 handle was NULL");
        $finish;
      end
      
      outputFile_64_16 = $fopen("/home/stephen/Documents/GV_Output64_16_ByteSwap.txt", "r");
      if (outputFile_64_16 == `NULL) begin
        $display("outputFile_64_16 handle was NULL");
        $finish;
      end
      
      outputFile_64_32 = $fopen("/home/stephen/Documents/GV_Output64_32_ByteSwap.txt", "r");
      if (outputFile_64_32 == `NULL) begin
        $display("outputFile_64_32 handle was NULL");
        $finish;
      end     
      
      outputFile_64_64 = $fopen("/home/stephen/Documents/GV_Output64_64_ByteSwap.txt", "r");
      if (outputFile_64_64 == `NULL) begin
        $display("outputFile_64_64 handle was NULL");
        $finish;
      end
      
      resultFile_32 = $fopen("/home/stephen/Documents/tb_ByteSwap_Result_32.txt", "w");
      if (resultFile_32 == `NULL) begin
        $display("resultFile_32 handle was NULL");
        $finish;
      end
      
      resultFile_64 = $fopen("/home/stephen/Documents/tb_ByteSwap_Result_64.txt", "w");
      if (resultFile_64 == `NULL) begin
        $display("resultFile_64 handle was NULL");
        $finish;
      end
    end
    
    integer error_32_16 = 0; 
    integer error_32_32 = 0; 
    
    integer error_64_16 = 0; 
    integer error_64_32 = 0;
    integer error_64_64 = 0;  
    
    parameter clock_period=500;
    
   initial begin
       forever begin
            clk= 1;
            #20;
            clk= 0; 
            #20;
        end
    end

    integer always_64_done = 0; 
    integer alwyas_32_done = 0; 
    
    integer bit_32_count = 1; 
    integer bit_64_count = 1; 
    
    always @(posedge clk) begin
        data_input64 = $fscanf(inputFile_64, "%d\n", inputData_64);         
        data_output64_16 = $fscanf(outputFile_64_16, "%d\n", outputData_64_16);
        data_output64_32 = $fscanf(outputFile_64_32, "%d\n",outputData_64_32);
        data_output64_64 = $fscanf(outputFile_64_64, "%d\n",outputData_64_64);
        
        if (!$feof(outputFile_64_16) && !$feof(outputFile_64_32) && !$feof(outputFile_64_64) && !$feof(inputFile_64)) begin
            bit_64_count = bit_64_count + 1; 
            src_64 = inputData_64;
            ALUControl_64 = 4'he;
            
                imm_64 = 64'd16; 
                #2
                if(dst_64 != outputData_64_16) begin
                    error_64_16 = error_64_16 + 1; 
                    $display("ERROR : 001");
                end
                imm_64 = 64'd32;
                #2
                if(dst_64 != outputData_64_32) begin
                    error_64_32 = error_64_32 + 1;
                    $display("ERROR : 002"); 
                end
                imm_64 = 64'd64;
                #2
                if(dst_64 != outputData_64_64) begin
                    error_64_64 = error_64_64 + 1; 
                    $display("ERROR : 003");
                end
            
            ALUControl_64 = 4'hd;
                #2
                if(dst_64 != inputData_64) begin
                    error_64_64 = error_64_64 + 1;
                    $display("ERROR : 004"); 
                end
                imm_64 = 32'd32; 
                #2
                if(dst_64 != inputData_64) begin
                    error_64_32 = error_64_32 + 1; 
                    $display("ERROR : 005");
                end
                imm_64 = 32'd16; 
                #2
                if(dst_64 != inputData_64) begin
                    error_64_16 = error_64_16 + 1; 
                    $display("ERROR : 006");
                 end
        end       
        else begin
            $fclose(outputFile_64_16);
            $fclose(outputFile_64_32);
            $fclose(outputFile_64_64);
            $fclose(inputFile_64);
            $fwrite(resultFile_64, "Number of errors in 64-bit ByteSwap\n16-bit error: %d\n32-bit error: %d\n64-bit error: %d\nTotal 64-bit samples: %d\n",error_64_16,error_64_32,error_64_64,bit_64_count);
            $fclose(resultFile_64);
            always_64_done = 1;
        end
        
    end

        always @(posedge clk) begin
    
            data_input32 = $fscanf(inputFile_32, "%d\n", inputData_32); 
            
            data_output32_16 = $fscanf(outputFile_32_16, "%d\n", outputData_32_16); 
            data_output32_32 = $fscanf(outputFile_32_32, "%d\n", outputData_32_32);
            
            if (!$feof(inputFile_32) && !$feof(outputFile_32_16) && !$feof(outputFile_32_32)) begin
                bit_32_count = bit_32_count + 1; 
                src_32 = inputData_32; 
                
                ALUControl_32 = 4'he;
                
                    imm_32 = 32'd16; 
                    #2
                    if(dst_32!=outputData_32_16) begin
                        error_32_16 = error_32_16+1; 
                        $display("ERROR : 007");
                    end
                    imm_32 = 32'd32;
                    #2
                    if(dst_32!=outputData_32_32) begin
                        error_32_32 = error_32_32+1;
                        $display("ERROR : 008");
                    end
                ALUControl_32 = 4'hd;
                    #2
                    if(dst_32!=inputData_32) begin
                        error_32_32 = error_32_32 + 1;
                        $display("ERROR : 009");
                    end
                    imm_32 = 32'd16;  
                    #2
                    if(dst_32!=inputData_32) begin
                        error_32_16 = error_32_16+1;
                        $display("ERROR : 010");
                    end 
            end
            else begin
                $fclose(inputFile_32);
                $fclose(outputFile_32_16);
                $fclose(outputFile_32_32);
                $fwrite(resultFile_32, "Number of errors in 32-bit ByteSwap\n16-bit error : %d\n32-bit error: %d\nTotal 32-bit samples: %d\n",error_32_16, error_32_32,bit_32_count);
                $fclose(resultFile_32);
                alwyas_32_done = 1; 
            end
    end
    
    always @(posedge clk) begin
        if (alwyas_32_done == 1 && always_64_done == 1) begin
            $finish;
        end
    end
        
endmodule
