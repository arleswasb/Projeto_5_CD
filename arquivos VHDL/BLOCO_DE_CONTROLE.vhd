library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_DE_CONTROLE is
   port (CLK: in  std_logic;
		T,TT,F: in  std_logic;
		--N_EXT: out std_logic_vector(1 downto 0);
       		led: out std_logic;
		S:out std_logic_VECTOR(1 downto 0));
end BLOCO_DE_CONTROLE;

architecture CKT of BLOCO_DE_CONTROLE is

COMPONENT CIRCUITO_COMB is
        port (S0,S1: in  std_logic;
		BS,TT,F: IN STD_LOGIC;
            	N0,N1: out std_logic;
		led: out STD_LOGIC);
end COMPONENT;

COMPONENT MAQUINA_ESTADOS is
   port (cLk : in  std_logic; 
	N : in  std_logic_VECTOR(1 downto 0); -- N REPRESENTA O NUMERO DE ESTADOS
        S : out std_logic_VECTOR(1 downto 0));
				 
end COMPONENT;

component bnt_sincrono is
    port(clk, BTN: in std_logic;
        saida: out std_logic);
end component;

SIGNAL N_INT,S_INT	: std_logic_VECTOR(1 downto 0); 
SIGNAL BS		: STD_LOGIC;

begin

BC0: MAQUINA_ESTADOS PORT MAP (CLK,N_INT,S_INT);
BC1: CIRCUITO_COMB PORT MAP (S_INT(0),S_INT(1),BS,TT,F,N_INT(0),N_INT(1),LED);
BC2: bnt_sincrono  PORT MAP (CLK,T,BS);
S <= S_INT;

end CKT;