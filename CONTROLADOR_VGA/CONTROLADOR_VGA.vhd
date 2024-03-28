-- ABDIEL VICENCIO ANTONIO 

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CONTROLADOR_VGA IS
  GENERIC(
    h_pulse  :  INTEGER   := 96;   -- Ancho del pulso de sincronización horizontal en píxeles
    h_bp     :  INTEGER   := 48;   -- Ancho del porche trasero horizontal en píxeles
    h_pixels :  INTEGER   := 640;  -- Ancho de la pantalla horizontal en píxeles
    h_fp     :  INTEGER   := 16;   -- Ancho del porche frontal horizontal en píxeles
    h_pol    :  STD_LOGIC := '0';  -- Polaridad del pulso de sincronización horizontal (1 = positivo, 0 = negativo)
    v_pulse  :  INTEGER   := 2;    -- Ancho del pulso de sincronización vertical en filas
    v_bp     :  INTEGER   := 33;   -- Ancho del porche trasero vertical en filas
    v_pixels :  INTEGER   := 480;  -- Ancho de la pantalla vertical en filas
    v_fp     :  INTEGER   := 10;   -- Ancho del porche frontal vertical en filas
    v_pol    :  STD_LOGIC := '0'); -- Polaridad del pulso de sincronización vertical (1 = positivo, 0 = negativo)
  PORT(
    pixel_clk :  IN   STD_LOGIC;  -- Reloj de píxeles a la frecuencia del modo VGA utilizado
    reset_n   :  IN   STD_LOGIC;  -- Reset asincrónico activo bajo
    h_sync    :  OUT  STD_LOGIC;  -- Pulso de sincronización horizontal
    v_sync    :  OUT  STD_LOGIC;  -- Pulso de sincronización vertical
    disp_ena  :  OUT  STD_LOGIC;  -- Habilitar pantalla ('1' = tiempo de visualización, '0' = tiempo de desactivación)
    column    :  OUT  INTEGER;    -- Coordenada horizontal del píxel
    row       :  OUT  INTEGER);   -- Coordenada vertical del píxel
END CONTROLADOR_VGA;

ARCHITECTURE arc OF CONTROLADOR_VGA is

  CONSTANT  h_period  :  INTEGER := h_pulse + h_bp + h_pixels + h_fp;  -- Número total de pulsos de reloj de píxeles en una fila
  CONSTANT  v_period  :  INTEGER := v_pulse + v_bp + v_pixels + v_fp;  -- Número total de filas en una columna
  
BEGIN
  
  PROCESS(pixel_clk, reset_n)
    VARIABLE h_count  :  INTEGER RANGE 0 TO h_period - 1 := 0;  --horizontal counter (counts the columns)
    VARIABLE v_count  :  INTEGER RANGE 0 TO v_period - 1 := 0;  --vertical counter (counts the rows)
  BEGIN
  
    IF(reset_n = '0') THEN  -- Reset activado
      h_count := 0;         -- Reiniciar contador horizontal
      v_count := 0;         -- Reiniciar contador vertical
      h_sync <= h_pol;		 -- Desactivar pulso de sincronización horizontal
      v_sync <= v_pol;	  	 -- Desactivar pulso de sincronización vertical
      disp_ena <= '0';      -- Deshabilitar pantalla
      column <= 0;          -- Reiniciar coordenada horizontal del píxel
      row <= 0;             -- Reiniciar coordenada vertical del píxel
      
    ELSIF(pixel_clk'EVENT AND pixel_clk = '1') THEN

      -- Contadores
      IF(h_count < h_period - 1) THEN    -- Contador horizontal (píxeles)
        h_count := h_count + 1;
      ELSE
        h_count := 0;
        IF(v_count < v_period - 1) THEN  -- Contador vertical (filas)
          v_count := v_count + 1;
        ELSE
          v_count := 0;
        END IF;
      END IF;

      -- Señal de sincronización horizontal
      IF(h_count < h_pixels + h_fp OR h_count > h_pixels + h_fp + h_pulse) THEN
        h_sync <= NOT h_pol;    -- Desactivar pulso de sincronización horizontal
      ELSE
        h_sync <= h_pol;        -- Activar pulso de sincronización horizontal
      END IF;
      
      -- Señal de sincronización vertical
      IF(v_count < v_pixels + v_fp OR v_count > v_pixels + v_fp + v_pulse) THEN
        v_sync <= NOT v_pol;    -- Desactivar pulso de sincronización vertical
      ELSE
        v_sync <= v_pol;        -- Activar pulso de sincronización vertical
      END IF;
      
      -- Establecer coordenadas de píxeles
      IF(h_count < h_pixels) THEN  -- Tiempo de visualización horizontal
        column <= h_count;         -- Establecer coordenada horizontal del píxel
      END IF;
      IF(v_count < v_pixels) THEN  -- Tiempo de visualización vertical
        row <= v_count;            -- Establecer coordenada vertical del píxel
      END IF;

      -- Habilitar salida de pantalla
      IF(h_count < h_pixels AND v_count < v_pixels) THEN  -- Tiempo de visualización
        disp_ena <= '1';                                  -- Habilitar pantalla
      ELSE                                                -- Tiempo de desactivación
        disp_ena <= '0';                                  -- Deshabilitar pantalla
      END IF;


    END IF;
  END PROCESS;

END arc;



