library ieee;
use ieee.std_logic_1164.all;

entity MAQUINA_ESTADOS is
   port (cLk : in  std_logic;
	CLR: in std_logic;
	N : in  std_logic_VECTOR(1 downto 0); -- N REPRESENTA O NUMERO DE ESTADOS
        S : out std_logic_VECTOR(1 downto 0));
				 
end MAQUINA_ESTADOS;

architecture CKT of MAQUINA_ESTADOS is

--------------------------------------------------------------
COMPONENT ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end COMPONENT;


begin
   
U0: FFD PORT MAP (CLK,CLR,'0',N(0),S(0));

U1: FFD PORT MAP (CLK, CLR,'0',N(1),S(1));


   
end CKT;
