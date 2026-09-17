`timescale 1ns / 1ps
module Speed_Slow_judge
#(
    parameter           SLOW_SPEED = 1
)
(
    input wire          sys_clk,
    input wire          sys_rst_n,
    input wire [33:0]   freq,

    output reg          Slow_speed_flag 
);
    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Slow_speed_flag <= 1'b0;
    else if(freq <= SLOW_SPEED)
        Slow_speed_flag <= 1'b1;
    else
        Slow_speed_flag <= 1'b0;

endmodule 

