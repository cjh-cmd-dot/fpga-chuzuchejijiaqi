`timescale 1ns / 1ps
module Seg
(
	input wire 			clk,
	input wire 			rst_n,
	input wire [15:0]	disp_data,
	input wire 			en,
	input wire [3:0]	point,
	
	output reg[7:0]		seg,
	output wire[3:0]	sel
);

	reg [14:0]divder_cnt;
	
	reg clk_1K;
	
	reg [3:0]sel_r;
	
	reg [3:0]data_tmp;
	
	parameter disp0=8'b0011_1111;
	parameter disp1=8'b0000_0110;
	parameter disp2=8'b0101_1011;
	parameter disp3=8'b0100_1111;
	parameter disp4=8'b0110_0110;
	parameter disp5=8'b0110_1101;
	parameter disp6=8'b0111_1101;
	parameter disp7=8'b0000_0111;
	parameter disp8=8'b0111_1111;
	parameter disp9=8'b0110_1111;
	parameter dispa=8'b0111_0111;
	parameter dispb=8'b0111_1100;
	parameter dispc=8'b0011_1001;
	parameter dispd=8'b0101_1110;
	parameter dispe=8'b0111_1001;
	parameter dispf=8'b0111_1100;

	
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		divder_cnt<=15'd0;
	else if(!en)
		divder_cnt<=15'd0;
	else if(divder_cnt==15'd5999)
		divder_cnt<=15'd0;
	else
		divder_cnt<=divder_cnt+15'd1;
		
		
	always @(posedge clk or negedge rst_n)
	if(!rst_n)
		clk_1K<=1'b0;
	else if(divder_cnt==15'd5999)
		clk_1K<=~clk_1K;
	else 
		clk_1K<=clk_1K;
		
	always @(posedge clk_1K or negedge rst_n)
	if(!rst_n)
		sel_r<=4'b0001;
	else if(sel_r==4'b1000)
		sel_r<=4'b0001;
	else 
		sel_r<=sel_r<<1;

	always @(*)
		seg[7] = |(sel_r & point);

	always @(*)
		case(sel_r)
			4'b0001:data_tmp=disp_data[15:12];
			4'b0010:data_tmp=disp_data[11:8];
			4'b0100:data_tmp=disp_data[7:4];
			4'b1000:data_tmp=disp_data[3:0];
			default:data_tmp=4'b0000;
		endcase
	
	always@(*)
		case(data_tmp)
			4'h0:seg[6:0]=7'b011_1111;
			4'h1:seg[6:0]=7'b000_0110;
			4'h2:seg[6:0]=7'b101_1011;
			4'h3:seg[6:0]=7'b100_1111;
			4'h4:seg[6:0]=7'b110_0110;
			4'h5:seg[6:0]=7'b110_1101;
			4'h6:seg[6:0]=7'b111_1101;
			4'h7:seg[6:0]=7'b000_0111;
			4'h8:seg[6:0]=7'b111_1111;
			4'h9:seg[6:0]=7'b110_1111;
			4'ha:seg[6:0]=7'b111_0111;
			4'hb:seg[6:0]=7'b111_1100;
			4'hc:seg[6:0]=7'b011_1001;
			4'hd:seg[6:0]=7'b101_1110;
			4'he:seg[6:0]=7'b111_1001;
			4'hf:seg[6:0]=7'b000_0000;
			
		endcase
		
		assign sel=~sel_r;
		
endmodule 

