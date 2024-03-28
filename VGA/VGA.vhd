-- CESAR CASTRO MARTINEZ 
-- ABDIEL VICENCIO ANTONIO 

library IEEE;
use ieee.std_logic_1164.all;

Entity VGA is
port( input_clk: IN std_logic; 									-- Reloj de entrada
        pixel_clk: OUT std_logic; 								-- Reloj de píxeles para la VGA
        R: OUT std_logic_vector(3 downto 0); 				-- Componente Rojo de RGB
        G: OUT std_logic_vector(3 downto 0); 				-- Componente Verde de RGB
        B: OUT std_logic_vector(3 downto 0); 				-- Componente Azul de RGB
        dipsw: IN std_logic_vector(1 downto 0); 		-- Interruptores DIP para configuración
        led, led2, led3, led4, led5, led6: OUT std_logic;-- Salidas para LED
        puntos : inout std_logic; 								-- Señal para indicar puntos o estado del juego
        HEX : out std_logic_vector (6 downto 0); 			-- Salida para visualización en display de 7 segmentos
        HS: out std_logic; 										-- Pulso de sincronización horizontal
        VS: out std_logic);										-- Pulso de sincronización vertical
end entity;

architecture arc of VGA is
	
Component CONTROLADOR_VGA IS
	PORT(	pixel_clk :  IN   STD_LOGIC;  
			reset_n   :  IN   STD_LOGIC;  
			h_sync    :  OUT  STD_LOGIC;  
			v_sync    :  OUT  STD_LOGIC;  
			disp_ena  :  OUT  STD_LOGIC;  
			column    :  OUT  INTEGER;    
			row       :  OUT  INTEGER);    
END component;

Component SEGMENTOS_7 is
	port(	puntos : in std_logic;
			HEX : out std_logic_vector (6 downto 0));
end component;

component RELOJ is
	port(	clkl: in std_logic;
			led: buffer std_logic:= '0' );
end component;

Component H_IMAGE IS
  PORT(disp_ena :  IN   STD_LOGIC;  
		 row      :  IN   INTEGER;    
		 column   :  IN   INTEGER;    
		 red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  
		 green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  
		 blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
		 dipsw 	 :  IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
		 dipsw2, dipsw3, dipsw4, dipsw5, dipsw6 :  IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
		 reloj 	 :  IN   STD_LOGIC;
		 reloj2, reloj3, reloj4, reloj5,	reloj6 :  IN   STD_LOGIC;
		 led : out std_logic;
		 led2, led3, led4, led5, led6 : out std_logic;
		 puntos : inout std_logic);
END component;

Component DIVISOR_FRECUENCIA_25HZ is
	port(	clk50 : in std_logic;
			clk25	: inout std_logic:='0');
end component;
	
	-- Declaración de señales internas
	signal pix_clock: STD_LOGIC;	 -- Señal para el reloj de píxeles
    signal disp_ena : STD_LOGIC;  -- Señal de habilitación de pantalla ('1' = tiempo de visualización, '0' = tiempo de desactivación)
    signal column   : INTEGER;    -- Coordenada horizontal del píxel
    signal row      : INTEGER;    -- Coordenada vertical del píxel
    signal reset, cs : std_logic; 
    signal relo, relo2, relo3, relo4, relo5, relo6 : std_logic; -- Señales de reloj para los diferentes componentes
		
	begin

	pixel_clk <= pix_clock; -- Asignación del reloj de píxeles
	
	-- Inicialización de señales
	reset <= '1';
	cs <= '1';

	CLK : DIVISOR_FRECUENCIA_25HZ port map (input_clk,pix_clock);
													
	C_VGA : CONTROLADOR_VGA port map (pix_clock, '1', HS, VS, disp_ena, column,row);
	
	H_IMG : H_IMAGE port map (disp_ena, row, column, R, G, B, dipsw,dipsw,dipsw,dipsw,dipsw,dipsw, relo,relo2,relo3,relo4,relo5,relo6,led,led2,led3,led4,led5,led6,puntos);	

	RJ : RELOJ port map (input_clk,relo);
	RJ1 : RELOJ port map (input_clk,relo2);		
	RJ2 : RELOJ port map (input_clk,relo3); 	
	RJ3 : RELOJ port map (input_clk,relo4);		
	RJ4 : RELOJ port map (input_clk,relo5);		
	RJ5 : RELOJ port map (input_clk,relo6);
		  
	Seg : SEGMENTOS_7 port map (puntos,HEX);

end arc;