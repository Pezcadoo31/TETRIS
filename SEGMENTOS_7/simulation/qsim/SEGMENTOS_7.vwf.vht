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
-- Generated on "03/11/2024 10:06:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SEGMENTOS_7
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SEGMENTOS_7_vhd_vec_tst IS
END SEGMENTOS_7_vhd_vec_tst;
ARCHITECTURE SEGMENTOS_7_arch OF SEGMENTOS_7_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL bcd : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL HEX : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT SEGMENTOS_7
	PORT (
	bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	HEX : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : SEGMENTOS_7
	PORT MAP (
-- list connections between master ports and signals
	bcd => bcd,
	HEX => HEX
	);
-- bcd[3]
t_prcs_bcd_3: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		bcd(3) <= '0';
		WAIT FOR 248000 ps;
		bcd(3) <= '1';
		WAIT FOR 248000 ps;
	END LOOP;
	bcd(3) <= '0';
WAIT;
END PROCESS t_prcs_bcd_3;
-- bcd[2]
t_prcs_bcd_2: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		bcd(2) <= '0';
		WAIT FOR 124000 ps;
		bcd(2) <= '1';
		WAIT FOR 124000 ps;
	END LOOP;
	bcd(2) <= '0';
WAIT;
END PROCESS t_prcs_bcd_2;
-- bcd[1]
t_prcs_bcd_1: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		bcd(1) <= '0';
		WAIT FOR 62000 ps;
		bcd(1) <= '1';
		WAIT FOR 62000 ps;
	END LOOP;
	bcd(1) <= '0';
WAIT;
END PROCESS t_prcs_bcd_1;
-- bcd[0]
t_prcs_bcd_0: PROCESS
BEGIN
	FOR i IN 1 TO 16
	LOOP
		bcd(0) <= '0';
		WAIT FOR 31000 ps;
		bcd(0) <= '1';
		WAIT FOR 31000 ps;
	END LOOP;
	bcd(0) <= '0';
WAIT;
END PROCESS t_prcs_bcd_0;
END SEGMENTOS_7_arch;
