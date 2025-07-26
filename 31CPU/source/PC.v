`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/30 14:12:31
// Design Name: 
// Module Name: PC
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

//PCreg ȡָ

module PC( 
    input               clk,    // ʱ���ź� 
    input               ena,    // ʹ���ź� 
    input               rst,    // ��λ�ź� 
    input      [31:0]   PC_in,  // ����� PC ���� 
    output reg [31:0]   PC_out  // ����� PC ���� 
    ); 
     
    always@(negedge clk or posedge rst) 
    begin 
        if(rst) 
        begin 
            PC_out <= 32'h00400000; 
        end 
        else if(ena) 
        begin 
            PC_out <= PC_in; 
        end 
    end 
     

endmodule 
