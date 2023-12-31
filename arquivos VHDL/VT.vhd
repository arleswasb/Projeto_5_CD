library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VT is -- VALOR DE TROCO 
   Port ( D: in std_logic_vector(9 downto 0);
			CLK,clr,LOAD_VT:  in std_logic;
         VT: out std_logic_vector(9 downto 0));
end VT;

architecture ckt of VT is

COMPONENT mux_2x1_10BITS is -- 
   Port ( EA,EB: in std_logic_vector(9 downto 0);
			S:  in std_logic;
         O: out std_logic_vector(9 downto 0));
end COMPONENT;

COMPONENT REGISTRADOR_10_BITS is
   Port (clk, clr, set : in STD_LOGIC;
		E :  in STD_LOGIC_VECTOR(9 downto 0);
         	S : out STD_LOGIC_VECTOR(9 downto 0));
end COMPONENT;

SIGNAL MUX_sig:std_logic_vector(9 downto 0);
SIGNAL ENTRADA_INT:std_logic_vector(9 downto 0); ---SINAIS INTERNOS NA ENTRADA DO MUX
SIGNAL SAIDA_INT:std_logic_vector(9 downto 0); ---SINAIS INTERNOS NA SAIDA DO REGISTRADOR

begin

-------------------------------------------------------------------------------------------------------

U000: mux_2x1_10BITS PORT MAP (ENTRADA_INT,D,LOAD_VT,MUX_sig);
-------------------------------------------------------------------------------------------------------
C000: REGISTRADOR_10_BITS PORT MAP (CLK,clr,'1',MUX_sig,SAIDA_INT);

ENTRADA_INT <= SAIDA_INT;
VT 			<= SAIDA_INT;	 
	 
end ckt;