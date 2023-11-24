library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VALOR_M is --- USADO NO CONTADOR J
   Port ( 	J : in std_logic_vector(2 downto 0);
         	S: out std_logic_vector(9 downto 0));
end VALOR_M;

architecture ckt of VALOR_M is


signal 	A,B,C			: 	std_logic;
signal 	AUX0,AUX1,AUX2,AUX3,AUX4,AUX5,AUX6	:  std_logic;--- SINAIS DE ENTRADA EEM VAL_J
signal 	INTER_AUX0,INTER_AUX4A,INTER_AUX4B  :  std_logic; ---SINAIS INTERMEDIARUIOS DAS PORTAS END E OU


begin

--------------------------------------------------------------------
INTER_AUX0 <= B AND C;
AUX0 <= A OR INTER_AUX0;

--------------------------------------------------------------------
AUX1 <= (NOT A) AND C;

--------------------------------------------------------------------
AUX2 <= (NOT B) AND (NOT C);

------------------------------------------------------------
AUX3 <= B;

------------------------------------------------------------
INTER_AUX4A <= (NOT A) AND (NOT B) AND (NOT C);
INTER_AUX4B <= B AND (NOT C);
AUX4 			<= INTER_AUX4A OR INTER_AUX4B;
------------------------------------------------------------

AUX5 			<= (NOT A) AND (NOT B);
------------------------------------------------------------

AUX6			<= (NOT A) AND (NOT B) AND (NOT C);

------------------------------------------------------------


S(9) <= '0';
S(8) <= '0';
S(7) <= '0';
S(6) <= AUX6;
S(5) <= AUX5;
S(4) <= AUX4;
S(3) <= AUX3;
S(2) <= AUX2;
S(1) <= AUX1;
S(0) <= AUX0;

end ckt;