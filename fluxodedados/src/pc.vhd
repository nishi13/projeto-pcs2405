library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity PC is
port(
cPC : in STD_LOGIC;
PCin : in signed(31 downto 0);
PCout : out signed(31 downto 0)
);
end PC;
architecture PC of PC is
begin
PCout <= PCin when (rising_edge(cPC));
end PC;