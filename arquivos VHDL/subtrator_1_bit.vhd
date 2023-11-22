library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity SUBTRATOR_1_BIT is
   Port (A, B :  in STD_LOGIC; -- números de 1 bits a serem subtraídos
			 Cin : in std_logic; -- bit de carry in
			 S : out std_logic; -- resultado da subtração de 1 bits
			 Cout : out std_logic -- bit de carry out;
			 );
end SUBTRATOR_1_BIT;

architecture ckt of SUBTRATOR_1_BIT is

	begin
		 S <= A xor B xor Cin;
		 Cout  <= (not(A) and Cin) or (not(A) and B) or (B and Cin);

end ckt;