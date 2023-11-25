
library ieee;
use ieee.std_logic_1164.all;

entity COFRE is
  port (Clk, load_M, setup, standby, teste, troco: in std_logic; --ENTRADAS DO COFRE
				VT: in std_logic_vector(9 downto 0); -- ENTRADA EXTERNAA (VALOR DE TESTE)
				LOAD_VT, F: out std_logic; -- SAIDA INTERNA AO COFRE
				I,C: out std_logic_vector(5 downto 0); --SAIDA EXTERNA PARA INDICAR A SITUAÇÃO DOS COFRES(CHEIO OU VAZIO)
				D: out std_logic_vector(9 downto 0)); -- SAIDA DE RETROALIMENTAÇÃO PARACOMPARAR COM V(VALOR DE ENTRADA)
end entity COFRE;

architecture ckt of COFRE is
-------------------------------------------------------------------------------------------------------------------------------
-- SINAIS GERAIS

SIGNAL J_UP																		:	STD_LOGIC; --(J++) É O SINAL GERADO NA SAIDA DO BLOCO DE MUX 6X1 E MUX 2X1 
SIGNAL C_OUT																	:	STD_LOGIC; --C_OUT É O SINAL GERADO NA SAIDA DO BLOCO DE MUX 6X1 DO J++
SIGNAL Z_OUT																	:	STD_LOGIC; --Z_OUT É O SINAL GERADO NA SAIDA DO BLOCO DE MUX 6X1 DO J++
SIGNAL C_EXTERNO, I_EXTERNO												:  std_logic_vector(6 downto 0);
SIGNAL C5,C4,C3,C2,C1,C0													:	STD_LOGIC; --C(X) É O SINAL GERADO NA SAIDA DAS LOGICAS DAS MOEDAS USADO NO MUX_000 
SIGNAL Z5,Z4,Z3,Z2,Z1,Z0													:	STD_LOGIC; --Z(X) É O SINAL GERADO NA SAIDA DAS LOGICAS DAS MOEDAS USADO NO MUX_001
SIGNAL I5,I4,I3,I2,I1,I0													:	STD_LOGIC; --Z(X) É O SINAL GERADO NA SAIDA DAS LOGICAS DAS MOEDAS USADO NO MUX_001
SIGNAL TROCO6,TROCO5,TROCO4,TROCO3,TROCO2,TROCO1,TROCO0			:	STD_LOGIC; --Z(X) É O SINAL GERADO NA SAIDA DAS LOGICAS DAS MOEDAS USADO NO MUX_001
SIGNAL CONT_M6,CONT_M5,CONT_M4,CONT_M3,CONT_M2,CONT_M1,CONT_M0	:	STD_LOGIC; --Z(X) É O SINAL GERADO NA SAIDA DAS LOGICAS DAS MOEDAS USADO NO MUX_001
SIGNAL MAIOR_IGUAL	:	STD_LOGIC; --É O SINAL GERADO NA SAIDA DO COMPARADOR DE 10 BITS
SIGNAL COUT_SUB																:	STD_LOGIC; -- SINAL DE COUT NO SUBTRATOR

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- COMPONENTES DO CONTADOR J

COMPONENT contador_3_bits is --- USADO NO CONTADOR J
   Port ( up,clr,ck : in STD_LOGIC;
         	S: out std_logic_vector(2 downto 0));
end COMPONENT;

COMPONENT COMP_5 is
   port (J : in  std_logic_VECTOR(2 downto 0);
          S : out std_logic);
end COMPONENT;

-- SINAIS DO CONTADOR J


SIGNAL J_OUT,J_IN,J		:  std_logic_vector(2 downto 0); --SAIDA J DO CONTADOR
SIGNAL F_IN, F_OUT, F_CLEAR	:	STD_LOGIC; --F_OUT É O SINAL GERADO NA SAIDA DA PORTA END, F_IN É O MESMO SINAL F_OUT USADO PARA DA UM CLEAR NO CONTADOR F
SIGNAL AUX_1,AUX_2	:	STD_LOGIC;--AUX_1 USADO NA SAIDA DO COMP5, AUX_2 USADO NA ENTRADA DA PORTA END
-------------------------------------------------------------------------------------------------------------------------------

-- COMPONENTES DO VALOR DE M

COMPONENT VALOR_M is --- USADO NO CONTADOR J
   Port ( 	J : in std_logic_vector(2 downto 0);
         	S: out std_logic_vector(9 downto 0));
end COMPONENT;

-- SINAL COM VALOR DE M

SIGNAL VAL_M		:  std_logic_vector(9 downto 0); --SAIDA DO VALOR DE M

-------------------------------------------------------------------------------------------------------------------------------

-- COMPONENTES DO VALOR DE J++

component mux_6x1 is
   port (
    d0,d1,d2,d3,d4,d5 : in std_logic;
    SEL : in std_logic_vector (2 downto 0);
    Y : out std_logic
    );
end component;

COMPONENT MUX_2x1_1bit is -- multiplexador 2X1
	port(	A: in std_logic; ---SELETOR
		EA,EB: in std_logic; --- NUMEROS DE ENTRADA
	     	S : out std_logic); -- SAIDA
end COMPONENT;

SIGNAL mux1_out, mux2_out		:  std_logic; --SAIDA DO VALOR dos dois mux de 6 canais
SIGNAL AUX_3 					:  std_logic; -- SINAL AUXILIAR RETIRADO NA SAIDA DA PORTA OU
SIGNAL mux3_out 					:  std_logic; --SAIDA DO VALOR do mux de 2 canais

-------------------------------------------------------------------------------------------------------------------------------

-- COMPONENTES DO VALOR DE TROCO(X) DE 0 A 5

COMPONENT Demux_1x6 is -- entrada de valor teste E CONT_M  para ENTRADA por moeda
   Port (ENT: in std_logic;
			sel:  in std_logic_vector(2 downto 0);
         S5,S4,S3,S2,S1,S0: out std_logic);
end COMPONENT;

-- COMPONENTES DO VALOR DE CONT_M(X) DE 0 A 5

SIGNAL AUX_4 					:  std_logic; -- SINAL AUXILIAR RETIRADO NA SAIDA DA PORTA END

---------------------------------------------------------------------------------------------------------------------------------------------
-- COMPONENTES DO CONTADOR DE MOEDAS

COMPONENT MOEDA_J is
   port (cLk,LOAD_M, SET_M,UP_CONT_M, TROCO_J,clr_CONT_M 	: in  std_logic;
		   C_J, CONT_Z_J, I_J 											: out std_logic);
							
end COMPONENT;
---------------------------------------------------------------------------------------------------------------------------------------------
-- COMPONENTES DO LOAD VT

COMPONENT COMPARADOR_10_BITS is
   port (A,B : in  std_logic_VECTOR(9 downto 0);
         QS : out std_logic); -- MAIOR OU IGUAL SERÁ O SINAL DE SAIDA
end COMPONENT;

SIGNAL AUX_5 					:  std_logic; -- SINAL AUXILIAR RETIRADO NA SAIDA DO COMPARADOR 10 BITS

---------------------------------------------------------------------------------------------------------------------------------------------
-- COMPONENTES DO COMPARADOR D

COMPONENT SUBTRATOR_10_BITS is
   Port (A, B :  in std_logic_vector(9 downto 0); -- números de 10 bits a serem subtraídos
			 Cin : in std_logic; -- bit de carry in
			 S : out std_logic_vector(9 downto 0); -- resultado da subtração de 10 bits
			 Cout : out std_logic -- bit de carry out;
			 );
end COMPONENT;




---------------------------------------------------------------------------------------------------------------------------------------------
begin


--CONTADOR J
---------------------------------------------------------------------------------------------------------------------------------------------

CONTJ: contador_3_bits PORT MAP (J_UP,F_IN,CLK,J_OUT);
COMP5: COMP_5 PORT MAP (J_IN,AUX_1);
J_IN <= J_OUT;
AUX_2 <= J_UP;
F_OUT <= AUX_1 AND AUX_2;
J <= J_OUT;-- SINAL  DE SAIDA J

--CALCULO DO VALOR DE M (SINAL VAL_M)
---------------------------------------------------------------------------------------------------------------------------------------------

CONT_M: VALOR_M PORT MAP (J, VAL_M);

--CALCULO DO SINAL J++ COM USO DOS MUX
---------------------------------------------------------------------------------------------------------------------------------------------
MUX_000:  mux_6x1 PORT MAP (C0,C1,C2,C3,C4,C5,J,MUX1_OUT);
MUX_001:  mux_6x1 PORT MAP (Z0,Z1,Z2,Z3,Z4,Z5,J,Z_OUT);
MUX_003:  MUX_2x1_1bit PORT MAP (TROCO, AUX_3, Z_OUT, mux3_out);

C_OUT <= MUX1_OUT;-- SAIDA UTILIZADA NO CONT_M
AUX_3 <= MUX1_OUT OR (NOT MAIOR_IGUAL);
J_UP  <= mux3_out AND (TESTE OR TROCO);
---------------------------------------------------------------------------------------------------------------------------------------------
--CALCULO DO SINAL TROCO(X)

DEMUX_000: Demux_1x6 PORT MAP (TROCO,J,TROCO0,TROCO1,TROCO2,TROCO3,TROCO4,TROCO5);

---------------------------------------------------------------------------------------------------------------------------------------------
--CALCULO DO SINAL CONT_M(X)

DEMUX_001: Demux_1x6 PORT MAP (AUX_4,J,CONT_M0,CONT_M1,CONT_M2,CONT_M3,CONT_M4,CONT_M5);
AUX_4 <= MAIOR_IGUAL AND (NOT C_OUT);
---------------------------------------------------------------------------------------------------------------------------------------------
-- CALCULO DE LOAD VT

COMPARADOR: COMPARADOR_10_BITS PORT MAP (VT,VAL_M,AUX_4);
MAIOR_IGUAL <= AUX_4;
LOAD_VT <= (NOT C_OUT) AND AUX_4; 

---------------------------------------------------------------------------------------------------------------------------------------------
-- CALCULO DO D (PARA RETROALIMENTAR O VALOR DE VT)

SUBTRATOR: SUBTRATOR_10_BITS PORT MAP (VT,VAL_M, '0', D, Cout_SUB);

-- SAIDA I E C

I(5) <= I5;
I(4) <= I4;
I(3) <= I3;
I(2) <= I2;
I(1) <= I1;
I(0) <= I0;
 
C(5) <= C5;
C(4) <= C4;
C(3) <= C3;
C(2) <= C2;
C(1) <= C1;
C(0) <= C0;







---------------------------------------------------------------------------------------------------------------------------------------------
-- CONTADOR DE MOEDAS


MOEDA_100: MOEDA_J PORT MAP (cLk,LOAD_M, SETUP,CONT_M0,TROCO0,STANDBY, C0, Z0, I0);
MOEDA_50:  MOEDA_J PORT MAP (cLk,LOAD_M, SETUP,CONT_M1,TROCO1,STANDBY, C1, Z1, I1);
MOEDA_25:  MOEDA_J PORT MAP (cLk,LOAD_M, SETUP,CONT_M2,TROCO2,STANDBY, C2, Z2, I2);
MOEDA_15:  MOEDA_J PORT MAP (cLk,LOAD_M, SETUP,CONT_M3,TROCO3,STANDBY, C3, Z3, I3); 
MOEDA_5:   MOEDA_J PORT MAP (cLk,LOAD_M, SETUP,CONT_M4,TROCO4,STANDBY, C4, Z4, I4);
MOEDA_1:   MOEDA_J PORT MAP (cLk,LOAD_M, SETUP,CONT_M5,TROCO5,STANDBY, C5, Z5, I5);

 
 
 
 
end ckt;