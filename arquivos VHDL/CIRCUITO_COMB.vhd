library ieee;
use ieee.std_logic_1164.all;

entity CIRCUITO_COMB is
        port (S0,S1: in  std_logic;
		BS,TT,F: IN STD_LOGIC;
            	N0,N1: out std_logic;
		led: out STD_LOGIC);
end CIRCUITO_COMB;
		

architecture CKT of CIRCUITO_COMB is

signal A,B,C,D,E : STD_LOGIC;


begin

A <= S1;
B <= S0;
C <= BS;
D <= TT;
E <= F;
   
N0 <= ((NOT A) and (NOT B)) or ((NOT A) and (NOT C)) or ((NOT B) and E) or (A and B);

N1 <= (A and (not E)) or ((not A) and B and C) or (A and (not B) and D);

led <= (A and not(E)) or (not(A) and B and C) or (A and not(B) and D);
	
	
end CKT;