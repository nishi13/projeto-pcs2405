library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity UC1 is port(
contin : in signed(7 downto 0);
cWB : out signed(1 downto 0);
cM : out signed(2 downto 0);
cEX : out signed(3 downto 0)
);
end UC1;

architecture UC1 of UC1 is
begin
cWB(1 downto 0) <= contin(1 downto 0);
cM(2 downto 0) <= contin(2 downto 0);
cEX(3 downto 0) <= contin(3 downto 0);
end UC1;