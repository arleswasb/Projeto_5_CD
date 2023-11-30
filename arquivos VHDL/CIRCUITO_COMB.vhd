library ieee;
use ieee.std_logic_1164.all;

entity CIRCUITO_COMB is
        port (S0,S1: in  std_logic;
		BS,TT,F: IN STD_LOGIC;
            	N0,N1: out std_logic;
		led: out STD_LOGIC);
end CIRCUITO_COMB;
		

architecture CKT of CIRCUITO_COMB is

begin

   
N0 <= ((NOT S1) and (NOT S0)) or ((NOT S1) and (NOT BS)) or ((NOT S0) and F) or (S1 and S0);

N1 <= (S1 and (not F)) or ((not S1) and S0 and BS) or (S1 and (not S0) and TT);

led <= (S1 and not(F)) or (not(S1) and S0 and BS) or (S1 and not(S0) and TT);
	
	
end CKT;
