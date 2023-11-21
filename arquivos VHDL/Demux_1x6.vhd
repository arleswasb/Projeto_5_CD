library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1x6 is -- entrada de valor teste para saida por moeda
   Port ( Vt: in std_logic_vector(5 downto 0);
			sel:  in std_logic_vector(2 downto 0);
         saida0,saida1,saida2,saida3,saida4,saida5: out std_logic_vector(5 downto 0));
end Demux_1x6;

architecture ckt of Demux_1x6 is


	begin
			process (Vt,sel)
			begin
			saida0 <= "000000"; -- moeda de 1 centavo
			saida1 <= "000000"; -- moeda de 5 centavos
			saida2 <= "000000"; -- moeda de 10 centavos
			saida3 <= "000000"; -- moeda de 25 centavos
			saida4 <= "000000"; -- moeda de 50 centavos
			saida5 <= "000000"; -- moeda de 100 centavos (1 real)
			
				case sel is
					when "000" => saida0 <= Vt;
					when "001" => saida1 <= Vt;
					when "010" => saida2 <= Vt;
					when "011" => saida3 <= Vt;
					when "100" => saida4 <= Vt;
					when "110" => saida5 <= Vt;
					when others => saida0 <= "000000";
				end case;
			end process;
end ckt;

