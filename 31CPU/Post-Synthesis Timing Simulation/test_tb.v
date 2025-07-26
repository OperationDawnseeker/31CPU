`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/06/01 14:41:39
// Design Name: 
// Module Name: test_tb
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

module test_tb;
reg clk;            //ʱ���ź�
reg rst;            //��λ�ź�
wire [31:0] inst;   //Ҫִ�е�ָ��
wire [31:0] pc;     //��һ��ָ��ĵ�ַ
wire clk_cpu;
wire [7:0] o_seg;//�������
wire [7:0] o_sel; //Ƭѡ�ź�
initial 
begin
    clk = 1'b0;
    rst = 1'b1;
    #50 rst = 1'b0;
end

always  #50 clk = ~clk;

sccomp_dataflow sc_inst(
    .clk_in(clk),
    .reset(rst),
    .o_seg(o_seg),//���ָ��
    .o_sel(o_sel)//ִ�е�ַ
);

endmodule
