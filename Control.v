`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:36 09/15/2026 
// Design Name: 
// Module Name:    Control 
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

module Control
#(
    parameter           CNT_MAX = 20'd999_999
)
(
    input wire          sys_clk,
    input wire          sys_rst_n,
    input wire          key_in,
    input wire          clk_test,

    output wire[7:0]    seg,
    output wire         LED_out,
    output wire[3:0]	sel
);

    parameter           STOP = 2'b00,
                        WORK = 2'b01,
                        DISPLAY = 2'b10;

    reg [19:0]          cnt_20;

    reg                 key_flag;

    reg [1:0]           cstate;
    reg [1:0]           nstate;

    wire [33:0]         freq;

    wire                Three_KM_flag;

    wire                Slow_speed_flag;

    wire [15:0]         Cost_out;


    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cstate <= STOP;
    else 
        cstate <= nstate;

    always @(*)
        case (cstate)
            STOP :
                if(key_flag)
                    nstate <= WORK;
                else
                    nstate <= STOP;
            WORK : 
                if(key_flag)
                    nstate <= DISPLAY;
                else
                    nstate <= WORK;
            DISPLAY :
                if(key_flag)
                    nstate <= STOP;
                else
                    nstate <= DISPLAY;
        endcase

	always @(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		cnt_20<=1'b0;
	else if(key_in==1'b1)
		cnt_20<=1'b0;
	else if(cnt_20==CNT_MAX &&  key_in==1'b0)
		cnt_20<=cnt_20;
	else
		cnt_20<=cnt_20+1'b1;
		
	always @(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		key_flag<=1'b0;
	else if(cnt_20==CNT_MAX-1'b1)
		key_flag<=1'b1;
	else 
		key_flag<=1'b0;

    LED
    LED_inst(
        .sys_clk        (sys_clk),
        .sys_rst_n      (sys_rst_n),
        .cstate         (cstate),

        .LED_out        (LED_out)
    );

    Speed_meter
    #(
        .CNT_RISE_MAX(28'd12_499_999),
        .CNT_GATE_S_MAX(28'd74_999_999),
        .CLK_STAND_FREQ(28'd100_000_000)
    )   
    Speed_meter_inst(   
        .clk            (sys_clk),
        .rst_n          (sys_rst_n),
        .clk_test       (clk_test),
    
        .freq           (freq)
    );

    Three_KM_judge
    #(
        .TRAVEL_3KM ( 11'd1500)
    )
    Three_KM_judge_inst(
        .sys_clk        (sys_clk),
        .clk_test       (clk_test),
        .sys_rst_n      (sys_rst_n),
        .cstate         (cstate),
        
        .Three_KM_flag  (Three_KM_flag)
    );

    Speed_Slow_judge
    #(
        .SLOW_SPEED (1)
    )
    Speed_Slow_judge_inst(
        .sys_clk            (sys_clk),
        .sys_rst_n          (sys_rst_n),
        .freq               (freq),

        .Slow_speed_flag    (Slow_speed_flag)
    );

    Cost
    #(
        .Cost_0_1 ( 1),
        .CNT_25_MAX (5'd25),
        .COST_ACC_MAX (14'd9909),
        .CNT_10S_MAX (29'd500_000_000)
    )
    Cost_inst(
        .sys_clk            (sys_clk),
        .sys_rst_n          (sys_rst_n),
        .clk_test           (clk_test),
        .Three_KM_flag      (Three_KM_flag),
        .Slow_speed_flag    (Slow_speed_flag),
        .cstate             (cstate),
        
        .Cost_out           (Cost_out)
    );

    Seg
    Seg_inst(
        .clk                (sys_clk),
        .rst_n              (sys_rst_n),
        .disp_data          (Cost_out),
        .en                 (1'b1),
        .point              (4'b0001),
        
        .seg                (seg),
        .sel                (sel)
    );

endmodule 
