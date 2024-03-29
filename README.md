# Proyecto Tetris en FPGA DE-10 LITE

Autores:    
[Abdiel Vicencio Antonio (A01750922)](https://github.com/Pezcadoo31)    
Cesar Casto Martínez (A01771970)

## Descripción del Proyecto:
El proyecto consiste en implementar el clásico juego de Tetris en una FPGA DE-10 LITE utilizando VHDL. La FPGA actúa como el cerebro del juego, ejecutando la lógica del mismo, generando señales para visualizar en un monitor VGA y recibiendo entradas del usuario a través de interruptores DIP.

## Objetivos:
* Implementar funcionalidades básicas del Tetris.
* Diseñar una interfaz de usuario intuitiva utilizando interruptores DIP.
* Generar señales de video para visualizar el juego en un monitor VGA.
* Obtener un juego funcional y satisfactorio en la FPGA DE-10 LITE.

## Metodología:

Diseño del Hardware:

* CONTROLADOR_VGA: Genera señales para controlar un monitor VGA estándar.
* H_IMAGE: Genera elementos visuales del juego en la pantalla VGA.
* RELOJ: Genera una señal de reloj para sincronizar operaciones.
* DIVISOR_FRECUENCIA_25HZ: Divide la frecuencia del reloj del sistema para controlar la velocidad de caída de las piezas.

Implementación de Códigos:

* Integración de módulos VHDL en un diseño completo.
* El Top-Level Design conecta los módulos y establece conexiones con terminales físicos y el monitor VGA.
* Compilación ("Sintetización") del código y carga en la FPGA DE-10 LITE.

## Instrucciones de Uso:
* Descargar los archivos completos en una sola carpeta
* Cargar el diseño en la FPGA DE-10 LITE.
* Conectar la FPGA a un monitor VGA.
* Utilizar los interruptores DIP para controlar el juego.
* Disfrutar del clásico Tetris en la FPGA!

## Imagenes 
Imagen de Juego

<img src='https://github.com/Pezcadoo31/TETRIS/blob/main/TETRIS.jpg' width="836px"  height='936px'>






