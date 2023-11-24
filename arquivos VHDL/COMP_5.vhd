library ieee;
use ieee.std_logic_1164.all;

entity COMP_5 is
   port (J : in  std_logic_VECTOR(2 downto 0);
          S : out std_logic);
end COMP_5;

architecture CKT of COMP_5 is


begin
  
S <= J(0) AND J(2);
  
  
end CKT;