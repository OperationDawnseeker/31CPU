`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/30 14:13:28
// Design Name: 
// Module Name: DMEM
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
 
 /*
       DMEM Ϊ���ݴ洢��ģ�顣�������ź���ʱ���źš�ʹ���źš�д��Ч��
�������Ч�źš����⣬���е�ַ�Լ�д���������Ϊģ�����룬�Լ���������
����Ϊģ��������
 */

module DMEM( 
   input           clk,        // ʱ���ź� 
   input           ena,        // ʹ���ź� 
   input           DMEM_W,     // д��Ч�ź� 
   input           DMEM_R,     // ����Ч�ź� 
   input   [10:0]  DM_addr,    // ��ַ 
   input   [31:0]  DM_wdata,   // д������ 
   output  [31:0]  DM_rdata    // �������� 
   ); 
    
   reg [31:0] DM [31:0]; //2048��32λ�洢��Ԫ
    
   always@(posedge clk) 
   begin 
       if(ena && DMEM_W) 
       begin
             DM[DM_addr] <= DM_wdata; 
       end 
   end 
    
   assign DM_rdata = (ena && DMEM_R) ? DM[DM_addr] : 32'bz; //��ʱ���Զ�ȡ���첽��
    

endmodule 
