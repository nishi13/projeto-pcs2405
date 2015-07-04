library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity Soma4 is
port(

in2 : in signed(31 downto 0);
sai : out signed(31 downto 0)
);
end Soma4;
architecture Soma4 of Soma4 is
begin
sai <= 100 + in2;
end Soma4;