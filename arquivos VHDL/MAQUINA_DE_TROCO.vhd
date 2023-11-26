library ieee;
use ieee.std_logic_1164.all;

entity MAQUINA_DE_TROCO is ----IHM DA MAQUINADE TROCO
   port (CLK: in  std_logic;
			T: in std_logic;
			V: in std_logic_vector(9 downto 0);
			C: out std_logic_vector(5 downto 0);
			I: out std_logic_vector(5 downto 0);
         		led: out std_logic);
end MAQUINA_DE_TROCO;

architecture CKT of MAQUINA_DE_TROCO is
---------------------------------------------------------------------------------------------------------------------

COMPONENT BLOCO_DE_CONTROLE is
  port (CLK: in  std_logic;
		T,TT,F: in  std_logic;
		--N_EXT: out std_logic_vector(1 downto 0);
       		led: out std_logic;
		S:out std_logic_vector(1 downto 0));
end COMPONENT;
---------------------------------------------------------------------------------------------------------------------
COMPONENT BLOCO_OPERACIONAL is
   port (Clock: in std_logic;
			S_ESTADO: in std_logic_vector(1 downto 0);
			V: in std_logic_vector(9 downto 0);
			F, TT: out std_logic;
			c, i: out std_logic_vector(5 downto 0)
			);
end COMPONENT;
---------------------------------------------------------------------------------------------------------------------
---SINAIS INTERNOS

signal TT_INT,F_INT: STD_LOGIC;
SIGNAL C_OUT,I_OUT: std_logic_vector(5 downto 0);
SIGNAL S_IN_BO,S_OUT_BC: std_logic_vector(1 downto 0);



begin


U1: BLOCO_DE_CONTROLE PORT MAP (CLK,T,TT_INT,F_INT,LED,S_OUT_BC);
U3: BLOCO_OPERACIONAL PORT MAP (CLK,S_IN_BO,V,F_INT,TT_INT,C_OUT,I_OUT);

C <= C_OUT;
I <= I_OUT;
 
S_OUT_BC <= S_IN_BO;




end CKT;