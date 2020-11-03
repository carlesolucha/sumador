--Definir las bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

--ENTITY
entity pract5 is
	generic(
	gn : integer :=5);
	port (
		a , b : in std_logic_vector(gn-1 downto 0); --las dos entradas sabemos que tendrán esos elementos 5 elementos ya que es un sumador de 5bits.
		s1 , d2		: out std_logic_vector(6 downto 0); --salidas el 7 porque nos lo dice el display de la placa (el display tiene 8segmentos).
		ov : out std_logic); --overflow
end pract5;

--ARQUITECTURA
architecture structural of pract5 is
	
	signal aux: std_logic_vector(7 downto 0);  --definimos un auxiliar porque es una variable que nos ayuda en el proceso pero no es de entrada
															 --ni de salida. Por eso no se define en el entity.
															 --esto se hace de 8 porque sabemos que un para pasar un número de 8 bits de binario a hexadecimal
															 --podemos dividir el número en dos partes y escribir en hexadecimal el primero y después el 
															 --segundo.
	component SumadorNBits 								--Vamos a tener que usar el componente de sumador de n bits
		port (
			a , b : in std_logic_vector( gn-1 downto 0);
			s		: out std_logic_vector( gn-1 downto 0);
			c_out : out std_logic);
	end component;
	
	component BinA7Seg									--Vamos a tener que usar el componente de transformar el número de binario a un display	
															   --hexadecimal y lo usaremos 2 veces, pero aquí solamente se define una vez.
		port( 
			E			:in std_logic_vector(3 downto 0);
			salida	:out std_logic_vector(6 downto 0));
	end component;
	
begin															--Empezar a simular las conexiones entre los elementos (por eso arriba hemos puesto
																--structural).	
	i_sumador : SumadorNBits							--Usamos el sumadorNBits
		port map(
			a => a,											--conectamos la entrada 'a' a la 'a' del nuevo dispotivo (pract5).
			b => b,											--conectamos la entrada 'b' a la 'b' del nuevo dispositivo
			s => aux(4 downto 0),						--queremos que nos ponga en el auxiliar los primeros los 4 elementos, pero después queremos
																--rellenar con 0s el resto.
			c_out => ov);
	aux(7 downto 5) <=  (others => '0');
	
	i_BinA7Seg1 : BinA7Seg								--como hemos dicho antes, tendremos que usar el dispositivo BinA7Seg dos veces.
		port map(
		E => aux(3 downto 0),							--la entrada E la conectamos a los 4 primeros dígitos
		salida => s1);										--la salida la conectamos al primer display.
	i_BinA7Seg2 : BinA7Seg
		port map(
		E => aux(7 downto 4),							--la entrada E la conectamos a los 4 últimos dígitos
		salida => d2);										--la salida la conectamos al segundo display.
	
end structural;