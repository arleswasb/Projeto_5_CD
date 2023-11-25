library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity M_J_7BITS is -- 
   Port ( SUBT: in std_logic_vector(6 downto 0);
			CLK,LOAD_M,SET_M:  in std_logic;
         M: out std_logic_vector(6 downto 0));
end M_J_7BITS;

architecture ckt of M_J_7BITS is

COMPONENT mux_2x1_7BITS is -- 
   Port ( EA,EB: in std_logic_vector(6 downto 0);
			S:  in std_logic;
         O: out std_logic_vector(6 downto 0));
end COMPONENT;

COMPONENT REGISTRADOR_7_BITS is
   Port (clk, clr, set : in STD_LOGIC;
				E :  in STD_LOGIC_VECTOR(6 downto 0);
         	S : out STD_LOGIC_VECTOR(6 downto 0));
end COMPONENT;

SIGNAL S0_MUX,S1_MUX:std_logic_vector(6 downto 0);
SIGNAL ENTRADA_INT,SAIDA_INT,SAIDA_REG:std_logic_vector(6 downto 0);
SIGNAL CEM:std_logic_vector(6 downto 0); --- VALOR CONSTARANTE 100 NA ENTRADA DO MUX2X1
 


begin

M <= SAIDA_REG;
ENTRADA_INT <= SAIDA_REG;

--CEM <= '1'&'1'&'0'&'0'&'1'&'0'&'0';   
CEM <= "1100100";	 
U0: mux_2x1_7BITS PORT MAP (ENTRADA_INT,SUBT,LOAD_M,S0_MUX);
U1: mux_2x1_7BITS PORT MAP (S0_MUX,CEM,SET_M,S1_MUX);
C0: REGISTRADOR_7_BITS PORT MAP (CLK,'1','1',S1_MUX,SAIDA_REG);
	 
	 
end ckt;