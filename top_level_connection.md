# 顶层模块连接框图

本图严格对应当前 `Control.v` 的实例化和端口映射。图中未加入源码中不存在的连接。

```mermaid
flowchart LR
    I_CLK([sys_clk]) --> CTRL[[Control]]
    I_RST([sys_rst_n]) --> CTRL
    I_DIP([dip_sw]) --> CTRL
    I_TEST([clk_test]) --> CTRL

    CTRL -->|sys_clk, sys_rst_n, cstate| LED[[LED]]
    CTRL -->|clk=sys_clk, rst_n=sys_rst_n, clk_test| SM[[Speed_meter]]
    CTRL -->|sys_clk, clk_test, sys_rst_n, cstate| KM[[Three_KM_judge]]
    CTRL -->|sys_clk, sys_rst_n| SJ[[Speed_Slow_judge]]
    CTRL -->|sys_clk, sys_rst_n, clk_test, cstate| COST[[Cost]]
    CTRL -->|clk=sys_clk, rst_n=sys_rst_n, en=1, point=4'b0001| SEG[[Seg]]

    SM -->|freq[33:0]| SJ
    KM -->|Three_KM_flag| COST
    SJ -->|Slow_speed_flag| COST
    COST -->|Cost_out[15:0]| SEG

    LED -->|LED_out| O_LED([LED_out])
    SEG -->|seg[7:0]| O_SEG([seg[7:0]])
    SEG -->|sel[3:0]| O_SEL([sel[3:0]])
```

## 连接关系

| 来源 | 目标 | 实际连接 |
|---|---|---|
| 外部输入 | `Control` | `sys_clk`、`sys_rst_n`、`dip_sw`、`clk_test` |
| `Control` | `LED` | `sys_clk`、`sys_rst_n`、`cstate` |
| `Control` | `Speed_meter` | `sys_clk`→`clk`、`sys_rst_n`→`rst_n`、`clk_test` |
| `Control` | `Three_KM_judge` | `sys_clk`、`clk_test`、`sys_rst_n`、`cstate` |
| `Control` | `Speed_Slow_judge` | `sys_clk`、`sys_rst_n` |
| `Control` | `Cost` | `sys_clk`、`sys_rst_n`、`clk_test`、`Three_KM_flag`、`Slow_speed_flag`、`cstate` |
| `Control` | `Seg` | `sys_clk`→`clk`、`sys_rst_n`→`rst_n`、`Cost_out`→`disp_data`、`en=1`、`point=4'b0001` |
| `Speed_meter` | `Speed_Slow_judge` | `freq[33:0]` |
| `Three_KM_judge` | `Cost` | `Three_KM_flag` |
| `Speed_Slow_judge` | `Cost` | `Slow_speed_flag` |
| `Cost` | `Seg` | `Cost_out[15:0]` |
| `LED` | 顶层输出 | `LED_out` |
| `Seg` | 顶层输出 | `seg[7:0]`、`sel[3:0]` |

## 未纳入当前顶层连线的模块

`clk_gen.v` 虽在工程文件中，但当前 `Speed_meter.v` 未实例化 `clk_gen`，所以不属于当前有效的顶层模块连接关系。
