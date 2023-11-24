library ieee;
use ieee.std_logic_1164.all;

entity REG_ESTADOS_2 is
   port (cLk : in  std_logic; 
			N : in  std_logic_VECTOR(1 downto 0); -- N REPRESENTA O NUMERO DE ESTADOS
             S : out std_logic_VECTOR(1 downto 0));
				 
end REG_ESTADOS_2;

architecture CKT of REG_ESTADOS_2 is

--------------------------------------------------------------
COMPONENT ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end COMPONENT;

SIGNAL COMUM:std_logic; ---LIGA O CLEAR DO FFD0 AO PRESET DO FFD1
SIGNAL FDD0Q,FDD1Q:std_logic; ---LIGA O CLEAR DO FFD0 AO PRESET DO FFD1

begin
   
U0: FFD PORT MAP (CLK, comum,comum,N(0),FDD0Q);

U1: FFD PORT MAP (CLK, comum,comum,N(1),FDD1Q);

S(1) <= FDD1Q;
S(0) <= FDD0Q;



   
end CKT;