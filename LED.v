`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:02 09/15/2026 
// Design Name: 
// Module Name:    LED 
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


module LED
(
    input wire          sys_clk,
    input wire          sys_rst_n,
    input wire [1:0]    cstate,

    output reg          LED_out
);
    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        LED_out <= 1'b0;
    else if(cstate == 2'b00 || cstate == 2'b10)
        LED_out <= 1'b0;
    else if(cstate == 2'b01)
        LED_out <= 1'b1;
    else 
        LED_out <= LED_out;

endmodule 
