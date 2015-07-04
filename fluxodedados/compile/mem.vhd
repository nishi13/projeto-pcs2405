-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\compile\mem.vhd
-- Generated   : Sat Jul  4 12:02:07 2015
-- From        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\src\mem.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity MEM is
  port(
       Zeroo : in STD_LOGIC;
       EX_Mo : in STD_LOGIC_VECTOR(100 downto 0);
       cMo : in STD_LOGIC_VECTOR(2 downto 0);
       cWBo : in STD_LOGIC_VECTOR(1 downto 0);
       pcsrc : out STD_LOGIC;
       M_WBo : out SIGNED(68 downto 0);
       NPCJ : out STD_LOGIC_VECTOR(31 downto 0);
       cWBo1 : out SIGNED(1 downto 0)
  );
end MEM;

architecture MEM of MEM is

---- Component declarations -----

component M_WB
  port (
       cWBo : in SIGNED(1 downto 0);
       ckM_WB : in STD_LOGIC;
       dmout : in SIGNED(31 downto 0);
       endw : in SIGNED(4 downto 0);
       regout : in SIGNED(31 downto 0);
       M_WBo : out SIGNED(68 downto 0);
       cWBo1 : out SIGNED(1 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;
signal Dangling_Input_Signal_SIGNED : SIGNED;

begin

----  Component instantiations  ----

pcsrc <= Zeroo and cMo(0);

U2 : M_WB
  port map(
       cWBo(0) => Dangling_Input_Signal_SIGNED,
       cWBo(1) => Dangling_Input_Signal_SIGNED,
       dmout(0) => Dangling_Input_Signal_SIGNED,
       dmout(1) => Dangling_Input_Signal_SIGNED,
       dmout(2) => Dangling_Input_Signal_SIGNED,
       dmout(3) => Dangling_Input_Signal_SIGNED,
       dmout(4) => Dangling_Input_Signal_SIGNED,
       dmout(5) => Dangling_Input_Signal_SIGNED,
       dmout(6) => Dangling_Input_Signal_SIGNED,
       dmout(7) => Dangling_Input_Signal_SIGNED,
       dmout(8) => Dangling_Input_Signal_SIGNED,
       dmout(9) => Dangling_Input_Signal_SIGNED,
       dmout(10) => Dangling_Input_Signal_SIGNED,
       dmout(11) => Dangling_Input_Signal_SIGNED,
       dmout(12) => Dangling_Input_Signal_SIGNED,
       dmout(13) => Dangling_Input_Signal_SIGNED,
       dmout(14) => Dangling_Input_Signal_SIGNED,
       dmout(15) => Dangling_Input_Signal_SIGNED,
       dmout(16) => Dangling_Input_Signal_SIGNED,
       dmout(17) => Dangling_Input_Signal_SIGNED,
       dmout(18) => Dangling_Input_Signal_SIGNED,
       dmout(19) => Dangling_Input_Signal_SIGNED,
       dmout(20) => Dangling_Input_Signal_SIGNED,
       dmout(21) => Dangling_Input_Signal_SIGNED,
       dmout(22) => Dangling_Input_Signal_SIGNED,
       dmout(23) => Dangling_Input_Signal_SIGNED,
       dmout(24) => Dangling_Input_Signal_SIGNED,
       dmout(25) => Dangling_Input_Signal_SIGNED,
       dmout(26) => Dangling_Input_Signal_SIGNED,
       dmout(27) => Dangling_Input_Signal_SIGNED,
       dmout(28) => Dangling_Input_Signal_SIGNED,
       dmout(29) => Dangling_Input_Signal_SIGNED,
       dmout(30) => Dangling_Input_Signal_SIGNED,
       dmout(31) => Dangling_Input_Signal_SIGNED,
       endw(0) => Dangling_Input_Signal_SIGNED,
       endw(1) => Dangling_Input_Signal_SIGNED,
       endw(2) => Dangling_Input_Signal_SIGNED,
       endw(3) => Dangling_Input_Signal_SIGNED,
       endw(4) => Dangling_Input_Signal_SIGNED,
       M_WBo => M_WBo,
       regout(0) => Dangling_Input_Signal_SIGNED,
       regout(1) => Dangling_Input_Signal_SIGNED,
       regout(2) => Dangling_Input_Signal_SIGNED,
       regout(3) => Dangling_Input_Signal_SIGNED,
       regout(4) => Dangling_Input_Signal_SIGNED,
       regout(5) => Dangling_Input_Signal_SIGNED,
       regout(6) => Dangling_Input_Signal_SIGNED,
       regout(7) => Dangling_Input_Signal_SIGNED,
       regout(8) => Dangling_Input_Signal_SIGNED,
       regout(9) => Dangling_Input_Signal_SIGNED,
       regout(10) => Dangling_Input_Signal_SIGNED,
       regout(11) => Dangling_Input_Signal_SIGNED,
       regout(12) => Dangling_Input_Signal_SIGNED,
       regout(13) => Dangling_Input_Signal_SIGNED,
       regout(14) => Dangling_Input_Signal_SIGNED,
       regout(15) => Dangling_Input_Signal_SIGNED,
       regout(16) => Dangling_Input_Signal_SIGNED,
       regout(17) => Dangling_Input_Signal_SIGNED,
       regout(18) => Dangling_Input_Signal_SIGNED,
       regout(19) => Dangling_Input_Signal_SIGNED,
       regout(20) => Dangling_Input_Signal_SIGNED,
       regout(21) => Dangling_Input_Signal_SIGNED,
       regout(22) => Dangling_Input_Signal_SIGNED,
       regout(23) => Dangling_Input_Signal_SIGNED,
       regout(24) => Dangling_Input_Signal_SIGNED,
       regout(25) => Dangling_Input_Signal_SIGNED,
       regout(26) => Dangling_Input_Signal_SIGNED,
       regout(27) => Dangling_Input_Signal_SIGNED,
       regout(28) => Dangling_Input_Signal_SIGNED,
       regout(29) => Dangling_Input_Signal_SIGNED,
       regout(30) => Dangling_Input_Signal_SIGNED,
       regout(31) => Dangling_Input_Signal_SIGNED,
       cWBo1 => cWBo1,
       ckM_WB => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end MEM;
