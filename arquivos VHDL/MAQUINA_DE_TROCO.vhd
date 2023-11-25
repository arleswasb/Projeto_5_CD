library ieee;
use ieee.std_logic_1164.all;

entity MAQUINA_DE_TROCO is ----IHM DA MAQUINADE TROCO
   port (CLK: in  std_logic;
			T: in std_logic;
			V: in std_logic_vector(9 downto 0);
			C: out std_logic_vector(5 downto 0);
         led: out std_logic);
end MAQUINA_DE_TROCO;

architecture CKT of MAQUINA_DE_TROCO is
---------------------------------------------------------------------------------------------------------------------

COMPONENT REG_ESTADOS_2 is
   port (cLk : in  std_logic; 
			N : in  std_logic_VECTOR(1 downto 0); -- N REPRESENTA O NUMERO DE ESTADOS
         S : out std_logic_VECTOR(1 downto 0));
				 
end COMPONENT;

---------------------------------------------------------------------------------------------------------------------

COMPONENT bnt_sincrono is
    port(clk, BTN: in std_logic;
        saida: out std_logic);
end COMPONENT;

---------------------------------------------------------------------------------------------------------------------

COMPONENT BLOCO_DE_CONTROLE is
   port (S: in std_logic_vector(1 downto 0);
			BS,TT,F: in  std_logic;
			N: out std_logic_vector(1 downto 0);
         led: out std_logic);
end COMPONENT;
---------------------------------------------------------------------------------------------------------------------
COMPONENT BLOCO_OPERACIONAL is
   port (Clock: in std_logic;
			S: in std_logic_vector(1 downto 0);
			V: in std_logic_vector(9 downto 0);
			F, TT: out std_logic;
			c, i: out std_logic_vector(5 downto 0)
			);
end COMPONENT;

---------------------------------------------------------------------------------------------------------------------
---SINAIS INTERNOS

signal TT_INT,F_INT,S_INT : STD_LOGIC;
SIGNAL REG_EST_OUT,REG_EST_IN: std_logic_vector(1 downto 0); 
SIGNAL C_OUT,I_OUT: std_logic_vector(5 downto 0); 



begin


U0: bnt_sincrono PORT MAP (CLK,T,S_INT);
U1: BLOCO_DE_CONTROLE PORT MAP (REG_EST_OUT,S_INT,TT_INT,F_INT,REG_EST_IN,LED);
U2: REG_ESTADOS_2 PORT MAP (CLK,REG_EST_IN,REG_EST_OUT);
U3: BLOCO_OPERACIONAL PORT MAP (CLK,REG_EST_OUT,V,F_INT,TT_INT,C_OUT,I_OUT);

C <= C_OUT;

end CKT;