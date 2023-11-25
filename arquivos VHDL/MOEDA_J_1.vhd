library ieee;
use ieee.std_logic_1164.all;

entity MOEDA_J_1 is
   port (cLk,LOAD_M, SET_M,UP_CONT_M, TROCO_J,clr_CONT_M : in  std_logic;
		
                     C_J, CONT_Z_J, I_J 						: out std_logic);
							
end MOEDA_J_1;

architecture CKT of MOEDA_J_1 is

COMPONENT M_J_7BITS is -- 
   Port ( SUBT: in std_logic_vector(6 downto 0);
			CLK,LOAD_M,SET_M:  in std_logic;
         M: out std_logic_vector(6 downto 0));
end COMPONENT;

----------------------------------------------------------------------------------------
component SUBTRATOR_7_BITS is
   Port (A, B :  in std_logic_vector(6 downto 0); -- números de 7 bits a serem subtraídos
			 Cin : in std_logic; -- bit de carry in
			 S : out std_logic_vector(6 downto 0); -- resultado da subtração de 7 bits
			 Cout : out std_logic -- bit de carry out;
			 );
end component;

----------------------------------------------------------------------------------------
component contador_up_dw_7_bits is
   Port ( up, dw,clr,ck	: in STD_LOGIC;
							S	: out std_logic_vector(6 downto 0));
end component;

----------------------------------------------------------------------------------------
component COMPARADOR_ZERO_7 is
   port (A : in  std_logic_VECTOR(6 downto 0);
         QS : out std_logic);
end component;

signal SUBTRACT_OUT,SUBTRACT_IN: std_logic_vector(6 downto 0); --- ENTRADA E SAIDA DO SUBTRATOR
signal CONT_M_OUT:  std_logic_vector(6 downto 0); --- SAIDA DO CONTADOR M
signal COMP_ZERO1_IN,COMP_ZERO2_IN: std_logic_vector(6 downto 0); ---  ENTRADAS E SAIDAS DOS DOIS COMPARADORES DE ZERO
signal COMP_ZERO2_OUT: std_logic; ---  ENTRADAS E SAIDAS DOS DOIS COMPARADORES DE ZERO
signal DW_CONT_M:  STD_LOGIC; -- ENTRADA PARA CONTAR NEGATIVAMENTE NO CONTADOR M
SIGNAL Cout: STD_LOGIC;--- SINAL DE SAIDA DO CARRY OUT DO CONTADOR

begin

COMP_ZERO1_IN <= CONT_M_OUT;--- SINAL INTERNO NA  SAIDA DO CONTADOR M
COMP_ZERO2_IN <= CONT_M_OUT;--- SINAL INTERNO NA  SAIDA DO CONTADOR M
--------------------------------------------------------------------------------------------------------

REG00: M_J_7BITS PORT MAP (SUBTRACT_OUT,CLK,LOAD_M,SET_M,SUBTRACT_IN);


--------------------------------------------------------------------------------------------------------
SUB0: SUBTRATOR_7_BITS PORT MAP (SUBTRACT_IN,CONT_M_OUT,'0',SUBTRACT_OUT,Cout);
--------------------------------------------------------------------------------------------------------
COMP_Z1: COMPARADOR_ZERO_7 PORT MAP (COMP_ZERO1_IN,C_J);
COMP_Z2: COMPARADOR_ZERO_7 PORT MAP (COMP_ZERO2_IN,COMP_ZERO2_OUT);
--------------------------------------------------------------------------------------------------------
CONT_M: contador_up_dw_7_bits PORT MAP (UP_CONT_M, DW_CONT_M,CLR_CONT_M, CLK, CONT_M_OUT);
---------------------------------------------------------------------------------------------------------

DW_CONT_M <= (TROCO_J AND (NOT COMP_ZERO2_OUT));
I_J <= DW_CONT_M;
CONT_Z_J <= COMP_ZERO2_OUT;

--- OBS: UP_CONT_M É A ENTRADA PARA CONTAR POSITIVAMENTE NO CONTADOR M
---------------------------------------------------------------------------------------------------------

	
	
end CKT;