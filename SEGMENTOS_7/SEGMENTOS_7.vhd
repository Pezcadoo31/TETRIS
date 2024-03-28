
--- ABDIEL VICENCIO ANTONIO 

library ieee;
use ieee.std_logic_1164.all;

Entity SEGMENTOS_7 is
	port(	puntos : in std_logic;
			HEX : out std_logic_vector (6 downto 0));
end SEGMENTOS_7;

architecture arc of SEGMENTOS_7 is
	Begin
		with puntos select
			HEX <= 
				"0010010" when '0',		-- Start "S"
				"0000010" when '1',		-- GAME OVER "G"
				"1111111" when others;
end arc;





