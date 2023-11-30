library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_CONTROLE is
   port (clr_A,CLK: in  std_logic;
		CLR: in std_logic;
		T,TT,F: in  std_logic;
		--N_EXT: out std_logic_vector(1 downto 0);
       		led_BC: out std_logic;
		S_BC:out std_logic_VECTOR(1 downto 0));
end BLOCO_CONTROLE;

architecture CKT of BLOCO_CONTROLE is

COMPONENT CIRCUITO_COMB is
        port (S0,S1: in  std_logic;
		BS,TT,F: IN STD_LOGIC;
            	N0,N1: out std_logic;
		led: out STD_LOGIC);
end COMPONENT;

COMPONENT MAQUINA_ESTADOS is
   port (cLk : in  std_logic; 
	CLR: in std_logic;
	N : in  std_logic_VECTOR(1 downto 0); -- N REPRESENTA O NUMERO DE ESTADOS
        S : out std_logic_VECTOR(1 downto 0));
				 
end COMPONENT;

component bnt_sincrono is
    port(clk,clr,BTN: in std_logic;
        saida: out std_logic);
end component;
				

SIGNAL ME_OUT,ME_ENT	: std_logic_VECTOR(1 downto 0); 
SIGNAL BS		: STD_LOGIC;

begin

BC0: MAQUINA_ESTADOS PORT MAP (CLK,clr_A,ME_ENT,ME_OUT);
BC1: CIRCUITO_COMB PORT MAP (ME_OUT(0),ME_OUT(1),BS,TT,F,ME_ENT(0),ME_ENT(1),LED_bc);
BC2: bnt_sincrono  PORT MAP (CLK,clr_A,T,BS);

S_BC <= ME_OUT;



end CKT;
