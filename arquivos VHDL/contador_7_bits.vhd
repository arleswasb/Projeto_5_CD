library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_7_bits is ---
   Port ( up,clr,ck : in STD_LOGIC;
         	S: out std_logic_vector(2 downto 0));
end contador_7_bits;

architecture ckt of contador_7_bits is

component ffjk is
   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
end component;

component MUX_2x1_1bit is -- multiplexador 2X1
	port(	A: in std_logic;
		EA,EB: in std_logic;
	     	S : out std_logic);
end component;

signal 	MUX00,MUX01,MUX02,MUX03,MUX04,MUX05,MUX06									: 	std_logic;
signal 		 aux_MUX01,aux_MUX02,aux_MUX03,aux_MUX04,aux_MUX05,aux_MUX06	:  std_logic;

signal  	FFJK6,FFJK5,FFJK4,FFJK3,FFJK2,FFJK1,FFJK0 			:  std_logic;
signal  	FFJK6Q,FFJK5Q,FFJK4Q,FFJK3Q,FFJK2Q,FFJK1Q,FFJK0Q 	:  std_logic;


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
aux_MUX03 <= FFJK2Q and mux02;--SINAL DE ENTRADA DO MUX 3

mx3: MUX_2x1_1bit  port map (aux_MUX03,FFJK3,mux03);
FF3: ffjk  port map (ck,'0','0',mux03,mux03,FFJK3Q);

FFJK3 <= FFJK3Q;

------------------------------------------------------------
aux_MUX04 <= FFJK3Q and mux03;--SINAL DE ENTRADA DO MUX 4

mx4: MUX_2x1_1bit  port map (aux_MUX04,FFJK4,mux04);
FF4: ffjk  port map (ck,'0','0',mux04,mux04,FFJK4Q);

FFJK4 <= FFJK4Q;

------------------------------------------------------------
aux_MUX05 <= FFJK4Q and mux04;--SINAL DE ENTRADA DO MUX 5

mx5: MUX_2x1_1bit  port map (aux_MUX05,FFJK5,mux05);
FF5: ffjk  port map (ck,'0','0',mux05,mux05,FFJK5Q);

FFJK5 <= FFJK5Q;

------------------------------------------------------------
aux_MUX06 <= FFJK5Q and mux05;--SINAL DE ENTRADA DO MUX 6

mx6: MUX_2x1_1bit  port map (aux_MUX06,FFJK6,mux06);
FF6: ffjk  port map (ck,'0','0',mux06,mux06,FFJK6Q);

FFJK6 <= FFJK6Q;
------------------------------------------------------------

S(6) <= FFJK6Q;
S(5) <= FFJK5Q;
S(4) <= FFJK4Q;
S(3) <= FFJK3Q;
S(2) <= FFJK2Q;
S(1) <= FFJK1Q;
S(0) <= FFJK0Q;

end ckt;