library ieee;
use ieee.std_logic_1164.all;

entity MUX_1x2 is -- multiplexador 2X1
	port(	A: in std_logic;
		EA,EB: in std_logic;
	     	S : out std_logic);
end MUX_1x2;

architecture ckt of MUX_1x2 is


begin


S <= ((not A) and EA) or (A and EB);

end ckt;