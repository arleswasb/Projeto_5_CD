library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1x6 is -- entrada de valor teste para saida por moeda
   Port (ENT: in std_logic;
			sel:  in std_logic_vector(2 downto 0);
         S: out std_logic_vector(5 downto 0));
end Demux_1x6;

architecture ckt of Demux_1x6 is


	begin
			process (ENT,sel)
			begin
			S(0) <= '0'; -- moeda de 100 centavo (1 real)
			S(1) <= '0'; -- moeda de 50 centavos
			S(2) <= '0'; -- moeda de 25 centavos
			S(3) <= '0'; -- moeda de 15 centavos
			S(4) <= '0'; -- moeda de 10 centavos
			S(5) <= '0'; -- moeda de 1 centavos 
			
				case sel is
					when "000" => S(0) <= ENT;
					when "001" => S(1) <= ENT;
					when "010" => S(2) <= ENT;
					when "011" => S(3) <= ENT;
					when "100" => S(4) <= ENT;
					when "110" => S(5) <= ENT;
					when others => S(0) <= '0';
				end case;
			end process;
end ckt;

