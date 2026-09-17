`timescale 1ns / 1ps

module clk_gen
(
    input  wire areset,
    input  wire inclk0,
    output wire c0
);

    wire clkfx_unbuffered;

    DCM_SP
    #(
        .CLK_FEEDBACK          ("NONE"),
        .CLKFX_MULTIPLY        (2),
        .CLKFX_DIVIDE          (1),
        .CLKIN_DIVIDE_BY_2     ("FALSE"),
        .CLKIN_PERIOD          (83.333),
        .CLKOUT_PHASE_SHIFT    ("NONE"),
        .DESKEW_ADJUST         ("SYSTEM_SYNCHRONOUS"),
        .DFS_FREQUENCY_MODE    ("LOW"),
        .DLL_FREQUENCY_MODE    ("LOW"),
        .DUTY_CYCLE_CORRECTION ("TRUE"),
        .FACTORY_JF            (16'hC080),
        .PHASE_SHIFT           (0),
        .STARTUP_WAIT          ("FALSE")
    )
    DCM_SP_inst
    (
        .CLKIN    (inclk0),
        .CLKFB    (1'b0),
        .RST      (areset),
        .DSSEN    (1'b0),
        .PSCLK    (1'b0),
        .PSEN     (1'b0),
        .PSINCDEC (1'b0),
        .CLKFX    (clkfx_unbuffered),
        .CLK0     (),
        .CLK90    (),
        .CLK180   (),
        .CLK270   (),
        .CLK2X    (),
        .CLK2X180 (),
        .CLKDV    (),
        .CLKFX180 (),
        .LOCKED   (),
        .PSDONE   (),
        .STATUS   ()
    );

    BUFG BUFG_inst
    (
        .I (clkfx_unbuffered),
        .O (c0)
    );

endmodule
