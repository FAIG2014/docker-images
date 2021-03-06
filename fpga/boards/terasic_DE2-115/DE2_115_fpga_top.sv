// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	DE2_115_Default
//
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author              :| Mod. Date :| Changes Made:
//   V1.1 :| HdHuang             :| 05/12/10  :| Initial Revision
//   V2.0 :| Eko       				:| 05/23/12  :| version 11.1
// ============================================================================



module DE2_115_fpga_top(

	//////// CLOCK //////////
	CLOCK_50,
   CLOCK2_50,
   CLOCK3_50,
	ENETCLK_25,

	//////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////// LED //////////
	LEDG,
	LEDR,

	//////// KEY //////////
	KEY,

	//////// SW //////////
	SW,

	//////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////// PS2 //////////
	PS2_CLK,
	PS2_DAT,
	PS2_CLK2,
	PS2_DAT2,

	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_N,

	//////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////// I2C for EEPROM //////////
	EEP_I2C_SCLK,
	EEP_I2C_SDAT,

	//////// I2C for Audio and Tv-Decode //////////
	I2C_SCLK,
	I2C_SDAT,

	//////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENET0_LINK100,

	//////// Ethernet 1 //////////
	ENET1_GTX_CLK,
	ENET1_INT_N,
	ENET1_MDC,
	ENET1_MDIO,
	ENET1_RST_N,
	ENET1_RX_CLK,
	ENET1_RX_COL,
	ENET1_RX_CRS,
	ENET1_RX_DATA,
	ENET1_RX_DV,
	ENET1_RX_ER,
	ENET1_TX_CLK,
	ENET1_TX_DATA,
	ENET1_TX_EN,
	ENET1_TX_ER,
	ENET1_LINK100,

	//////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

    /////// USB OTG controller/////
   OTG_DATA,
   OTG_ADDR,
   OTG_CS_N,
   OTG_WR_N,
   OTG_RD_N,
   OTG_INT,
   OTG_RST_N,
   
	//////// IR Receiver //////////
	IRDA_RXD,

	//////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////// Flash //////////
	FL_ADDR,
	FL_CE_N,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_RY,
	FL_WE_N,
	FL_WP_N,

	//////// GPIO //////////
	GPIO,

	//////// HSMC (LVDS) //////////
//	HSMC_CLKIN_N1,
//	HSMC_CLKIN_N2,
	HSMC_CLKIN_P1,
	HSMC_CLKIN_P2,
	HSMC_CLKIN0,
//	HSMC_CLKOUT_N1,
//	HSMC_CLKOUT_N2,
	HSMC_CLKOUT_P1,
	HSMC_CLKOUT_P2,
	HSMC_CLKOUT0,
	HSMC_D,
//	HSMC_RX_D_N,
	HSMC_RX_D_P,
//	HSMC_TX_D_N,
	HSMC_TX_D_P,
   //////// EXTEND IO //////////
   EX_IO	
);

//=======================================================
//  PARAMETER declarations
//=======================================================
genvar gv;

//=======================================================
//  PORT declarations
//=======================================================

`define CLOCK
`define Sma
`define LED
`define KEY
`define SW
`define SEG7
`define LCD
`define RS232
`define PS2
`define SDCARD
`define VGA
`define Audio
`define I2C_for_EEPROM
`define I2C_for_Audio_and_TvDecode
`define Ethernet_0
`define Ethernet_1
`define TV_Decoder
`define USB_OTG_controller
`define IR_Receiver
`define SDRAM
`define SRAM
`define Flash
`define GPIO
`define HSMC
`define EXTEND_IO

//////////// CLOCK //////////
//3.3-V LVTTL//
`ifdef CLOCK
input	logic          			CLOCK_50;
input	logic	          			CLOCK2_50;
input	logic	          			CLOCK3_50;
input	logic	          			ENETCLK_25;
`endif

//////////// Sma //////////
//3.3-V LVTTL//
`ifdef Sma
input		          			SMA_CLKIN;
output		          		SMA_CLKOUT;
`endif

//////////// LED //////////
//2.5 V//
`ifdef LED
output		     [8:0]		LEDG;
output		     [17:0]		LEDR;
`endif

//////////// KEY //////////
//2.5 V//
`ifdef KEY
input		        [3:0]		KEY;
`endif

//////////// SW //////////
//2.5 V//
`ifdef SW
input		        [17:0]		SW;
`endif

//////////// SEG7 //////////
//3.3-V LVTTL//
`ifdef SEG7
output		     [6:0]		HEX0;//2.5 V//
output		     [6:0]		HEX1;//2.5 V//
output		     [6:0]		HEX2;//2.5 V//
output		     [6:0]		HEX3;//2.5 V [1:0]//
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;
`endif

//////////// LCD //////////
//3.3-V LVTTL//
`ifdef LCD
output		          		LCD_BLON;
inout		        [7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;
`endif

//////////// RS232 //////////
//3.3-V LVTTL//
`ifdef RS232
input		          		UART_CTS;
output		          			UART_RTS;
input		          			UART_RXD;
output		          		UART_TXD;
`endif

//////////// PS2 //////////
//3.3-V LVTTL//
`ifdef PS2
inout		          			PS2_CLK;
inout		          			PS2_DAT;
inout		          			PS2_CLK2;
inout		          			PS2_DAT2;
`endif

//////////// SDCARD //////////
//3.3-V LVTTL//
`ifdef SDCARD
output		          		SD_CLK;
inout		          			SD_CMD;
inout		    	  [3:0]		SD_DAT;
input		          			SD_WP_N;
`endif

//////////// VGA //////////
//3.3-V LVTTL//
`ifdef VGA
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;
`endif

//////////// Audio //////////
//3.3-V LVTTL//
`ifdef Audio
input		          			AUD_ADCDAT;
inout		          			AUD_ADCLRCK;
inout		          			AUD_BCLK;
output		          		AUD_DACDAT;
inout		          			AUD_DACLRCK;
output		          		AUD_XCK;
`endif

//////////// I2C for EEPROM //////////
//3.3-V LVTTL//
`ifdef I2C_for_EEPROM
output		          		EEP_I2C_SCLK;
inout		          			EEP_I2C_SDAT;
`endif

//////////// I2C for Audio and Tv-Decode //////////
//3.3-V LVTTL//
`ifdef I2C_for_Audio_and_TvDecode
output		          		I2C_SCLK;
inout		          			I2C_SDAT;
`endif

//////////// Ethernet 0 //////////
//2.5 V//
`ifdef Ethernet_0
output		          		ENET0_GTX_CLK;
input		          			ENET0_INT_N;
output		          		ENET0_MDC;
inout		          			ENET0_MDIO;
output		          		ENET0_RST_N;
input		          			ENET0_RX_CLK;
input		          			ENET0_RX_COL;
input		          			ENET0_RX_CRS;
input		     	  [3:0]		ENET0_RX_DATA;
input		          			ENET0_RX_DV;
input		          			ENET0_RX_ER;
input		          			ENET0_TX_CLK;
output		     [3:0]		ENET0_TX_DATA;
output		          		ENET0_TX_EN;
output		          		ENET0_TX_ER;
input		          			ENET0_LINK100;
`endif

//////////// Ethernet 1 //////////
//2.5 V//
`ifdef Ethernet_1
output		          		ENET1_GTX_CLK;
input		          			ENET1_INT_N;
output		          		ENET1_MDC;
inout		          			ENET1_MDIO;
output		          		ENET1_RST_N;
input		          			ENET1_RX_CLK;
input		          			ENET1_RX_COL;
input		          			ENET1_RX_CRS;
input		     	  [3:0]		ENET1_RX_DATA;
input		          			ENET1_RX_DV;
input		          			ENET1_RX_ER;
input		          			ENET1_TX_CLK;
output		     [3:0]		ENET1_TX_DATA;
output		          		ENET1_TX_EN;
output		          		ENET1_TX_ER;
input		          			ENET1_LINK100;
`endif

//////////// TV Decoder 1 //////////
//3.3-V LVTTL//
`ifdef TV_Decoder
input		          			TD_CLK27;
input		     	  [7:0]		TD_DATA;
input		          			TD_HS;
output		          		TD_RESET_N;
input		          			TD_VS;
`endif


//////////// USB OTG controller //////////
//3.3-V LVTTL//
`ifdef USB_OTG_controller
inout            [15:0]    OTG_DATA;
output           [1:0]     OTG_ADDR;
output                     OTG_CS_N;
output                     OTG_WR_N;
output                     OTG_RD_N;
input                      OTG_INT;
output                     OTG_RST_N;
`endif

//////////// IR Receiver //////////
//3.3-V LVTTL//
`ifdef IR_Receiver
input		          			IRDA_RXD;
`endif

//////////// SDRAM //////////
//3.3-V LVTTL//
`ifdef SDRAM
output		     [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout		        [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;
`endif

//////////// SRAM //////////
//3.3-V LVTTL//
`ifdef SRAM
output		     [19:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout		        [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;
`endif

//////////// Flash //////////
//3.3-V LVTTL//
`ifdef Flash
output		     [22:0]		FL_ADDR;
output		          		FL_CE_N;
inout		        [7:0]		FL_DQ;
output		          		FL_OE_N;
output		          		FL_RST_N;
input		          			FL_RY;
output		          		FL_WE_N;
output		          		FL_WP_N;
`endif

//////////// GPIO //////////
//3.3-V LVTTL//
`ifdef GPIO
inout		        [35:0]		GPIO;
`endif

//////////// HSMC (LVDS) //////////
//2.5 V//
//input		          		HSMC_CLKIN_N1;
//input		          		HSMC_CLKIN_N2;
`ifdef HSMC
input		          			HSMC_CLKIN_P1;
input		          			HSMC_CLKIN_P2;
input		          			HSMC_CLKIN0;
//output		          		HSMC_CLKOUT_N1;
//output		          		HSMC_CLKOUT_N2;
output		          		HSMC_CLKOUT_P1;
output		          		HSMC_CLKOUT_P2;
output		          		HSMC_CLKOUT0;
inout		        [3:0]		HSMC_D;
//input		     [16:0]		HSMC_RX_D_N;
input		        [16:0]		HSMC_RX_D_P;
//output		     [16:0]		HSMC_TX_D_N;
output		     [16:0]		HSMC_TX_D_P;
`endif

//////// EXTEND IO //////////
//3.3-V LVTTL//
`ifdef EXTEND_IO
inout		        [6:0]		EX_IO;
`endif





    logic   CLOCK_50_reset;
    logic   CLOCK2_50_reset;
    logic   CLOCK3_50_reset;
    logic   ENETCLK_25_reset;

    reset_generator reset_generator_CLOCK_50    (.clk(CLOCK_50),    .in_reset(~KEY[0]),  .out_reset(CLOCK_50_reset) );
    reset_generator reset_generator_CLOCK2_50   (.clk(CLOCK2_50),   .in_reset(~KEY[0]),  .out_reset(CLOCK2_50_reset) );
    reset_generator reset_generator_CLOCK3_50   (.clk(CLOCK3_50),   .in_reset(~KEY[0]),  .out_reset(CLOCK3_50_reset) );
    reset_generator reset_generator_ENETCLK_25  (.clk(ENETCLK_25),  .in_reset(~KEY[0]),  .out_reset(ENETCLK_25_reset) );

    logic start_period;

    timer
        #(
            .CLK_FREQ_MZ(50),
            .TIMER_PERIOD_NS(nano_second_time_pkg::SECOND)
        )
    U_timer
        (
            .clk(CLOCK_50),
            .reset(CLOCK_50_reset),

            .start_period(start_period)
        );

    logic               [3:0]       KEY_DEBOUCE;

generate

    for( gv = 0; gv < 4; gv++ ) begin : KEY_DEBOUNCE_INST

        debouncer
            #(
                .CLK_FREQ_MZ(50)
            )
        U_debouncer
            (
                .clk(CLOCK_50),
                .reset(CLOCK_50_reset),

                .button(KEY[gv]),
                .button_deboused(KEY_DEBOUCE[gv])
            );
    end
endgenerate

    localparam BCD_NUM = 8;
    logic [3:0]       bcds[BCD_NUM-1:0];

    bcd_counter
        #(
            .BCD_NUM(BCD_NUM)
        )
    U_bcd_counter
        (
            .clk(CLOCK_50),
            .reset(CLOCK_50_reset),

            .incr(start_period),
            .reset_counter(1'b0),
            .bcds(bcds)
        );


    logic [7:0]       segments[BCD_NUM-1:0];

    generate

        for (gv = 0 ; gv < BCD_NUM ; gv++) begin: gen_for_single_segment

            single_segment 
            #(
                .BASE_10(0)
            )
            U_single_segment 
            (
                .clk(CLOCK_50),
                .reset(CLOCK_50_reset),

                .value(bcds[gv]),
                .segment(segments[gv])

            );
        end

    endgenerate


    assign HEX0 = segments[0];
    assign HEX1 = segments[1];
    assign HEX2 = segments[2];
    assign HEX3 = segments[3];
    assign HEX4 = segments[4];
    assign HEX5 = segments[5];
    assign HEX6 = segments[6];
    assign HEX7 = segments[7];

    assign LEDR[0] = start_period;
    assign LEDR[1] = CLOCK_50_reset;
    assign LEDG[1] = bcds[0];


logic                   refresh;
string_pkg::string_t    line0;
string_pkg::string_t    line1;

LCD_printer 			
    #(
        .CLK_FREQ_MZ(50)
    )
    U_LCD_printer	
    (	//	Host Side
        .clk(CLOCK_50),
        .reset(CLOCK_50_reset),

        .refresh(refresh),
        .line0(line0),
        .line1(line1),

        //	LCD Side
        .LCD_DATA(LCD_DATA),
        .LCD_RW(LCD_RW),
        .LCD_EN(LCD_EN),
        .LCD_RS(LCD_RS),
        .LCD_ON(LCD_ON),
        .LCD_BLON(LCD_BLON)
    );


    logic       key_up;
    logic       key_up_reg;
    logic [2:0] current_seting;
    byte        current_seting_char;


    assign key_up = KEY_DEBOUCE[1];

    always begin
        line0 = string_pkg::string_t'("X:wrong setting ");
        line1 = string_pkg::string_t'("test            ");

        case(current_seting)
            0: begin
                line0 = string_pkg::string_t'("0: time counter ");
                line1 = string_pkg::string_t'("test            ");
            end
            default: begin
            end
        endcase

        line1[0] = current_seting_char;
    end



always_ff@(posedge CLOCK_50) begin
    if (CLOCK_50_reset == 1'b1) begin
        current_seting  <= '0;
        key_up_reg      <= '0;
        refresh         <= '0;

    end else begin
        if (key_up) begin
            current_seting <= current_seting +1;
        end
        current_seting_char <= current_seting + 8'h30;
        key_up_reg <= key_up;
        refresh  <= key_up_reg;
    end
end



endmodule
