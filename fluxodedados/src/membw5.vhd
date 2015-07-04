library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity M_WB3 is port(
cWBo: in signed(1 downto 0);
dmout : in signed(31 downto 0);
regout : in signed(31 downto 0);
endw : in signed(4 downto 0);
ckM_WB : in STD_LOGIC;
cWBo1 : out signed(1 downto 0);
M_WBo : out signed(68 downto 0)
);
end M_WB3;

architecture M_WB of M_WB3 is
begin
M_WBo(68 downto 64) <= endw when rising_edge(ckM_WB);
M_WBo(63 downto 32) <= regout when rising_edge(ckM_WB);
M_WBo(31 downto 0) <= dmout when rising_edge(ckM_WB);

end M_WB;