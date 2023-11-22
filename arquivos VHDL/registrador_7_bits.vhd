library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTRADOR_7_BITS is
   Port (clk, clr, set : in STD_LOGIC;
		E :  in STD_LOGIC_VECTOR(6 downto 0);
         	S : out STD_LOGIC_VECTOR(6 downto 0));
end REGISTRADOR_7_BITS;

architecture ckt of REGISTRADOR_7_BITS is

	component ffd is
		port (ck, clr, set, d : in  std_logic;
								  q : out std_logic);
	end component;

	

	begin
	
		FF6:ffd port map (clk,clr,set,E(6),S(6));
		FF5:ffd port map (clk,clr,set,E(5),S(5));
		FF4:ffd port map (clk,clr,set,E(4),S(4));
		FF3:ffd port map (clk,clr,set,E(3),S(3));
		FF2:ffd port map (clk,clr,set,E(2),S(2));
		FF1:ffd port map (clk,clr,set,E(1),S(1));
		FF0:ffd port map (clk,clr,set,E(0),S(0));


end ckt;