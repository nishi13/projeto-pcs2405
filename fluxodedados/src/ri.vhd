library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity RI is
port(
NPC : in signed(31 downto 0);
inst : in signed(31 downto 0);
ckri : in STD_LOGIC;
RIout : out signed(63 downto 0)
);
end RI;
architecture RI of RI is
begin
RIout(63 downto 32) <= inst when rising_edge(ckri);
RIout(31 downto 00) <= NPC when rising_edge(ckri);
end RI;