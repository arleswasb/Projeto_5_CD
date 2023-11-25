library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1x6 is -- entrada de valor teste para saida por moeda
   Port (ENT: in std_logic;
			sel:  in std_logic_vector(2 downto 0);
         S: out std_logic_vector(5 downto 0));
end Demux_1x6;

architecture ckt of Demux_1x6 is


begin

S(0) <= ( (not sel(2) and (not sel(1) and not sel(0))) and ENT );

S(1) <= ( (not sel(2) and (not sel(1) and sel(0))) and ENT );

S(2) <= ( (not sel(2) and (sel(1) and not sel(0))) and ENT );

S(3) <= ( (not sel(2) and ( sel(1) and sel(0))) and ENT );

S(4) <= ( (sel(2) and (not sel(1) and not sel(0))) and ENT );

S(5) <= ( (sel(2) and (not sel(1) and sel(0))) and ENT );

--S(6) <= ( (sel(2) and ( sel(1) and not sel(0))) and ENT );



end ckt;

