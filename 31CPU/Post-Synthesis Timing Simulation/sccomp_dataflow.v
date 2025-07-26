`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/30 11:01:02
// Design Name: 
// Module Name: sccomp_dataflow
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

/*sccomp_dataflow Ϊ����ģ�飬������Ϊϵͳ��ʱ���ź��븴λ�źţ����
Ϊ��ǰ��ȡ����ָ���Լ������������ֵ�����ڲ���ģ�����Ϣ��ӡ����ģ�鸺
�� CPU ģ����ָ��洢�� IMEM�����ݴ洢�� DMEM ������*/
module sccomp_dataflow( 
    input clk_in,   // ʱ���ź� 
    input reset,    // ��λ�ź� 
    output [7:0] o_seg,//�������
    output [7:0] o_sel //Ƭѡ�ź�

); 
     
    wire [31:0] imem_data; 
    wire [31:0] pc;
    wire [31:0] inst;
    
    wire dmem_w;
    wire dmem_r; 
    wire [10:0] dm_addr; 
    wire [10:0] im_addr; 
    wire [31:0] dmem_addr_pc; 
    wire [31:0] dmem_wdata; 
    wire [31:0] dmem_rdata; 
    
    assign inst = imem_data; 
    assign im_addr = (pc - 32'h00400000) / 4; 
    assign dm_addr = (dmem_addr_pc - 32'h10010000) / 4; 
     
    IMEM imem( 
        .addr(im_addr), 
        .data(imem_data) 
    ); 
     
    DMEM dmem( 
        .clk(clk_cpu), 
        .ena(1'b1), 
        .DMEM_W(dmem_w), 
        .DMEM_R(dmem_r), 
        .DM_addr(dm_addr), 
        .DM_wdata(dmem_wdata), 
        .DM_rdata(dmem_rdata) 
    ); 
     
    cpu sccpu(     
        .clk_in(clk_cpu), 
        .ena(1'b1), 
        .rst(reset), 
        .PC(pc), 
        .imem(imem_data), 
        .dmem_out(dmem_rdata), 
        .dmem_in(dmem_wdata), 
        .dmem_addr(dmem_addr_pc), 
        .dmem_w(dmem_w), 
        .dmem_r(dmem_r) 
    ); 
     
    seg7x16 seg7x16_inst(
        .clk(clk_in),
        .reset(reset),
        .cs(1'b1),
        .i_data(imem_data),
        .o_seg(o_seg),
        .o_sel(o_sel)
    );
    
    Divider Divider_inst(
       .clk(clk_in),                   //ϵͳʱ��
       .rst_n(~reset),                 //��λ�ź�
       .clk_out(clk_cpu)               //�������CPU��ʱ��
        );

endmodule 