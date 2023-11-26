-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/26/2023 08:19:18"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MAQUINA_DE_TROCO IS
    PORT (
	CLK : IN std_logic;
	T : IN std_logic;
	V : IN std_logic_vector(9 DOWNTO 0);
	C : OUT std_logic_vector(5 DOWNTO 0);
	I : OUT std_logic_vector(5 DOWNTO 0);
	led : OUT std_logic
	);
END MAQUINA_DE_TROCO;

-- Design Ports Information
-- T	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[0]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[1]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C[0]	=>  Location: PIN_AF8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C[1]	=>  Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C[2]	=>  Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C[3]	=>  Location: PIN_AE21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C[4]	=>  Location: PIN_W10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C[5]	=>  Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- I[0]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- I[1]	=>  Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- I[2]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- I[3]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- I[4]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- I[5]	=>  Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- V[9]	=>  Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[8]	=>  Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[7]	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[6]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[5]	=>  Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[4]	=>  Location: PIN_J23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[3]	=>  Location: PIN_J26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- V[2]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLK	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF MAQUINA_DE_TROCO IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_T : std_logic;
SIGNAL ww_V : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_C : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_I : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_led : std_logic;
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U3|V0|C000|FF4|q~regout\ : std_logic;
SIGNAL \U3|V0|C000|FF4|q~0_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \U3|C1|SUBTRATOR|FF6|S~combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF5|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF3|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\ : std_logic;
SIGNAL \U3|C1|AUX_4~1_combout\ : std_logic;
SIGNAL \U3|V0|C000|FF6|q~regout\ : std_logic;
SIGNAL \U3|V0|C000|FF2|q~0_combout\ : std_logic;
SIGNAL \U3|V0|C000|FF2|q~regout\ : std_logic;
SIGNAL \U3|C1|SUBTRATOR|FF3|S~combout\ : std_logic;
SIGNAL \U3|V0|C000|FF3|q~regout\ : std_logic;
SIGNAL \U3|C1|SUBTRATOR|FF5|S~combout\ : std_logic;
SIGNAL \U3|V0|C000|FF5|q~regout\ : std_logic;
SIGNAL \U3|C1|SUBTRATOR|FF5|Cout~combout\ : std_logic;
SIGNAL \U3|V0|C000|FF9|q~0_combout\ : std_logic;
SIGNAL \U3|V0|C000|FF8|q~0_combout\ : std_logic;
SIGNAL \U3|V0|C000|FF8|q~regout\ : std_logic;
SIGNAL \U3|V0|C000|FF7|q~0_combout\ : std_logic;
SIGNAL \U3|V0|C000|FF7|q~regout\ : std_logic;
SIGNAL \U3|V0|C000|FF9|q~1_combout\ : std_logic;
SIGNAL \U3|V0|C000|FF9|q~regout\ : std_logic;
SIGNAL \U3|C1|AUX_4~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF0|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF1|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF2|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF4|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF6|qS~0_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|COMP_Z1|Q~4_combout\ : std_logic;
SIGNAL \U3|C1|MOEDA_100|COMP_Z1|ALT_INV_Q~4_combout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_T <= T;
ww_V <= V;
C <= ww_C;
I <= ww_I;
led <= ww_led;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);
\U3|C1|MOEDA_100|COMP_Z1|ALT_INV_Q~4_combout\ <= NOT \U3|C1|MOEDA_100|COMP_Z1|Q~4_combout\;

-- Location: LCFF_X18_Y1_N11
\U3|V0|C000|FF4|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|V0|C000|FF4|q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF4|q~regout\);

-- Location: LCCOMB_X18_Y1_N10
\U3|V0|C000|FF4|q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|V0|C000|FF4|q~0_combout\ = \U3|V0|C000|FF4|q~regout\ $ (((\U3|C1|AUX_4~1_combout\ & ((\U3|V0|C000|FF2|q~regout\) # (\U3|V0|C000|FF3|q~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|V0|C000|FF2|q~regout\,
	datab => \U3|V0|C000|FF3|q~regout\,
	datac => \U3|V0|C000|FF4|q~regout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|V0|C000|FF4|q~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: CLKCTRL_G3
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: LCCOMB_X18_Y1_N26
\U3|C1|SUBTRATOR|FF6|S\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|SUBTRATOR|FF6|S~combout\ = \U3|C1|SUBTRATOR|FF5|Cout~combout\ $ (!\U3|V0|C000|FF6|q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|SUBTRATOR|FF5|Cout~combout\,
	datac => \U3|V0|C000|FF6|q~regout\,
	combout => \U3|C1|SUBTRATOR|FF6|S~combout\);

-- Location: LCCOMB_X19_Y1_N4
\U3|C1|MOEDA_100|CONT_M|FF5|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF5|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\ $ (((\U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\ & \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF5|qS~0_combout\);

-- Location: LCFF_X19_Y1_N5
\U3|C1|MOEDA_100|CONT_M|FF5|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF5|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\);

-- Location: LCCOMB_X18_Y1_N22
\U3|C1|MOEDA_100|COMP_Z1|Q~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\ = (\U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\) # ((\U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\) # (\U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\,
	combout => \U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\);

-- Location: LCCOMB_X19_Y1_N22
\U3|C1|MOEDA_100|CONT_M|FF3|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF3|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\ $ (\U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF3|qS~0_combout\);

-- Location: LCFF_X19_Y1_N23
\U3|C1|MOEDA_100|CONT_M|FF3|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF3|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\);

-- Location: LCCOMB_X19_Y1_N24
\U3|C1|MOEDA_100|COMP_Z1|Q~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\ = (\U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\) # ((\U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\) # ((\U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\) # (\U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\,
	combout => \U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\);

-- Location: LCCOMB_X18_Y1_N12
\U3|C1|AUX_4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|AUX_4~1_combout\ = (\U3|C1|AUX_4~0_combout\ & ((\U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\) # (\U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\,
	datac => \U3|C1|AUX_4~0_combout\,
	datad => \U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\,
	combout => \U3|C1|AUX_4~1_combout\);

-- Location: LCFF_X18_Y1_N27
\U3|V0|C000|FF6|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|SUBTRATOR|FF6|S~combout\,
	ena => \U3|C1|AUX_4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF6|q~regout\);

-- Location: LCCOMB_X18_Y1_N30
\U3|V0|C000|FF2|q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|V0|C000|FF2|q~0_combout\ = !\U3|V0|C000|FF2|q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U3|V0|C000|FF2|q~regout\,
	combout => \U3|V0|C000|FF2|q~0_combout\);

-- Location: LCFF_X18_Y1_N31
\U3|V0|C000|FF2|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|V0|C000|FF2|q~0_combout\,
	ena => \U3|C1|AUX_4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF2|q~regout\);

-- Location: LCCOMB_X18_Y1_N8
\U3|C1|SUBTRATOR|FF3|S\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|SUBTRATOR|FF3|S~combout\ = \U3|V0|C000|FF3|q~regout\ $ (!\U3|V0|C000|FF2|q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U3|V0|C000|FF3|q~regout\,
	datad => \U3|V0|C000|FF2|q~regout\,
	combout => \U3|C1|SUBTRATOR|FF3|S~combout\);

-- Location: LCFF_X18_Y1_N9
\U3|V0|C000|FF3|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|SUBTRATOR|FF3|S~combout\,
	ena => \U3|C1|AUX_4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF3|q~regout\);

-- Location: LCCOMB_X18_Y1_N4
\U3|C1|SUBTRATOR|FF5|S\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|SUBTRATOR|FF5|S~combout\ = \U3|V0|C000|FF5|q~regout\ $ (((\U3|V0|C000|FF4|q~regout\ & ((\U3|V0|C000|FF3|q~regout\) # (\U3|V0|C000|FF2|q~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|V0|C000|FF4|q~regout\,
	datab => \U3|V0|C000|FF3|q~regout\,
	datac => \U3|V0|C000|FF5|q~regout\,
	datad => \U3|V0|C000|FF2|q~regout\,
	combout => \U3|C1|SUBTRATOR|FF5|S~combout\);

-- Location: LCFF_X18_Y1_N5
\U3|V0|C000|FF5|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|SUBTRATOR|FF5|S~combout\,
	ena => \U3|C1|AUX_4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF5|q~regout\);

-- Location: LCCOMB_X18_Y1_N24
\U3|C1|SUBTRATOR|FF5|Cout\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|SUBTRATOR|FF5|Cout~combout\ = (((!\U3|V0|C000|FF3|q~regout\ & !\U3|V0|C000|FF2|q~regout\)) # (!\U3|V0|C000|FF5|q~regout\)) # (!\U3|V0|C000|FF4|q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|V0|C000|FF4|q~regout\,
	datab => \U3|V0|C000|FF3|q~regout\,
	datac => \U3|V0|C000|FF5|q~regout\,
	datad => \U3|V0|C000|FF2|q~regout\,
	combout => \U3|C1|SUBTRATOR|FF5|Cout~combout\);

-- Location: LCCOMB_X18_Y1_N0
\U3|V0|C000|FF9|q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|V0|C000|FF9|q~0_combout\ = (!\U3|V0|C000|FF7|q~regout\ & (\U3|C1|AUX_4~1_combout\ & ((\U3|C1|SUBTRATOR|FF5|Cout~combout\) # (!\U3|V0|C000|FF6|q~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|V0|C000|FF7|q~regout\,
	datab => \U3|V0|C000|FF6|q~regout\,
	datac => \U3|C1|SUBTRATOR|FF5|Cout~combout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|V0|C000|FF9|q~0_combout\);

-- Location: LCCOMB_X18_Y1_N18
\U3|V0|C000|FF8|q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|V0|C000|FF8|q~0_combout\ = \U3|V0|C000|FF8|q~regout\ $ (\U3|V0|C000|FF9|q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U3|V0|C000|FF8|q~regout\,
	datad => \U3|V0|C000|FF9|q~0_combout\,
	combout => \U3|V0|C000|FF8|q~0_combout\);

-- Location: LCFF_X18_Y1_N19
\U3|V0|C000|FF8|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|V0|C000|FF8|q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF8|q~regout\);

-- Location: LCCOMB_X18_Y1_N20
\U3|V0|C000|FF7|q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|V0|C000|FF7|q~0_combout\ = \U3|V0|C000|FF7|q~regout\ $ (((\U3|C1|AUX_4~1_combout\ & ((\U3|C1|SUBTRATOR|FF5|Cout~combout\) # (!\U3|V0|C000|FF6|q~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|SUBTRATOR|FF5|Cout~combout\,
	datab => \U3|V0|C000|FF6|q~regout\,
	datac => \U3|V0|C000|FF7|q~regout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|V0|C000|FF7|q~0_combout\);

-- Location: LCFF_X18_Y1_N21
\U3|V0|C000|FF7|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|V0|C000|FF7|q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF7|q~regout\);

-- Location: LCCOMB_X18_Y1_N28
\U3|V0|C000|FF9|q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|V0|C000|FF9|q~1_combout\ = \U3|V0|C000|FF9|q~regout\ $ (((!\U3|V0|C000|FF8|q~regout\ & \U3|V0|C000|FF9|q~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U3|V0|C000|FF8|q~regout\,
	datac => \U3|V0|C000|FF9|q~regout\,
	datad => \U3|V0|C000|FF9|q~0_combout\,
	combout => \U3|V0|C000|FF9|q~1_combout\);

-- Location: LCFF_X18_Y1_N29
\U3|V0|C000|FF9|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|V0|C000|FF9|q~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|V0|C000|FF9|q~regout\);

-- Location: LCCOMB_X18_Y1_N14
\U3|C1|AUX_4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|AUX_4~0_combout\ = (\U3|V0|C000|FF8|q~regout\) # ((\U3|V0|C000|FF7|q~regout\) # (\U3|V0|C000|FF9|q~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U3|V0|C000|FF8|q~regout\,
	datac => \U3|V0|C000|FF7|q~regout\,
	datad => \U3|V0|C000|FF9|q~regout\,
	combout => \U3|C1|AUX_4~0_combout\);

-- Location: LCCOMB_X19_Y1_N16
\U3|C1|MOEDA_100|CONT_M|FF0|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF0|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\ $ (((\U3|C1|AUX_4~0_combout\ & ((\U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\) # (\U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\,
	datab => \U3|C1|AUX_4~0_combout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\,
	datad => \U3|C1|MOEDA_100|COMP_Z1|Q~3_combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF0|qS~0_combout\);

-- Location: LCFF_X19_Y1_N17
\U3|C1|MOEDA_100|CONT_M|FF0|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF0|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\);

-- Location: LCCOMB_X19_Y1_N14
\U3|C1|MOEDA_100|CONT_M|FF1|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF1|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\ $ (((\U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\ & \U3|C1|AUX_4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF1|qS~0_combout\);

-- Location: LCFF_X19_Y1_N15
\U3|C1|MOEDA_100|CONT_M|FF1|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF1|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\);

-- Location: LCCOMB_X19_Y1_N28
\U3|C1|MOEDA_100|CONT_M|FF2|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF2|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\ $ (((\U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\ & \U3|C1|AUX_4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF2|qS~0_combout\);

-- Location: LCFF_X19_Y1_N29
\U3|C1|MOEDA_100|CONT_M|FF2|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF2|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\);

-- Location: LCCOMB_X19_Y1_N30
\U3|C1|MOEDA_100|CONT_M|aux_MUX03a\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\ = (\U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\ & \U3|C1|AUX_4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\);

-- Location: LCCOMB_X19_Y1_N26
\U3|C1|MOEDA_100|CONT_M|FF4|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF4|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\ $ (((\U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\ & \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|aux_MUX03a~combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF4|qS~0_combout\);

-- Location: LCFF_X19_Y1_N27
\U3|C1|MOEDA_100|CONT_M|FF4|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF4|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\);

-- Location: LCCOMB_X19_Y1_N8
\U3|C1|MOEDA_100|CONT_M|aux_MUX06a~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~0_combout\ = (\U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\ & \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF0|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF2|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF1|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\,
	combout => \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~0_combout\);

-- Location: LCCOMB_X18_Y1_N2
\U3|C1|MOEDA_100|CONT_M|aux_MUX06a\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~combout\ = (\U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\ & (\U3|C1|MOEDA_100|CONT_M|aux_MUX06a~0_combout\ & \U3|C1|AUX_4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF3|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~0_combout\,
	datad => \U3|C1|AUX_4~1_combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~combout\);

-- Location: LCCOMB_X18_Y1_N16
\U3|C1|MOEDA_100|CONT_M|FF6|qS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|CONT_M|FF6|qS~0_combout\ = \U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\ $ (\U3|C1|MOEDA_100|CONT_M|aux_MUX06a~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\,
	datad => \U3|C1|MOEDA_100|CONT_M|aux_MUX06a~combout\,
	combout => \U3|C1|MOEDA_100|CONT_M|FF6|qS~0_combout\);

-- Location: LCFF_X18_Y1_N17
\U3|C1|MOEDA_100|CONT_M|FF6|qS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U3|C1|MOEDA_100|CONT_M|FF6|qS~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\);

-- Location: LCCOMB_X18_Y1_N6
\U3|C1|MOEDA_100|COMP_Z1|Q~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \U3|C1|MOEDA_100|COMP_Z1|Q~4_combout\ = (\U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\) # ((\U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\) # ((\U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\) # (\U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|C1|MOEDA_100|CONT_M|FF4|qS~regout\,
	datab => \U3|C1|MOEDA_100|CONT_M|FF5|qS~regout\,
	datac => \U3|C1|MOEDA_100|CONT_M|FF6|qS~regout\,
	datad => \U3|C1|MOEDA_100|COMP_Z1|Q~2_combout\,
	combout => \U3|C1|MOEDA_100|COMP_Z1|Q~4_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\T~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_T);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(0));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(1));

-- Location: PIN_AF8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \U3|C1|MOEDA_100|COMP_Z1|ALT_INV_Q~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C(0));

-- Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C(1));

-- Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C(2));

-- Location: PIN_AE21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C(3));

-- Location: PIN_W10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C(4));

-- Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C(5));

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\I[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_I(0));

-- Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\I[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_I(1));

-- Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\I[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_I(2));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\I[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_I(3));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\I[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_I(4));

-- Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\I[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_I(5));

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led);

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(9));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(8));

-- Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(7));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(6));

-- Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(5));

-- Location: PIN_J23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(4));

-- Location: PIN_J26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(3));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\V[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_V(2));
END structure;


