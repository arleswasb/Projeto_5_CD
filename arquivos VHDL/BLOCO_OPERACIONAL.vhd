library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_OPERACIONAL is
   port (Clock: in std_logic;
			S: in std_logic_vector(1 downto 0);
			V: in std_logic_vector(9 downto 0);
			F, TT: out std_logic;
			c, i: out std_logic_vector(5 downto 0)
			);
end BLOCO_OPERACIONAL;

architecture CKT of BLOCO_OPERACIONAL is

	component mux_2x1_10BITS is
		Port ( EA,EB: in std_logic_vector(9 downto 0);
				S:  in std_logic;
				O: out std_logic_vector(9 downto 0));
	end component;
	
	component VT is -- VALOR DE TROCO 
		Port ( D: in std_logic_vector(9 downto 0);
				CLK, LOAD_VT:  in std_logic;
				VT: out std_logic_vector(9 downto 0));
	end component;
	
	component COMPARADOR_ZERO_10 is
		port (A : in  std_logic_VECTOR(9 downto 0);
				QS : out std_logic);
	end component;
	
	component SINAL_ESTADO is
		port (E: in  std_logic_vector(1 downto 0);
				setup, standby, teste, troco : out std_logic);
	end component;
	
	component COFRE is
		port (Clock, loadM, setup, standby, teste, troco: in std_logic;
				VT: in std_logic_vector(9 downto 0);
				LOAD_VT, F: out std_logic;
				i, c: out std_logic_vector(5 downto 0);
				D: out std_logic_vector(9 downto 0));
	end component;
	
	signal setup, standby, teste, troco, loadM, LOAD_VT, loadVT, TT_signal, F_signal: std_logic;
	signal VT_signal, D, saida: std_logic_vector(9 downto 0);
begin
   S0: SINAL_ESTADO port map(S, setup, standby, teste, troco);
	
	loadM <= F_signal and TT_signal;
	M0: mux_2x1_10BITS port map(D, V, standby, saida);
	
	loadVT <= standby and LOAD_VT;
	
	V0: VT port map(saida, Clock, loadVT, VT_signal);
	
	C0: COMPARADOR_ZERO_10 port map(VT_signal, TT_signal);
	
	C1: COFRE port map(Clock, loadM, setup, standby, teste, troco, VT_signal, LOAD_VT, F_signal, i, c, D);
	
	TT <= TT_signal;
	F <= F_signal;
	
end CKT;