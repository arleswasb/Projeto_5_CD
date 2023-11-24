library ieee;
use ieee.std_logic_1164.all;

entity COMPARADOR_ZERO_10 is
   port (A : in  std_logic_VECTOR(9 downto 0);
         QS : out std_logic);
end COMPARADOR_ZERO_10;

architecture CKT of COMPARADOR_ZERO_10 is

signal Q : std_logic;

begin
   
Q <=  NOT (A(9) OR A(8) OR A(7) OR A(6) OR A(5) OR A(4) OR A(3) OR A(2) OR A(1) OR A(0)); 

QS <= Q;
	
	
end CKT;