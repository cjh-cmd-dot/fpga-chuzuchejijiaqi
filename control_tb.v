`timescale 1ns / 1ps

`define CLK_PERIOD 83.3333
`define TEST_PERIOD 800

module Control_tb;

reg sys_clk;
reg sys_rst_n;
reg dip_sw;
reg clk_test;

wire [7:0] seg;
wire [3:0] sel;
wire LED_out;
wire [15:0] cost_out;

integer pulse_index;
reg [15:0] held_cost;

assign cost_out = Control_inst.Cost_out;

task pulse_wheel;
    begin
        clk_test = 1'b1;
        #(`TEST_PERIOD / 2);
        clk_test = 1'b0;
        #(`TEST_PERIOD / 2);
    end
endtask

task check_digit;
    input [3:0] expected_sel;
    input [7:0] expected_seg;
    begin
        #1;
        if(sel !== expected_sel || seg !== expected_seg)
        begin
            $display("FAIL scan time=%0t sel=%b seg=%h expected_sel=%b expected_seg=%h",
                     $time, sel, seg, expected_sel, expected_seg);
            $stop;
        end
    end
endtask

initial sys_clk = 1'b0;
always #(`CLK_PERIOD / 2) sys_clk = ~sys_clk;

initial clk_test = 1'b0;

initial
begin
    sys_rst_n = 1'b0;
    dip_sw = 1'b1;
    pulse_index = 0;

    #500;
    sys_rst_n = 1'b1;
    #1000;
    if(cost_out !== 16'h0000 || Control_inst.cstate !== 2'b00)
    begin
        $display("FAIL STOP cost=%h state=%b", cost_out, Control_inst.cstate);
        $stop;
    end

    dip_sw = 1'b0;
    #2000;
    if(clk_test !== 1'b0 || Control_inst.cstate !== 2'b01 || cost_out !== 16'h0090)
    begin
        $display("FAIL start without wheel pulse cost=%h state=%b", cost_out, Control_inst.cstate);
        $stop;
    end

    wait(sel == 4'b1110);
    check_digit(4'b1110, 8'h3f);
    @(negedge sel[1]);
    check_digit(4'b1101, 8'h3f);
    @(negedge sel[2]);
    check_digit(4'b1011, 8'hef);
    @(negedge sel[3]);
    check_digit(4'b0111, 8'h3f);

    for(pulse_index = 0; pulse_index < 75; pulse_index = pulse_index + 1)
        pulse_wheel;

    dip_sw = 1'b1;
    #2000;
    if(Control_inst.cstate !== 2'b10)
    begin
        $display("FAIL DISPLAY state=%b", Control_inst.cstate);
        $stop;
    end
    held_cost = cost_out;
    #10000;
    if(cost_out !== held_cost)
    begin
        $display("FAIL DISPLAY cost changed from %h to %h", held_cost, cost_out);
        $stop;
    end
    $display("PASS startup display 009.0 and DISPLAY hold cost=%h", cost_out);
    $finish;
end

initial
begin
    #10000000;
    $display("FAIL simulation timeout");
    $stop;
end

Control
#(
    .DIP_DEBOUNCE_MAX(18'd9)
)
Control_inst
(
    .sys_clk   (sys_clk),
    .sys_rst_n (sys_rst_n),
    .dip_sw    (dip_sw),
    .clk_test  (clk_test),
    .seg       (seg),
    .sel       (sel),
    .LED_out   (LED_out)
);

defparam Control_inst.Speed_meter_inst.CLK_FREQ_HZ = 120;
defparam Control_inst.Three_KM_judge_inst.TRAVEL_3KM = 25;
defparam Control_inst.Cost_inst.CNT_25_MAX = 24;
defparam Control_inst.Cost_inst.CNT_10S_MAX = 1199;
defparam Control_inst.Speed_Slow_judge_inst.SLOW_SPEED = 1;

endmodule
