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
-- Generated on "03/11/2024 10:00:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          RELOJ
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RELOJ_vhd_vec_tst IS
END RELOJ_vhd_vec_tst;
ARCHITECTURE RELOJ_arch OF RELOJ_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clkl : STD_LOGIC;
SIGNAL led : STD_LOGIC;
COMPONENT RELOJ
	PORT (
	clkl : IN STD_LOGIC;
	led : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : RELOJ
	PORT MAP (
-- list connections between master ports and signals
	clkl => clkl,
	led => led
	);

-- clkl
t_prcs_clkl: PROCESS
BEGIN
LOOP
	clkl <= '0';
	WAIT FOR 5000 ps;
	clkl <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clkl;
END RELOJ_arch;
