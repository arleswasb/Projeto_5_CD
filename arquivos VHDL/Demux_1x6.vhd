library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1x6 is -- entrada de valor teste para saida por moeda
   Port (ENT: in std_logic;
			sel:  in std_logic_vector(2 downto 0);
        S5,S4,S3,S2,S1,S0: out std_logic);
end Demux_1x6;

architecture ckt of Demux_1x6 is


	begin
			process (Vt,sel)
			begin
			S0 <= '0'; -- moeda de 100 centavo (1 real)
			S1 <= '0'; -- moeda de 50 centavos
			S2 <= '0'; -- moeda de 25 centavos
			S3 <= '0'; -- moeda de 15 centavos
			S4 <= '0'; -- moeda de 10 centavos
			S5 <= '0'; -- moeda de 1 centavos 
			
				case sel is
					when "000" => S0 <= ENT;
					when "001" => S1 <= ENT;
					when "010" => S2 <= ENT;
					when "011" => S3 <= ENT;
					when "100" => S4 <= ENT;
					when "110" => S5 <= ENT;
					when others => S0 <= '0';
				end case;
			end process;
end ckt;

