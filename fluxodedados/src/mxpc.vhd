library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity Mxpc is
port(
spc : in STD_LOGIC;
in1 : in signed(31 downto 0);
in2 : in signed(31 downto 0);
out3 : out signed(31 downto 0)
);
end Mxpc;
architecture Mxpc of Mxpc is
begin
out3 <= in1 when spc = '0' else in2;
end Mxpc;