library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity EX_M is port(
cWBo: in signed(1 downto 0);
cMo : in signed(2 downto 0);
NPCJ : in signed(31 downto 0);
Zero : in STD_LOGIC;
ULAo : in signed(31 downto 0);
Reg : in signed(31 downto 0);
endReg : in signed(4 downto 0);
ckEX_M : in STD_LOGIC;
cWBo1 : out signed(1 downto 0);
cMo1 : out signed(2 downto 0);
Zeroo : out STD_LOGIC;
EX_Mo : out signed(100 downto 0)
);
end EX_M;	

architecture EX_M of EX_M is
begin
EX_Mo(100 downto 96) <= EndReg when rising_edge(ckEX_M);
EX_Mo(95 downto 64) <= Reg when rising_edge(ckEX_M);	   s
EX_Mo(63 downto 32) <= ULAo when rising_edge(ckEX_M);
EX_Mo(31 downto 0) <= NPCj when rising_edge(ckEX_M);
EX_Mo(100 downto 96) <= EndReg when rising_edge(ckEX_M);
Zeroo <= Zero when rising_edge(ckEX_M);
cMo1(2 downto 0) <= cMO when rising_edge(ckEX_M);
cWBo1(1 downto 0) <= cWBO when rising_edge(ckEX_M);

end EX_M;