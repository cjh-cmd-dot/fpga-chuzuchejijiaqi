`timescale 1ns / 1ps

module Control
#(
    parameter           DIP_DEBOUNCE_MAX = 18'd239_999
)
(
    input wire          sys_clk,
    input wire          sys_rst_n,
    input wire          dip_sw,
    input wire          clk_test,

    output wire[7:0]    seg,
    output wire         LED_out,
    output wire[3:0]	sel
);

    localparam          STOP = 2'b00,
                        WORK = 2'b01,
                        DISPLAY = 2'b10;

    reg                 dip_meta;
    reg                 dip_sync;
    reg                 dip_stable;
    reg [17:0]          dip_debounce_cnt;
    reg                 dip_toggle_pulse;

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
    begin
        nstate = cstate;
        case (cstate)
            STOP :
                if(dip_toggle_pulse)
                    nstate = WORK;
            WORK : 
                if(dip_toggle_pulse)
                    nstate = DISPLAY;
            DISPLAY :
                if(dip_toggle_pulse)
                    nstate = STOP;
            default :
                nstate = STOP;
        endcase
    end

    always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
        begin
            dip_meta <= 1'b1;
            dip_sync <= 1'b1;
        end
        else
        begin
            dip_meta <= dip_sw;
            dip_sync <= dip_meta;
        end
    end

    always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
        begin
            dip_stable       <= 1'b1;
            dip_debounce_cnt <= 18'd0;
            dip_toggle_pulse <= 1'b0;
        end
        else
        begin
            dip_toggle_pulse <= 1'b0;
            if(dip_sync == dip_stable)
                dip_debounce_cnt <= 18'd0;
            else if(dip_debounce_cnt == DIP_DEBOUNCE_MAX)
            begin
                dip_stable       <= dip_sync;
                dip_debounce_cnt <= 18'd0;
                dip_toggle_pulse <= 1'b1;
            end
            else
                dip_debounce_cnt <= dip_debounce_cnt + 1'b1;
        end
    end

    LED
    LED_inst(
        .sys_clk        (sys_clk),
        .sys_rst_n      (sys_rst_n),
        .cstate         (cstate),

        .LED_out        (LED_out)
    );

    Speed_meter
    #(
        .CLK_FREQ_HZ(12_000_000)
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
        .CNT_25_MAX (5'd24),
        .COST_ACC_MAX (14'd9909),
        .CNT_10S_MAX (29'd119_999_999)
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
        .point              (4'b0100),
        
        .seg                (seg),
        .sel                (sel)
    );

endmodule 
