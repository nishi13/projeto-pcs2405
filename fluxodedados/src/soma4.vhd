library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity Soma4 is
port(

entra : in std_logic_vector(31 downto 0);
sai : out std_logic_vector(31 downto 0)
);
end Soma4;
architecture Soma4 of Soma4 is
begin
sai <= std_logic_vector(unsigned(entra)+4);
end Soma4;