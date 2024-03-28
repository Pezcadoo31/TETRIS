-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/11/2024 09:54:29"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DIVISOR_FRECUENCIA_25HZ
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DIVISOR_FRECUENCIA_25HZ_vhd_vec_tst IS
END DIVISOR_FRECUENCIA_25HZ_vhd_vec_tst;
ARCHITECTURE DIVISOR_FRECUENCIA_25HZ_arch OF DIVISOR_FRECUENCIA_25HZ_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk25 : STD_LOGIC;
SIGNAL clk50 : STD_LOGIC;
COMPONENT DIVISOR_FRECUENCIA_25HZ
	PORT (
	clk25 : INOUT STD_LOGIC;
	clk50 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DIVISOR_FRECUENCIA_25HZ
	PORT MAP (
-- list connections between master ports and signals
	clk25 => clk25,
	clk50 => clk50
	);

-- clk50
t_prcs_clk50: PROCESS
BEGIN
LOOP
	clk50 <= '0';
	WAIT FOR 25000 ps;
	clk50 <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk50;

-- clk25
t_prcs_clk25: PROCESS
BEGIN
	clk25 <= 'Z';
WAIT;
END PROCESS t_prcs_clk25;
END DIVISOR_FRECUENCIA_25HZ_arch;
