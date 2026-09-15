`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:14:55 09/15/2026 
// Design Name: 
// Module Name:    Speed_meter 
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

module Speed_meter
#(
	parameter           CNT_RISE_MAX=28'd12_499_999,
	parameter           CNT_GATE_S_MAX=28'd74_999_999,
	parameter           CLK_STAND_FREQ=28'd100_000_000
)   
(   
	input wire          clk,
	input wire          rst_n,
	input wire          clk_test,
	
	output reg [33:0]   freq
);

	reg [27:0]          cnt_gate_s;
	reg                 gate_s;
	reg                 gate_a;
	reg                 gate_a_stand;
	wire                gate_a_fall_s;
	reg [47:0]          cnt_clk_stand;
	reg [47:0]          cnt_clk_stand_reg;
	reg                 gate_a_test;
	wire                gate_a_fall_t;
	reg [47:0]          cnt_clk_test;
	reg [47:0]          cnt_clk_test_reg;
	reg                 calc_flag;
	reg [63:0]          freq_reg;
	reg                 calc_flag_reg;
	
	wire                clk_stand; 

    //标准时钟设为100MHz
	clk_gen clk_gen_inst(
		.areset(~rst_n),
		.inclk0(clk),
		.c0(clk_stand)
	);
	
	//闸门计数器
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		cnt_gate_s<=1'b0;
	else if(cnt_gate_s==CNT_GATE_S_MAX)
		cnt_gate_s<=1'b0;
	else 
		cnt_gate_s<=cnt_gate_s+1'b1;
		
	//闸门控制，
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		gate_s<=1'b0;
	else if((cnt_gate_s>=CNT_RISE_MAX) && cnt_gate_s<=(CNT_GATE_S_MAX-CNT_RISE_MAX))
		gate_s<=1'b1;
	else 
		gate_s<=1'b0;
		
	//将闸门打一拍，与时钟同步
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		gate_a<=1'b0;
	else 
		gate_a<=gate_s;
		
	//将标准时钟闸门再打一拍，以便生成标志信号gate_a_fall_s
	always @(posedge clk_stand or negedge rst_n)
	if(!rst_n)
		gate_a_stand<=1'b0;
	else 
		gate_a_stand<=gate_a;
		
	//标准频率计数截止信号
	assign gate_a_fall_s=(gate_a_stand && !gate_a) ? 1'b1:1'b0;

	//标准时钟频率计数器
	always @(posedge clk_stand or negedge rst_n)
	if(!rst_n)
		cnt_clk_stand<=1'b0;
	else if(!gate_a)
		cnt_clk_stand<=1'b0;
	else if(gate_a)
		cnt_clk_stand<=cnt_clk_stand+1'b1;

	//标准时钟频率周期个数寄存器
	always @(posedge clk_stand or negedge rst_n)
	if(!rst_n)
		cnt_clk_stand_reg<=1'b0;
	else if(gate_a_fall_s)
		cnt_clk_stand_reg<=cnt_clk_stand;
		
	//将待测时钟打一拍，以便生成gate_a_fall_t
	always @(posedge clk_test or negedge rst_n)
	if(!rst_n)
		gate_a_test<=1'b0;
	else 
		gate_a_test<=gate_a;
	
	//待测时钟计数截止信号
	assign gate_a_fall_t=(gate_a_test && !gate_a) ? 1'b1:1'b0;
		
	//待测时钟频率计数器
	always @(posedge clk_test or negedge rst_n)
	if(!rst_n)
		cnt_clk_test<=1'b0;
	else if(!gate_a)
		cnt_clk_test<=1'b0;
	else if(gate_a)
		cnt_clk_test<=cnt_clk_test+1'b1;
		
	//待测时钟频率周期个数寄存器
	always @(posedge clk_test or negedge rst_n)
	if(!rst_n)
		cnt_clk_test_reg<=1'b0;
	else if(gate_a_fall_t)
		cnt_clk_test_reg<=cnt_clk_test;
		
	//频率计算标志信号
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		calc_flag<=1'b0;
	else if(cnt_gate_s==CNT_GATE_S_MAX)
		calc_flag<=1'b1;
	else
		calc_flag<=1'b0;
		
	//待测时钟频率计算
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		freq_reg<=1'b0;
	else if(calc_flag)
		freq_reg<=(CLK_STAND_FREQ*cnt_clk_test_reg/cnt_clk_stand_reg);
		
	//将计算标志信号打一拍，不然freq输出的是计算之前的值
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		calc_flag_reg<=1'b0;
	else 
		calc_flag_reg<=calc_flag;
		
	//频率值输出
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		freq<=1'b0;
	else if(calc_flag_reg)
		freq<=freq_reg[33:0];
	

endmodule 
