library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_DE_CONTROLE is
   port (BS, TT, F: in  std_logic;
	 S: in std_logic_vector(1 downto 0);
			N: out std_logic_vector(1 downto 0);
         led: out std_logic);
end BLOCO_DE_CONTROLE;

architecture CKT of BLOCO_DE_CONTROLE is
signal A, B, C, D, F, saida: std_logic;

begin
A <= S(1);
B <= S(0);
C <= BS;
D <= TT;
E <= F;

N(0) <= not(A and B) or (A and C) or (B and E) or (A and B);

saida <= (A and not(E)) or (not(A) and B and C) or (A and not(B) and D);
led <= saida;	
N(1) <= saida;	
end CKT;
