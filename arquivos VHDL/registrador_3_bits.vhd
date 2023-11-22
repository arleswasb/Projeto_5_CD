library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTRADOR_3_BITS is
   Port (clk, clr, set : in STD_LOGIC;
		E :  in STD_LOGIC_VECTOR(2 downto 0);
         	S : out STD_LOGIC_VECTOR(2 downto 0));
end REGISTRADOR_3_BITS;

architecture ckt of REGISTRADOR_3_BITS is

	component ffd is
		port (ck, clr, set, d : in  std_logic;
								  q : out std_logic);
	end component;

	

	begin

		FF2:ffd port map (clk,clr,set,E(2),S(2));
		FF1:ffd port map (clk,clr,set,E(1),S(1));
		FF0:ffd port map (clk,clr,set,E(0),S(0));


end ckt;