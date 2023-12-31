library ieee;
use ieee.std_logic_1164.all;

entity BLOCO_OPERACIONAL is
   port (clr_A,Clock: in std_logic;
			S_ESTADO: in std_logic_vector(1 downto 0);
			clr: in std_logic;
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
				CLK,clr, LOAD_VT:  in std_logic;
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
	
	COMPONENT COFRE is
	port (clr_A,Clk,clr, load_M, setup, standby, teste, troco: in std_logic; --ENTRADAS DO COFRE
				VT: in std_logic_vector(9 downto 0); -- ENTRADA EXTERNAA (VALOR DE TESTE)
				LOAD_VT,F: out std_logic; -- SAIDA INTERNA AO COFRE
				I,C: out std_logic_vector(5 downto 0); --SAIDA EXTERNA PARA INDICAR A SITUAÇÃO DOS COFRES(CHEIO OU VAZIO)
				D: out std_logic_vector(9 downto 0)); -- SAIDA DE RETROALIMENTAÇÃO PARACOMPARAR COM V(VALOR DE ENTRADA)
	end COMPONENT;
	
	signal setup, standby, teste, troco, loadM, cofre_LOAD_VT, loadVT, TT_signal, F_signal: std_logic;
	signal VT_signal, D, saida: std_logic_vector(9 downto 0);


begin
   	S0: SINAL_ESTADO port map(S_ESTADO, setup, standby, teste, troco);
	
	loadM <= F_signal and TT_signal;

	M000: mux_2x1_10BITS port map(D, V, standby, saida);
	
	loadVT <= standby or cofre_LOAD_VT;
	
	V0: VT port map(saida, Clock,clr_A, loadVT, VT_signal);
	
	C0: COMPARADOR_ZERO_10 port map(VT_signal, TT_signal);
	
	C1: COFRE port map(clr_A,Clock,clr, loadM, setup, standby, teste, troco, VT_signal, cofre_LOAD_VT, F_signal, i, c, D);
	
	TT <= TT_signal;
	F <= F_signal;
	
end CKT;