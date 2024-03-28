
-- ABDIEL VICENCIO ANTONIO 

library IEEE;
use ieee.std_logic_1164.all;

ENTITY H_IMAGE IS
  GENERIC(
   pixels_y :  INTEGER := 478;   -- Número de filas de píxeles en la imagen
   pixels_x :  INTEGER := 600);  -- Número de columnas de píxeles en la imagen
  
  PORT(
	 disp_ena :  IN   STD_LOGIC;  -- Habilitación del display ('1' = tiempo de visualización, '0' = tiempo de borrado)
    row      :  IN   INTEGER;    -- Coordenada de fila del píxel
    column   :  IN   INTEGER;    -- Coordenada de columna del píxel
    red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  -- Salida de magnitud roja al DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  -- Salida de magnitud verde al DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  -- Salida de magnitud azul al DAC
	 dipsw 	 :  IN	STD_LOGIC_VECTOR(1 DOWNTO 0);  -- Entrada de interruptores DIP para configuraciones
	 dipsw2, dipsw3, dipsw4, dipsw5, dipsw6 :  IN	STD_LOGIC_VECTOR(1 DOWNTO 0); -- Entradas adicionales de interruptores DIP
	 reloj 	 :  IN   STD_LOGIC;  -- Señal de reloj principal
	 reloj2, reloj3, reloj4, reloj5,	reloj6 :  IN   STD_LOGIC; -- Señales de reloj adicionales
	 led 		: out std_logic; -- Salida para LED
	 led2, led3, led4, led5, led6 : out std_logic; -- Salidas adicionales para LED
	 puntos 	: inout std_logic); -- Línea de puntos para control externo
END H_IMAGE;

ARCHITECTURE arc OF H_IMAGE IS

signal x: INTEGER RANGE 10 TO 310;  -- Variable para la coordenada x dentro de un rango específico
signal y: INTEGER RANGE 10 TO 418;  -- Variable para la coordenada y dentro de un rango específico
signal x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x_1, y_1, y1_1: INTEGER RANGE 0 TO 600; -- Limites extremos

--- ESPACIO DE JUEGO ---
begin   
-- Proceso principal que controla la generación de los píxeles de la imagen en función de las coordenadas de fila y columna,
-- así como de la señal de habilitación de visualización (disp_ena).
	process(disp_ena, row, column)
		begin
			if(disp_ena = '1') THEN 	-- Comienza el proceso si la señal de habilitación de visualización está activa ('1')
				-- LETRAS --
				-- T --
				if ((row > 373 and row <433) and (column>440 and column<460)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 393 and row <413) and (column>459 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				-- E --	
				elsif ((row > 342 and row <363) and (column>440 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
					
				elsif ((row > 303 and row <343) and (column>440 and column<460)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				elsif ((row > 303 and row <343) and (column>470 and column<490)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				elsif ((row > 303 and row <343) and (column>500 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				-- T --
				elsif ((row > 233 and row <293) and (column>440 and column<460)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 253 and row <273) and (column>459 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				-- R --
				elsif ((row > 163 and row <223) and (column>440 and column<450)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 203 and row <223) and (column>449 and column<470)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 163 and row <183) and (column>449 and column<470)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 163 and row <223) and (column>469 and column<480)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');		
				
				elsif ((row > 203 and row <223) and (column>479 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 173 and row <193) and (column>479 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				-- I --
				elsif ((row > 133 and row <153) and (column>440 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				-- S --
				elsif ((row > 63 and row <123) and (column>440 and column<460)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				 elsif ((row > 103 and row <123) and (column>459 and column<470)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');	
						
				elsif ((row > 63 and row <123) and (column>469 and column<490)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 63 and row <83) and (column>489 and column<500)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				elsif ((row > 63 and row <123) and (column>499 and column<520)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
--				-- FIGURA L --
--				elsif ((row > 363 and row <463) and (column>408 and column<428)) THEN
--						red <= (OTHERS => '1');
--						green<=(OTHERS => '0');
--						blue<=(OTHERS => '1');
--				
--				elsif ((row > 443 and row <463) and (column>427 and column<468)) THEN
--						red <= (OTHERS => '1');
--						green<=(OTHERS => '0');
--						blue<=(OTHERS => '1');
				
				-- FIGURA I --
				elsif ((row > 223 and row <363) and (column>530 and column<550)) THEN
						red <= (OTHERS => '0');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				elsif ((row > 133 and row <283) and (column>408 and column<428)) THEN
						red <= (OTHERS => '0');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
				
				-- FIGURA Z --
				elsif ((row > 13 and row <53) and (column>490 and column<510)) THEN
						red <= (OTHERS => '0');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				elsif ((row > 33 and row <53) and (column>509 and column<530)) THEN
						red <= (OTHERS => '0');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');
						
				elsif ((row > 33 and row <73) and (column>529 and column<550)) THEN
						red <= (OTHERS => '0');
						green<=(OTHERS => '0');
						blue<=(OTHERS => '1');		
				
				-- ESPACIO DE JUEGO --	
				elsif ((row > 150 and row <160) and (column>0 and column<350)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '1');
						blue<=(OTHERS => '1');
				
				elsif ((row > 468 and row <478) and (column>0 and column<350)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '1');
						blue<=(OTHERS => '1');
						
				elsif ((row > 159 and row <478) and (column>0 and column<10)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '1');
						blue<=(OTHERS => '1');
					
				elsif ((row > 159 and row <478) and (column>340 and column<350)) THEN
						red <= (OTHERS => '1');
						green<=(OTHERS => '1');
						blue<=(OTHERS => '1');
						
				--FIGURA 1 CUADRADO--
				elsif ((row > x and row < x+100) and (column > y and column < y+100)) THEN
					red <= (OTHERS => '1');
					blue <= (OTHERS => '0');
				
				elsif ((row > x3 and row < x3+100) and (column > y3 and column < y3+100)) THEN
					red <= (OTHERS => '1');
					blue <= (OTHERS => '1');
				
				--FIGURA 2 LINEA HORIZONTAL--
				elsif ((row > x1 and row < x1+40) and (column > y1 and column < y1+150)) THEN
					blue <= (OTHERS => '1');
					
				elsif ((row > x4 and row < x4+40) and (column > y4 and column < y4+150)) THEN
					green <= (OTHERS => '1');
					blue <= (OTHERS => '1');
				
				-- FIGURA 3 LINEA VERTICAL--
				elsif ((row > x2 and row < x2+150) and (column > y2 and column < y2+40)) THEN
					green <= (OTHERS => '1');
					red <= (OTHERS => '1');
					
				elsif ((row > x5 and row < x5+150) and (column > y5 and column < y5+40)) THEN
					green <= (OTHERS => '1');
					
				-- LIMITES -- 
				x_1 <= 367; 	-- Limite inferior
				y_1 <= 10;  	-- Limite izquierdo
				y1_1 <= 239;	-- Limite derecho
	
				--FONDO--		
				else		
						red <= (OTHERS => '0');
						green	<= (OTHERS => '0');
						blue <= (OTHERS => '0');		-- Se establece el fondo negro
				end if;
		END IF;  
	END PROCESS;
	
	-- LIMITE PARA PRIMERA FIGURA --
	PROCESS(reloj,dipsw, disp_ena)
		BEGIN
			if (reloj' event and reloj = '1') then
				led <= '0';
				if ((dipsw(1)='0' and dipsw(0)='0') or (dipsw(1)='1' and dipsw(0)='1')) then 
					-- Si la figura está en la misma fila y dentro de los límites, se mueve hacia la abajo
					if (((y = y_1 or y = y1_1) and x < x_1) or ((y > y_1 or y < y1_1) and x < x_1)) then 
						y <= y;
						x <= x+1;
					-- Si la figura está en la misma fila y en el límite, se detiene
					elsif (((y = y_1 or y = y1_1) and x = x_1) or ((y > y_1 or y < y1_1) and x = x_1)) then 
						y<=y;
						x<=x;
					end if;
					
				elsif (dipsw(1)='0' and dipsw(0)='1') then 
					if (y = y1_1 and x < x_1) then 
						x <= x+1;
						y <= y;
					elsif (y=y1_1 and x=x_1) then 
						x <= x;
						y <= y;
					-- Si la figura está por encima de la última fila y dentro de los límites, se mueve hacia abajo
					elsif (y < y1_1 and x < x_1) then 
						x <= x+1;
						y <= y+1; -- ir a la derecha
					end if;
					
				elsif (dipsw(1)='1' and dipsw(0)='0') then 
					if (y = y_1 and x < x_1) then 
						x <= x+1;
						y <= y;
					elsif (y = y_1 and x = x_1) then 
						x <= x;
						y <= y;
					elsif (y > y_1 and x < x_1) then 
						x <= x+1;
						y <= y - 1; -- ir a la izquierda
					end if;
				end if;
			end if;
		if (x = x_1) then 	-- Se enciende el LED cuando la figura alcanza su límite horizontal (x = x_1)
			led <= '1';
		end if;
	end process;
	
	-- LIMITE SEGUNDA FIGURA --
	PROCESS(reloj2,dipsw2)
		BEGIN
			if (reloj2' event and reloj2 = '1') then
			-- CONDICIÓN PARA QUE CAIGA LA SEGUNDA PIEZA --
				if ((y = y_1 and x = x_1) or (y = y1_1 and x = x_1) OR ((y > y_1 or y < y1_1) and x = x_1)) then 
					led2 <= '0';		
					-- APILACION-- 
					if ((dipsw2(1) = '0' and dipsw2(0) = '0') OR (dipsw2(1) = '1' and dipsw2(0) = '1')) then 
						if (((y1 = y_1 or y1 = y1_1-50) and x1 < x_1-40) or ((y1 > y_1 or y1 < y1_1-50) and x1 < x_1-40)) then 
							y1 <= y1;
							x1 <= x1 + 1;	
						-- Si la segunda figura está en la misma fila y en el límite, se detiene
						elsif (((y1 = y_1 or y1 = y1_1-50) and x1 = x_1-40) or ((y1 > y_1 or y1 < y1_1-50) and x1 = x_1-40)) then 
							y1 <= y1;
							x1 <= x1;
						end if;
					
					elsif (dipsw2(1) = '0' and dipsw2(0) = '1') then 
						if (y1 = y1_1 - 50 and x1 < x_1 - 40) then 
							x1 <= x1 + 1;
							y1 <= y1;
						elsif (y1 = y1_1 - 50 and x1 = x_1 - 40) then 
							x1 <= x1;
							y1 <= y1;
						elsif (y1 < y1_1 - 50 and x1 < x_1 - 40) then 
							x1 <= x1 + 1;
							y1 <= y1 + 1;
						end if;
							
					elsif (dipsw2(1) = '1' and dipsw2(0) = '0') then 
						if (y1 = y_1 and x1 < x_1 - 40) then 
							x1 <= x1 + 1;
							y1 <= y1;
						elsif (y1 = y_1 and x1 = x_1 - 40) then 
							x1 <= x1;
							y1 <= y1;
						elsif (y1 > y_1 and x1 < x_1 - 40) then 
							x1 <= x1 + 1;
							y1 <= y1 - 1;
						end if;
					end if;
				else
					x1 <= 0; -- Si la condición de caída no se cumple, la posición de la segunda figura se reinicia
				end if;
			end if;
		if (x1 = x_1 - 40) then -- Se enciende el LED2 cuando la segunda figura alcanza su límite horizontal (x1 = x_1 - 40)
			led2 <= '1';
		end if;
	end process;
	
	--LIMITES TERCERA FIGURA --
	PROCESS(reloj3, dipsw3)
		BEGIN
			if (reloj3' event and reloj3 = '1') then
			-- CONDICIÓN PARA QUE CAIGA LA TERCERA PIEZA --
				if ((y1 = y1_1 - 50 and x1 = x_1 - 40) or (y1 = y_1 and x1 = x_1 - 40) OR ((y1 > y_1 or y1 < y1_1 - 50) and x1 = x_1-40)) then 
					led3 <= '0';
					-- APILACION-- 
					if ((dipsw3(1) = '0' and dipsw3(0) = '0') OR (dipsw3(1) = '1' and dipsw3(0) ='1')) then 
						if (((y2 = y_1 or y2 = y1_1 - 150) and x2 < x_1 - 50) or ((y2 > y_1 or y2 < y1_1 - 150) and x2 < x_1-50)) then 
							y2 <= y2;
							x2 <= x2 + 1;
						-- Si la tercera figura está en la misma fila y en el límite, se detiene
						elsif (((y2 = y_1 or y2 = y1_1 - 150) and x2 = x_1 - 50) or ((y2 > y_1 or y2 < y1_1 - 150) and x2 = x_1-50)) then 
							y2 <= y2;
							x2 <= x2;
						end if;
					
					elsif (dipsw3(1) = '0' and dipsw3(0) = '1') then 
						if (y2 = y1_1 - 150 and x2 < x_1) then 
							x2 <= x2 + 1;
							y2 <= y2;
						elsif (y2 = y1_1 - 150 and x2 = x_1 - 50) then 
							x2 <= x2;
							y2 <= y2;
						elsif (y2 < y1_1 - 150 and x2 < x_1 - 50) then 
							x2 <= x2 + 1;
							y2 <= y2 + 1;
						end if;
							
					elsif (dipsw3(1) = '1' and dipsw3(0) = '0') then 
						if (y2 = y_1 and x2 < x_1 - 50) then 
							x2 <= x2 + 1;
							y2 <= y2;
						elsif (y2 = y_1 and x2 = x_1 - 50) then 
							x2 <= x2;
							y2 <= y2;
						elsif (y2 > y_1 and x2 < x_1 - 50) then 
							x2 <= x2 + 1;
							y2 <= y2 - 1;
						end if;
					end if;
				else
					x2 <= 0; -- Si la condición de caída no se cumple, la posición de la tercera figura se reinicia
				end if;
			end if;
		if (x2 = x_1-50) then -- Se enciende el LED3 cuando la tercera figura alcanza su límite horizontal (x2 = x_1 - 50)
			led3 <= '1';
		end if;
	end process;
	
	-- LIMITES CUARTA FIGURA --
	PROCESS(reloj4, dipsw4)
		BEGIN
			if (reloj4' event and reloj4 = '1') then
			-- CONDICIÓN PARA QUE CAIGA LA CUARTA PIEZA --
				if ((y2 = y1_1 - 150 and x2 = x_1 - 50) or (y2 = y_1 and x2 = x_1 - 50) OR ((y2 > y_1 or y2 < y1_1 - 150) and x2 = x_1 - 50)) then 
					led4 <= '0';
					-- APILACION-- 
					if ((dipsw4(1) = '0' and dipsw4(0) = '0') OR (dipsw4(1) = '1' and dipsw4(0) = '1')) then 
						if (((y3 = y_1 + 40 or y3 = y1_1 - 150) and x3 < x_1) or ((y3 > y_1 + 40 or y3 < y1_1 - 150) and x3 < x_1)) then 
							y3 <= y3;
							x3 <= x3 + 1;
						 -- Si la cuarta figura está en la misma fila y en el límite, se detiene
						elsif (((y3 = y_1 + 40 or y3 = y1_1 - 150) and x3 = x_1) or ((y3 > y_1 + 50 or y3 < y1_1 - 150) and x3 = x_1)) then 
							y3 <= y3;
							x3 <= x3;
						end if;
					
					elsif (dipsw3(1) = '0' and dipsw3(0) = '1') then 
						if (y3 = y1_1 - 150 and x3 < x_1) then 
							x3 <= x3 + 1;
							y2 <= y2;
						elsif (y3 = y1_1 - 150 and x3 = x_1) then 
							x3 <= x3;
							y3 <= y3;
						elsif (y3 < y1_1 - 150 and x3 < x_1) then 
							x3 <= x3 + 1;
							y3 <= y3 + 1;
						end if;
							
					elsif (dipsw3(1) = '1' and dipsw3(0) = '0') then 
						if (y3 = y_1 + 40 and x3 < x_1 - 50) then 
							x3 <= x3 + 1;
							y3 <= y3;
						elsif (y3 = y_1 + 40 and x3 = x_1) then 
							x3 <= x3;
							y3 <= y3;
						elsif (y3 > y_1 + 40 and x3 < x_1) then 
							x3 <= x3 + 1;
							y3 <= y3 - 1;
						end if;
					end if;
				else
					x3 <= 0; -- Si la condición de caída no se cumple, la posición de la cuarta figura se reinicia
				end if;
			end if;
		if (x3 = x_1) then  -- Se enciende el LED4 cuando la cuarta figura alcanza su límite horizontal (x3 = x_1)
			led4 <= '1';
		end if;
	end process;
	
		--LIMITES QUINTA FIGURA --
	PROCESS(reloj5, dipsw5)
		BEGIN
			if (reloj5' event and reloj5 = '1') then
			-- CONDICIÓN PARA QUE CAIGA LA QUINTA PIEZA --
				if ((y3 = y1_1 - 150 and x3 = x_1) or (y3 = y_1 + 40 and x3 = x_1) OR ((y3 > y_1 + 50 or y3 < y1_1 - 150) and x3 = x_1)) then 
					led5 <= '0';
					-- APILACION-- 
					if ((dipsw5(1) = '0' and dipsw5(0) = '0') OR (dipsw5(1) = '1' and dipsw5(0) = '1')) then 
						if (((y4 = y_1 or y4 = y1_1) and x4 < x_1 - 90) or ((y4 > y_1 or y4 < y1_1) and x4 < x_1 - 90)) then 
							y4 <= y4;
							x4 <= x4 + 1;
						elsif (((y4 = y_1 or y4 = y1_1) and x4 = x_1 - 90) or ((y4 > y_1 or y4 < y1_1) and x4 = x_1 - 90))  then 
							x4 <= x4;
							y4 <= y4;
						end if;
					
					elsif (dipsw5(1) = '0' and dipsw5(0) = '1') then 
						if (y4 = y1_1 and x4 < x_1 - 90) then 
							x4 <= x4 + 1;
							y4 <= y4;
						elsif (y4 = y1_1 and x4 = x_1 - 90) then 
							x4 <= x4;
							y4 <= y4;
						elsif (y4 < y1_1 and x4 < x_1 - 90) then 
							x4 <= x4 + 1;
							y4 <= y4 + 1;
						end if;
							
					elsif (dipsw5(1) = '1' and dipsw5(0) = '0') then 
						if (y4 = y_1 and x4 < x_1 - 90) then 
							x4 <= x4 + 1;
							y4 <= y4;
						elsif (y4 = y_1 and x4 = x_1 - 90) then 
							x4 <= x4;
							y4 <= y4;
						elsif (y4 > y_1 and x4 < x_1 - 90) then 
							x4 <= x4 + 1;
							y4 <= y4 - 1;
						end if;
					end if;
				else
					x4 <= 0;
				end if;
			end if;
		if (x4 = x_1 - 90) then -- Se enciende el LED5 cuando la quinta figura alcanza su límite horizontal (x4 = x_1 - 90)
			led5 <= '1';
		end if;
	end process;
	
			--LIMITES SEXTA FIGURA --
	PROCESS(reloj6, dipsw6)
		BEGIN
			if (reloj6' event and reloj6 = '1') then
			-- CONDICIÓN PARA QUE CAIGA LA SEXTA PIEZA --
				if ((y4 = y1_1 and x4 = x_1 - 90) or (y4 = y_1 and x4 = x_1 - 90) OR ((y4 > y_1 or y4 < y1_1) and x4 = x_1 - 90)) then 
					led6 <= '0';
					-- APILACION-- 
					if ((dipsw6(1) = '0' and dipsw6(0) = '0') OR (dipsw6(1) = '1' and dipsw6(0) = '1')) then 
						if (((y5 = y_1 or y5 = y1_1) and x5 < x_1 - 240) or ((y5 > y_1 or y5 < y1_1) and x5 < x_1 - 240)) then 
							y5 <= y5;
							x5 <= x5 + 1;
						elsif (((y5 = y_1 or y5 = y1_1) and x5 = x_1 - 240) or ((y5 > y_1 or y5 < y1_1) and x5 = x_1 - 240))  then 
							y5 <= y5;
							x5 <= x5;
					end if;
				
					elsif (dipsw6(1) = '0' and dipsw6(0) = '1') then 
						if (y5 = y1_1 and x5 < x_1 - 240) then 
							x5 <= x5 + 1;
							y5 <= y5;
						elsif (y5 = y1_1 and x5 = x_1 - 240) then 
							x5 <= x5;
							y5 <= y5;
						elsif (y5 < y1_1 and x5 < x_1 - 240) then 
							x5 <= x5 + 1;
							y5 <= y5 + 1;
						end if;
							
					elsif (dipsw6(1) = '1' and dipsw6(0) = '0') then 
						if (y5 = y_1 and x5 < x_1 - 240) then 
							x5 <= x5 + 1;
							y5 <= y5;
						elsif (y5 = y_1 and x5 = x_1 - 240) then 
							x5 <= x5;
							y5 <= y5;
						elsif (y5 > y_1 and x5 < x_1 - 240) then 
							x5 <= x5 + 1;
							y5 <= y5 - 1;
						end if;
					end if;
				else
					x5 <= 0; -- Si la condición de caída no se cumple, la posición de la sexta figura se reinicia
				end if;
			end if;
		if (x5 = x_1 - 240) then 
			led6 <= '1';
		end if;
	end process;
	
	--GAME OVER --
	process (puntos)
		Begin 
			if (x5 = x_1 - 240) then
				puntos <= '1'; 		-- Se establece que el juego ha terminado
			else 
				puntos <= '0';			-- El juego continúa
			end if;
	end process;
	
END arc;