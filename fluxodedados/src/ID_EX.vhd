library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ID_EX is port(
cWB: in signed(1 downto 0);
cM : in signed(2 downto 0);
NPC : in signed(31 downto 0);
cEX: in signed(3 downto 0);
rega : in signed(31 downto 0);
regb : in signed(31 downto 0);
sext : in signed(31 downto 0);
r1 : in signed(4 downto 0);
rt : in signed(4 downto 0);
ckID_EX : in STD_LOGIC;
cWBo : out signed(1 downto 0);
cMo : out signed(2 downto 0);
cEXo : out signed(3 downto 0);
ID_EXout : out signed(137 downto 0)
);
end ID_EX;	

architecture ID_EX of ID_EX is
begin
ID_EXout(137 downto 133) <= rt when rising_edge(ckID_EX);
ID_EXout(132 downto 128) <= r1 when rising_edge(ckID_EX);
ID_EXout(127 downto 96) <= sext when rising_edge(ckID_EX);
ID_EXout(95 downto 64) <= regb when rising_edge(ckID_EX);
ID_EXout(63 downto 32) <= rega when rising_edge(ckID_EX);
ID_EXout(31 downto 0) <= NPC when rising_edge(ckID_EX);
cEXo(3 downto 0) <= cEX when rising_edge(ckID_EX);
cMo(2 downto 0) <= cM when rising_edge(ckID_EX);
cWBo(1 downto 0) <= cWB when rising_edge(ckID_EX);

end ID_EX;