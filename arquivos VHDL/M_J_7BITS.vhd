library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity M_J_7BITS is -- 
   Port ( EA: in std_logic_vector(7 downto 0);
			CLK,LOAD_M,SET_M:  in std_logic;
         OUT_B: out std_logic_vector(7 downto 0));
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

SIGNAL MUX00,MUX01:std_logic_vector(6 downto 0);
SIGNAL SAIDA_INT:std_logic_vector(6 downto 0); 


begin

OUT_B <= SAIDA_INT;
    
	 
U0: mux_2x1_7BITS PORT MAP (SAIDA_INT,EA,LOAD_M,MUX00);
U1: mux_2x1_7BITS PORT MAP (MUX00,"1100100",SET_M,MUX01);
C0: REGISTRADOR_7_BITS PORT MAP (CLK,'1','1',MUX01,SAIDA_INT);
	 
	 
end ckt;