`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:17:54 09/15/2026 
// Design Name: 
// Module Name:    Seg 
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


module Seg
(
	input wire 			clk,
	input wire 			rst_n,
	input wire [15:0]	disp_data,
	input wire 			en,
	input wire [5:0]	point,
	
	output reg[7:0]		seg,
	output wire[3:0]	sel
);

	reg [14:0]divder_cnt;
	
	reg clk_1K;
	
	reg [3:0]sel_r;
	reg [1:0]cnt_sel;
	
	//待显示数据缓存
	reg [3:0]data_tmp;

	reg dot_disp;
	
	parameter disp0=8'b1100_0000;
	parameter disp1=8'b1111_1001;
	parameter disp2=8'b1010_0100;
	parameter disp3=8'b1011_0000;
	parameter disp4=8'b1001_1001;
	parameter disp5=8'b1001_0010;
	parameter disp6=8'b1000_0010;
	parameter disp7=8'b1111_1000;
	parameter disp8=8'b1000_0000;
	parameter disp9=8'b1001_0000;
	parameter dispa=8'b1000_1000;
	parameter dispb=8'b1000_0011;
	parameter dispc=8'b1010_0111;
	parameter dispd=8'b1010_0001;
	parameter dispe=8'b1000_0110;
	parameter dispf=8'b1000_0011;

	
	//分频计数器
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		divder_cnt<=15'd0;
	else if(!en)
		divder_cnt<=15'd0;
	else if(divder_cnt==15'd24999)
		divder_cnt<=15'd0;
	else
		divder_cnt<=divder_cnt+15'd1;
		
		
	//1KHz时钟产生模块
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		clk_1K<=1'b0;
	else if(divder_cnt==15'd24999)
		clk_1K<=~clk_1K;
	else 
		clk_1K<=clk_1K;
		
	//6位循环移位寄存器
	always @(posedge clk_1K or negedge rst_n)
	if(!rst_n)
		sel_r<=4'b0001;
	else if(sel_r==4'b1000)
		sel_r<=4'b0001;
	else 
		sel_r<=sel_r<<1;

	always @(posedge clk_1K or negedge rst_n)
	if(!rst_n)
		cnt_sel <= 1'b0;
	else if(cnt_sel == 2'b11)
		cnt_sel <= 1'b0;
	else 
		cnt_sel <= cnt_sel + 1'b1;

	always @(posedge clk_1K or negedge rst_n)
	if(!rst_n)
		dot_disp <= 1'b1;
	else 
		dot_disp <= ~point[cnt_sel];

	always @(*)
		seg[7] = dot_disp;

	//六选一多路器
	always @(*)
		case(sel_r)
			4'b0001:data_tmp=disp_data[3:0];
			4'b0010:data_tmp=disp_data[7:4];
			4'b0100:data_tmp=disp_data[11:8];
			4'b1000:data_tmp=disp_data[15:12];
			default:data_tmp=4'b0000;
		endcase
	
	always@(*)
		case(data_tmp)
			4'h0:seg[6:0]=7'b100_0000;
			4'h1:seg[6:0]=7'b111_1001;
			4'h2:seg[6:0]=7'b010_0100;
			4'h3:seg[6:0]=7'b011_0000;
			4'h4:seg[6:0]=7'b001_1001;
			4'h5:seg[6:0]=7'b001_0010;
			4'h6:seg[6:0]=7'b000_0010;
			4'h7:seg[6:0]=7'b111_1000;
			4'h8:seg[6:0]=7'b000_0000;
			4'h9:seg[6:0]=7'b001_0000;
			4'ha:seg[6:0]=7'b000_1000;
			4'hb:seg[6:0]=7'b000_0011;
			4'hc:seg[6:0]=7'b100_0110;
			4'hd:seg[6:0]=7'b010_0001;
			4'he:seg[6:0]=7'b000_0110;
			4'hf:seg[6:0]=7'b111_1111;
			
		endcase
		
		assign sel=~sel_r;
		
endmodule 

