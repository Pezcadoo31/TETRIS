
-- ABDIEL VICENCIO ANTONIO 

library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity RELOJ is
	port(clkl: in std_logic;        		 -- Entrada del reloj
        led: buffer std_logic := '0');  -- Salida del pulso de reloj 
end RELOJ;

architecture arc of RELOJ is
	
signal conteo: integer range 0 to 250000; -- señal de contador
	
	begin
		process(clkl)
			begin
				if(clkl'event and clkl = '1') then   -- Si hay un flanco de subida en clkl
					conteo <= conteo + 1;             -- Incrementa el contador en uno
					if(conteo = 250000) then          -- Si el contador alcanza 250000
						conteo <= 0;                   -- Reinicia el contador
						led <= not(led);               -- Invierte el valor de led (generando el pulso de reloj)
					end if;
				end if;
		end process;
end arc;




