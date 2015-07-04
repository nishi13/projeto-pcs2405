library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity ICache is
port(
ckIC : in STD_LOGIC;
End1 : in signed(31 downto 0);
Dout : out signed(31 downto 0)
);
end ICache;
architecture ICache of ICache is
type mcache is array (0 to 255) of signed(31 downto 0);
signal icache: mcache;
begin
Dout <= icache(to_integer(End1)) when rising_edge(ckIC);
end ICache;