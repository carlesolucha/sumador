library ieee;
use ieee.std_logic_1164.all;

entity SumadorNBits is
	generic(
		g_n :integer := 5
		);
		port (
			a , b : in std_logic_vector(g_n -1 downto 0);
			s		: out std_logic_vector(g_n -1 downto 0);
			c_out : out std_logic);
end SumadorNBits;

architecture structural of SumadorNBits is
	signal c: std_logic_vector(g_n downto 0);
	component sumador1bit 
		port(
			a_i, b_i : in std_logic;
			c_i		 : in std_logic;
			s_i		:out std_logic;
			c_i_mas_1 : out std_logic);
	end component;
begin
	c(0) <= '0';
	c_out <= c(g_n);
	
	GenSum : for i in 0 to (g_n-1) generate
	
	i_sumador1bit : sumador1bit
		port map(
			a_i => a(i),
			b_i => b(i),
			c_i => c(i),
			s_i => s(i),
			c_i_mas_1 => c(i+1));
	end generate Gensum;
end structural;