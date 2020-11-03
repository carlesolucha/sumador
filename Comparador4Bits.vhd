LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Comparador4Bits is 
	port(
	 a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	 a_igual_b : OUT STD_LOGIC;
	 a_mayor_b : OUT STD_LOGIC;
	 a_menor_b : OUT STD_LOGIC;
	 b : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	 --d_a : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	 --d_b : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	);
end Comparador4Bits;

architecture behavioral of Comparador4Bits is
begin 
	a_mayor_b <= '1' when a > b else 
	'0';
	a_menor_b <= '1' when a < b else 
	'0';
	a_igual_b <= '1' when a = b else 
	'0';
	
end behavioral;