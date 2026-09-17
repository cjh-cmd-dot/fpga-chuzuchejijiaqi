`timescale 1ns / 1ps

module Speed_meter
#(
    parameter integer CLK_FREQ_HZ = 12_000_000
)
(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        clk_test,

    output reg  [33:0] freq
);

    reg        clk_test_meta;
    reg        clk_test_sync;
    reg        clk_test_sync_d;
    reg [23:0] sample_count;
    reg [33:0] pulse_count;

    wire clk_test_rise;

    assign clk_test_rise = clk_test_sync && !clk_test_sync_d;

    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            clk_test_meta   <= 1'b0;
            clk_test_sync   <= 1'b0;
            clk_test_sync_d <= 1'b0;
        end
        else
        begin
            clk_test_meta   <= clk_test;
            clk_test_sync   <= clk_test_meta;
            clk_test_sync_d <= clk_test_sync;
        end
    end

    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            sample_count <= 24'd0;
            pulse_count  <= 34'd0;
            freq         <= 34'd0;
        end
        else if(sample_count == CLK_FREQ_HZ - 1)
        begin
            sample_count <= 24'd0;
            freq         <= pulse_count + (clk_test_rise ? 1'b1 : 1'b0);
            pulse_count  <= 34'd0;
        end
        else
        begin
            sample_count <= sample_count + 1'b1;
            if(clk_test_rise)
                pulse_count <= pulse_count + 1'b1;
        end
    end

endmodule
