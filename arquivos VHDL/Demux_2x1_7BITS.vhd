library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1_7BITS is -- 
   Port ( EA,EB: in std_logic_vector(7 downto 0);
			sel:  in std_logic;
         saida: out std_logic_vector(7 downto 0));
end mux_2x1_7BITS;

architecture ckt of mux_2x1_7BITS is


	begin
			process (EA,EB,sel)
			begin
			saida0 <= "0000000";
			
				case sel is
					when "0" => saida <= EA;
					when "1" => saida <= EB;
					when others => saida0 <= "0000000";
				end case;
			end process;
end ckt;

