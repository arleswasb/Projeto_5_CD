
library ieee;
use ieee.std_logic_1164.all;

entity mux_6x1 is
  port (
    ENT : in std_logic_vector (5 downto 0);
    SEL : in std_logic_vector (2 downto 0);
    Y : out std_logic
    );
end mux_6x1;

architecture ckt of mux_6x1 is
begin
  process (ENT,sel)
			begin
				case sel is
					when "000" => Y <= ENT(0);
					when "001" => Y <= ENT(1);
					when "010" => Y <= ENT(2);
					when "011" => Y <= ENT(3);
					when "100" => Y <= ENT(4);
					when "110" => Y <= ENT(5);
					when others => y <= '0';
				end case;
			end process;
	 
end ckt;