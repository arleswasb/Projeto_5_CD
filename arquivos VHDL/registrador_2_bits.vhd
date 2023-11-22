library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTRADOR_2_BITS is
   Port (clk, clr, set : in STD_LOGIC;
		E :  in STD_LOGIC_VECTOR(1 downto 0);
         	S : out STD_LOGIC_VECTOR(1 downto 0));
end REGISTRADOR_2_BITS;

architecture ckt of REGISTRADOR_2_BITS is

	component ffd is
		port (ck, clr, set, d : in  std_logic;
								  q : out std_logic);
	end component;

	

	begin


		FF0:ffd port map (clk,clr,set,E(1),S(1));
		FF1:ffd port map (clk,clr,set,E(0),S(0));


end ckt;