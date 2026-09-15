`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:17:01 09/15/2026 
// Design Name: 
// Module Name:    Cost 
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

module Cost
#(
    parameter           Cost_0_1 = 1,
    parameter           CNT_25_MAX = 5'd25,
    parameter           COST_ACC_MAX = 14'd9909,
    parameter           CNT_10S_MAX = 29'd500_000_000
)
(
    input wire          sys_clk,
    input wire          sys_rst_n,
    input wire          clk_test,
    input wire          Three_KM_flag,
    input wire          Slow_speed_flag,
    input wire [1:0]    cstate,
    
    output reg [15:0]   Cost_out
);
    reg [15:0]          Cost_out_reg;

    reg                 cstate_t;
    reg                 cstate_po;

    reg                 clk_test_t;
    reg                 clk_test_po;

    reg [3:0]           Cost_acc_unit;
    reg [3:0]           Cost_acc_ten;
    reg [3:0]           Cost_acc_hun;
    reg [3:0]           Cost_acc_tho;

    reg [4:0]           CNT_25;              //一分钱走25圈

    reg [28:0]          cnt_10s;             //记十秒

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        clk_test_t <= 1'b0;
    else 
        clk_test_t <= clk_test;

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        clk_test_po <= 1'b0;
    else if(clk_test && !clk_test_t)
        clk_test_po <= 1'b1;
    else
        clk_test_po <= 1'b0;

    always @(posedge clk_test or negedge sys_rst_n)
    if(!sys_rst_n)
        cstate_t <= 1'b0;
    else
        cstate_t <= cstate[0];

    always @(posedge clk_test or negedge sys_rst_n)
    if(!sys_rst_n)
        cstate_po <= 1'b0;
    else if(cstate[0] && !cstate_t)
        cstate_po <= 1'b1;
    else 
        cstate_po <= 1'b0;

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_10s <= 29'd0;
    else if(cnt_10s == CNT_10S_MAX && Slow_speed_flag && cstate == 2'b01 && Three_KM_flag)
        cnt_10s <= 29'd0;
    else if(Slow_speed_flag && cstate == 2'b01 && Three_KM_flag)
        cnt_10s <= cnt_10s + 1'b1;

    always @(posedge clk_test or negedge sys_rst_n)
    if(!sys_rst_n)
        CNT_25 <= 5'd0;
    else if(CNT_25 == CNT_25_MAX && cstate == 2'b01 && !Slow_speed_flag && Three_KM_flag)
        CNT_25 <= 5'd0;
    else if(cstate == 2'b01 && !Slow_speed_flag && Three_KM_flag)
        CNT_25 <= CNT_25 + 1'b1;



    /*三公里后的车费累加*/

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Cost_acc_unit <= 4'd0;
    else if(cstate == 2'b00)
        Cost_acc_unit <= 4'd0;
    else if(!Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_unit == 4'd9 && CNT_25 == CNT_25_MAX && clk_test_po)
            Cost_acc_unit <= 4'd0;
        else if(CNT_25 == CNT_25_MAX && clk_test_po)
            Cost_acc_unit <= Cost_acc_unit + 1'b1;
    end
    else if(Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_unit == 4'd9 && cnt_10s == CNT_10S_MAX)
            Cost_acc_unit <= 4'd0;
        else if(cnt_10s == CNT_10S_MAX)
            Cost_acc_unit <= Cost_acc_unit + 1'b1;
    end
    else if(cstate == 2'b10)
        Cost_acc_unit <= Cost_acc_unit;



    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Cost_acc_ten <= 4'd0;
    else if(cstate_po)
        Cost_acc_ten <= 4'd9;
    else if(cstate == 2'b00)
        Cost_acc_ten <= 4'd0;
    else if(!Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_ten == 4'd9 && Cost_acc_unit == 4'd9 && CNT_25 == CNT_25_MAX && clk_test_po)
            Cost_acc_ten <= 4'd0;
        else if(CNT_25 == CNT_25_MAX && Cost_acc_unit == 4'd9 && clk_test_po)
            Cost_acc_ten <= Cost_acc_ten + 1'b1;
    end
    else if(Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_ten == 4'd9 && Cost_acc_unit == 4'd9 && cnt_10s == CNT_10S_MAX)
            Cost_acc_ten <= 4'd0;
        else if(cnt_10s == CNT_10S_MAX && Cost_acc_unit == 4'd9)
            Cost_acc_ten <= Cost_acc_ten + 1'b1;
    end
    else if(cstate == 2'b10)
        Cost_acc_ten <= Cost_acc_ten;
    

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Cost_acc_hun <= 4'd0;
    else if(cstate == 2'b00)
        Cost_acc_hun <= 4'd0;
    else if(!Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_hun == 4'd9 && Cost_acc_ten == 4'd9 && Cost_acc_unit == 4'd9 && CNT_25 == CNT_25_MAX && clk_test_po)
            Cost_acc_hun <= 4'd0;
        else if(CNT_25 == CNT_25_MAX && Cost_acc_unit == 4'd9 && Cost_acc_ten == 4'd9 && clk_test_po)
            Cost_acc_hun <= Cost_acc_hun + 1'b1;
    end
    else if(Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_hun == 4'd9 && Cost_acc_ten == 4'd9 && Cost_acc_unit == 4'd9 && cnt_10s == CNT_10S_MAX)
            Cost_acc_hun <= 4'd0;
        else if(cnt_10s == CNT_10S_MAX && Cost_acc_unit == 4'd9 && Cost_acc_ten == 4'd9 && cnt_10s == CNT_10S_MAX)
            Cost_acc_hun <= Cost_acc_hun + 1'b1;
    end
    else if(cstate == 2'b10)
        Cost_acc_hun <= Cost_acc_hun;
    

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Cost_acc_tho <= 4'd0;
    else if(cstate == 2'b00)
        Cost_acc_tho <= 4'd0;
    else if(!Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_tho == 4'd9 && Cost_acc_hun == 4'd9 && Cost_acc_ten == 4'd9 && Cost_acc_unit == 4'd9 && CNT_25 == CNT_25_MAX && clk_test_po)
            Cost_acc_tho <= 4'd0;
        else if(CNT_25 == CNT_25_MAX && Cost_acc_unit == 4'd9 && Cost_acc_ten == 4'd9 && Cost_acc_hun == 4'd9 && clk_test_po)
            Cost_acc_tho <= Cost_acc_tho + 1'b1;
    end
    else if(Slow_speed_flag && Three_KM_flag && cstate == 2'b01)begin
        if(Cost_acc_tho == 4'd9 && Cost_acc_ten == 4'd9 && Cost_acc_unit == 4'd9 && cnt_10s == CNT_10S_MAX && Cost_acc_hun == 4'd9)
            Cost_acc_tho <= 4'd0;
        else if(cnt_10s == CNT_10S_MAX && Cost_acc_unit == 4'd9 && Cost_acc_ten == 4'd9 && cnt_10s == CNT_10S_MAX && Cost_acc_hun == 4'd9)
            Cost_acc_tho <= Cost_acc_tho + 1'b1;
    end
    else if(cstate == 2'b10)
        Cost_acc_tho <= Cost_acc_tho;
    

    /*总车费计算*/
    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Cost_out_reg <= 14'd0;
    else
        Cost_out_reg <= {Cost_acc_tho,Cost_acc_hun,Cost_acc_ten,Cost_acc_unit};

    always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        Cost_out <= 14'd0;
    else 
        Cost_out <= Cost_out_reg;

endmodule 

