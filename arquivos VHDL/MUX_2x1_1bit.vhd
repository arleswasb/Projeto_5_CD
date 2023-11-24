library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1_1bit is -- multiplexador 2X1
	port(	A: in std_logic;
		EA,EB: in std_logic;
	     	S : out std_logic);
end MUX_2x1_1bit;

architecture ckt of MUX_2x1_1bit is


begin


S <= ((not A) and EA) or (A and EB);

end ckt;