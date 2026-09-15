`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:55 09/15/2026 
// Design Name: 
// Module Name:    Speed_Slow_judge 
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

module Speed_Slow_judge
#(
    parameter           SLOW_SPEED = 1
)
(
    input wire          sys_clk,
    input wire          sys_rst_n,
    input wire [33:0]   freq,
    input wire [1:0]    cstate,

    output reg          Slow_speed_flag 
);
    /*判断速度是否小于阈值*/
    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Slow_speed_flag <= 1'b0;
    else if(freq <= SLOW_SPEED)
        Slow_speed_flag <= 1'b1;
    else
        Slow_speed_flag <= 1'b0;

endmodule 

