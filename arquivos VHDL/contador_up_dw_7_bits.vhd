library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_up_dw_7_bits is
   Port (clr_A, up, dw,clr,ck : in STD_LOGIC;
         	S: out std_logic_vector(6 downto 0));
end contador_up_dw_7_bits;

architecture ckt of contador_up_dw_7_bits is

component ffjk is
   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
end component;

component MUX_2x1_1bit is -- multiplexador 2X1
	port(	A: in std_logic;
		EA,EB: in std_logic;
	     	S : out std_logic);
end component;

signal 		MUX00,MUX01a,MUX01b,MUX02a,MUX02b,MUX03a,MUX03b,MUX04a,MUX04b,MUX05a,MUX05b,MUX06a,MUX06b,SEL :   std_logic;
signal 		aux_MUX01a,aux_MUX02a,aux_MUX03a,aux_MUX04a,aux_MUX05a,aux_MUX06a :   std_logic;

signal  	FFJK6,FFJK5,FFJK4,FFJK3,FFJK2,FFJK1,FFJK0,ENT_MX0 :   	std_logic;
signal 		FFJK6Q,FFJK5Q,FFJK4Q,FFJK3Q,FFJK2Q,FFJK1Q,FFJK0Q  :  	std_logic;


begin

SEL <= CLR; -- O CLEAR SERÁ A CHAVE SELETORA

ENT_MX0 <= UP OR DW; -- bit menos significativo FF0
FFJK0 <= FFJK0Q; 
mx0: MUX_2x1_1bit  port map (SEL,ENT_MX0,FFJK0,mux00);
FF0: ffjk  port map (ck,clr_A,'1',mux00,mux00,FFJK0Q);
------------------------------------------------------------
FFJK1 <=  NOT FFJK0Q;

mx1a: MUX_2x1_1bit  port map (DW,FFJK0Q,FFJK1,mux01a);
aux_MUX01a <= mux01a and mux00;
mx1b: MUX_2x1_1bit  port map (sel,aux_MUX01a,FFJK1Q,mux01b);

FF1: ffjk  port map (ck,clr_A,'1',mux01b,mux01b,FFJK1Q);
------------------------------------------------------------
FFJK2 <=  NOT FFJK1Q;

mx2a: MUX_2x1_1bit  port map (DW,FFJK1Q,FFJK2,mux02a);
aux_MUX02a <= mux02a and mux01b;
mx2b: MUX_2x1_1bit  port map (sel,aux_MUX02a,FFJK2Q,mux02b);

FF2: ffjk  port map (ck,clr_A,'1',mux02b,mux02b,FFJK2Q);
------------------------------------------------------------
FFJK3 <=  NOT FFJK2Q;

mx3a: MUX_2x1_1bit  port map (DW,FFJK2Q,FFJK3,mux03a);
aux_MUX03a <= mux03a and mux02b;
mx3b: MUX_2x1_1bit  port map (sel,aux_MUX03a,FFJK3Q,mux03b);

FF3: ffjk  port map (ck,clr_A,'1',mux03b,mux03b,FFJK3Q);
------------------------------------------------------------
FFJK4 <=  NOT FFJK3Q;

mx4a: MUX_2x1_1bit  port map (DW,FFJK3Q,FFJK4,mux04a);
aux_MUX04a <= mux04a and mux03b;
mx4b: MUX_2x1_1bit  port map (sel,aux_MUX04a,FFJK4Q,mux04b);

FF4: ffjk  port map (ck,clr_A,'1',mux04b,mux04b,FFJK4Q);
------------------------------------------------------------
FFJK5 <=  NOT FFJK4Q;

mx5a: MUX_2x1_1bit  port map (DW,FFJK4Q,FFJK5,mux05a);
aux_MUX05a <= mux05a and mux04b;
mx5b: MUX_2x1_1bit  port map (sel,aux_MUX05a,FFJK5Q,mux05b);

FF5: ffjk  port map (ck,clr_A,'1',mux05b,mux05b,FFJK5Q);
------------------------------------------------------------
FFJK6 <=  NOT FFJK5Q;

mx6a: MUX_2x1_1bit  port map (DW,FFJK5Q,FFJK6,mux06a);
aux_MUX06a <= mux06a and mux05b;
mx6b: MUX_2x1_1bit  port map (sel,aux_MUX06a,FFJK6Q,mux06b);

FF6: ffjk  port map (ck,clr_A,'1',mux06b,mux06b,FFJK6Q);



S(6) <= FFJK6Q;
S(5) <= FFJK5Q;
S(4) <= FFJK4Q;
S(3) <= FFJK3Q;
S(2) <= FFJK2Q;
S(1) <= FFJK1Q;
S(0) <= FFJK0Q;

end ckt;
