`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:52 09/15/2026 
// Design Name: 
// Module Name:    Three_KM_judge 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module Three_KM_judge
#(
    parameter           TRAVEL_3KM = 11'd1500
)
(
    input wire          sys_clk,
    input wire          clk_test,
    input wire          sys_rst_n,
    input wire [1:0]    cstate,
    
    output reg          Three_KM_flag
);
    reg [10:0]          cnt_Three_KM;      

    /*3km计数器，检测接收到的信号上升沿，计数1500次*/
    always @(posedge clk_test or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_Three_KM <= 1'b0;
    else if(cnt_Three_KM == TRAVEL_3KM || cstate == 2'b00 || cstate == 2'b10)
        cnt_Three_KM <= 1'b0;
    else if(cstate == 2'b01)
        cnt_Three_KM <= cnt_Three_KM + 1'b1;

    /*3km标志信号，达到3km发送一个时钟周期的脉冲*/
    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Three_KM_flag <= 1'b0;
    else if(cnt_Three_KM == TRAVEL_3KM)
        Three_KM_flag <= 1'b1;
    else if(cstate == 2'b00)
        Three_KM_flag <= 1'b0;
    else 
        Three_KM_flag <= Three_KM_flag;

endmodule 
