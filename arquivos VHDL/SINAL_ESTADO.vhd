library ieee;
use ieee.std_logic_1164.all;

entity SINAL_ESTADO is
   port (E: in  std_logic_vector(1 downto 0);
         setup,standby,teste,troco : out std_logic);
end SINAL_ESTADO;

architecture CKT of SINAL_ESTADO is



begin


SETUP  	<= 	(NOT E(0)) and (not E(1));
STANDBY  <= 	 E(0) and (not E(1));
TESTE		<= 	(NOT E(0)) and E(1);
TROCO		<= 	E(0) and E(1);
	
	
end CKT;