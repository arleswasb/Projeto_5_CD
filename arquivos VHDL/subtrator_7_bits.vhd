library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity SUBTRATOR_7_BITS is
   Port (A, B :  in std_logic_vector(6 downto 0); -- números de 7 bits a serem subtraídos
			 Cin : in std_logic; -- bit de carry in
			 S : out std_logic_vector(6 downto 0); -- resultado da subtração de 7 bits
			 Cout : out std_logic -- bit de carry out;
			 );
end SUBTRATOR_7_BITS;

architecture ckt of SUBTRATOR_7_BITS is

	component SUBTRATOR_1_BIT is
		Port (A, B :  in STD_LOGIC; -- números de 7 bits a serem subtraídos
				 Cin : in std_logic; -- bit de carry in
				 S : out std_logic; -- resultado da subtração de 7 bits
				 Cout : out std_logic -- bit de carry out;
				 );
	end component;
	signal saida_cout: std_logic_vector(5 downto 0);
	
	
	begin
	
		FF0:SUBTRATOR_1_BIT port map (A(0), B(0), '0', S(0), saida_cout(0));
		FF1:SUBTRATOR_1_BIT port map (A(1), B(1), saida_cout(0), S(1), saida_cout(1));
		FF2:SUBTRATOR_1_BIT port map (A(2), B(2), saida_cout(1), S(2), saida_cout(2));
		FF3:SUBTRATOR_1_BIT port map (A(3), B(3), saida_cout(2), S(3), saida_cout(3));
		FF4:SUBTRATOR_1_BIT port map (A(4), B(4), saida_cout(3), S(4), saida_cout(4));
		FF5:SUBTRATOR_1_BIT port map (A(5), B(5), saida_cout(4), S(5), saida_cout(5));
		FF6:SUBTRATOR_1_BIT port map (A(6), B(6), saida_cout(5), S(6), Cout);
		

end ckt;