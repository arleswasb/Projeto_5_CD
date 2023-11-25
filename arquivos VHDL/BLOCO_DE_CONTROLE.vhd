library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_DE_CONTROLE is
   port (S: in std_logic_vector(1 downto 0);
			BS,TT,F: in  std_logic;
			N: out std_logic_vector(1 downto 0);
         led: out std_logic);
end BLOCO_DE_CONTROLE;

architecture CKT of BLOCO_DE_CONTROLE is

signal A,B,C,D,E : STD_LOGIC;


begin

A <= S(1);
B <= S(0);
C <= BS;
D <= TT;
E <= F;
   
N(0) <= ((NOT A) and (NOT B)) or ((NOT A) and (NOT C)) or ((NOT B) and E) or (A and B);

N(1) <= (A and (not E)) or ((not A) and B and C) or (A and (not B) and D);

led <= (A and not(E)) or (not(A) and B and C) or (A and not(B) and D);
	
	
end CKT;