
library ieee;
use ieee.std_logic_1164.all;

entity mux_6x1 is
  port (
    d0,d1,d2,d3,d4,d5 : in std_logic;
    SEL : in std_logic_vector (2 downto 0);
    Y : out std_logic
    );
end mux_6x1;

architecture ckt of mux_6x1 is
begin
  process (d0,d1,d2,d3,d4,d5,sel)
			begin
				case sel is
					when "000" => Y <= d0;
					when "001" => Y <= d1;
					when "010" => Y <= d2;
					when "011" => Y <= d3;
					when "100" => Y <= d4;
					when "110" => Y <= d5;
					when others => y <= '0';
				end case;
			end process;
	 
end ckt;