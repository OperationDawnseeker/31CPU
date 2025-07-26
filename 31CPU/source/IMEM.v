`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/30 14:13:16
// Design Name: 
// Module Name: IMEM
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

/*IMEM Ϊָ��洢��ģ�飬ͨ������ ROM �� IP ��ʵ�֡�*/

module IMEM( 
    input   [10:0]  addr,   // ָ���ַ 
    output  [31:0]  data    // ��ȡָ�� 
    ); 
     
    dist_mem_gen_0 IM( 
        .a(addr), 
        .spo(data) 
    ); 
     
endmodule
