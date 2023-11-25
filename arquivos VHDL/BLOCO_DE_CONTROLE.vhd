library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_DE_CONTROLE is
   port (A, B, C, D, E: in  std_logic;
			N: out std_logic_vector(1 downto 0);
         led: out std_logic);
end BLOCO_DE_CONTROLE;

architecture CKT of BLOCO_DE_CONTROLE is


begin
   
N <= not(A and B) or (A and C) or (B and E) or (A and B);

led <= (A and not(E)) or (not(A) and B and C) or (A and not(B) and D);
	
	
end CKT;