
-- ABDIEL VICENCIO ANTONIO 

library IEEE;
use ieee.std_logic_1164.all;

entity DIVISOR_FRECUENCIA_25HZ is
	port(clk50 : in std_logic;
		  clk25	: inout std_logic:='0');
end entity;

architecture arc of DIVISOR_FRECUENCIA_25HZ is
	begin
		process (clk50)
			begin
				if clk50'event and clk50 = '1' then		-- Si hay un flanco de subida en clk50
					clk25 <= not clk25;						-- Invertir el valor de clk25
				end if;
		end process;
end arc;



