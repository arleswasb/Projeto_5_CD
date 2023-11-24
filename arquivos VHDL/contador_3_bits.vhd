library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_3_bits is --- USADO NO CONTADOR J
   Port ( up,clr,ck : in STD_LOGIC;
         	S: out std_logic_vector(2 downto 0));
end contador_3_bits;

architecture ckt of contador_3_bits is

component ffjk is
   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
end component;

component MUX_2x1_1bit is -- multiplexador 2X1
	port(	A: in std_logic;
		EA,EB: in std_logic;
	     	S : out std_logic);
end component;

signal 	MUX00,MUX01,MUX02			: 	std_logic;
signal 		 aux_MUX01,aux_MUX02	:  std_logic;

signal  	FFJK2,FFJK1,FFJK0 	:  std_logic;
signal  	FFJK2Q,FFJK1Q,FFJK0Q 	:  std_logic;


begin

mx0: MUX_2x1_1bit  port map (CLR,UP,FFJK0,mux00);
FF0: ffjk  port map (ck,'0','0',mux00,mux00,FFJK0Q);
FFJK0 <= FFJK0Q;

------------------------------------------------------------
aux_MUX01 <= FFJK0Q and mux00;--SINAL DE ENTRADA DO MUX 1

mx1: MUX_2x1_1bit  port map (aux_MUX01,FFJK1,mux01);
FF1: ffjk  port map (ck,'0','0',mux01,mux01,FFJK1Q);

FFJK1 <= FFJK1Q;

------------------------------------------------------------
aux_MUX02 <= FFJK1Q and mux01;--SINAL DE ENTRADA DO MUX 2

mx2: MUX_2x1_1bit  port map (aux_MUX02,FFJK2,mux02);
FF2: ffjk  port map (ck,'0','0',mux02,mux02,FFJK2Q);

FFJK2 <= FFJK2Q;

------------------------------------------------------------

S(2) <= FFJK2Q;
S(1) <= FFJK1Q;
S(0) <= FFJK0Q;

end ckt;