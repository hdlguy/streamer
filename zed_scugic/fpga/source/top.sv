//
module top (
    inout   logic [14:0]    DDR_addr,
    inout   logic [2:0]     DDR_ba,
    inout   logic           DDR_cas_n,
    inout   logic           DDR_ck_n,
    inout   logic           DDR_ck_p,
    inout   logic           DDR_cke,
    inout   logic           DDR_cs_n,
    inout   logic [3:0]     DDR_dm,
    inout   logic [31:0]    DDR_dq,
    inout   logic [3:0]     DDR_dqs_n,
    inout   logic [3:0]     DDR_dqs_p,
    inout   logic           DDR_odt,
    inout   logic           DDR_ras_n,
    inout   logic           DDR_reset_n,
    inout   logic           DDR_we_n,
    inout   logic           FIXED_IO_ddr_vrn,
    inout   logic           FIXED_IO_ddr_vrp,
    inout   logic [53:0]    FIXED_IO_mio,
    inout   logic           FIXED_IO_ps_clk,
    inout   logic           FIXED_IO_ps_porb,
    inout   logic           FIXED_IO_ps_srstb,
    //
    output  logic [15:0]    pmod_tri_o,
    output  logic [7:0]     leds_8bits_tri_o
);

    logic axi_aclk;
    logic[31:0] axi_count; 
    always_ff @(posedge axi_aclk) axi_count <= axi_count + 1;

    system system_i (
        .DDR_addr           (DDR_addr),
        .DDR_ba             (DDR_ba),
        .DDR_cas_n          (DDR_cas_n),
        .DDR_ck_n           (DDR_ck_n),
        .DDR_ck_p           (DDR_ck_p),
        .DDR_cke            (DDR_cke),
        .DDR_cs_n           (DDR_cs_n),
        .DDR_dm             (DDR_dm),
        .DDR_dq             (DDR_dq),
        .DDR_dqs_n          (DDR_dqs_n),
        .DDR_dqs_p          (DDR_dqs_p),
        .DDR_odt            (DDR_odt),
        .DDR_ras_n          (DDR_ras_n),
        .DDR_reset_n        (DDR_reset_n),
        .DDR_we_n           (DDR_we_n),
        .FIXED_IO_ddr_vrn   (FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp   (FIXED_IO_ddr_vrp),
        .FIXED_IO_mio       (FIXED_IO_mio),
        .FIXED_IO_ps_clk    (FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb   (FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb  (FIXED_IO_ps_srstb),
        //
        .leds_8bits_tri_o   (leds_8bits_tri_o),        
        .pmod_tri_o         (pmod_tri_o),
        //
        .axi_aclk           (axi_aclk),
        .icount             (axi_count[31:16])
    );
    
endmodule
