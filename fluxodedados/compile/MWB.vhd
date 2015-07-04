-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\compile\MWB.vhd
-- Generated   : Sat Jul  4 12:15:49 2015
-- From        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\src\MWB.bde
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


entity DOPA is
  port(
       cWBo : in SIGNED(1 downto 0);
       ckM_WB : in STD_LOGIC;
       dmout : in SIGNED(31 downto 0);
       endw : in SIGNED(4 downto 0);
       regout : in SIGNED(31 downto 0);
       M_WBo : out SIGNED(68 downto 0);
       cWBo1 : out SIGNED(1 downto 0)
  );
end DOPA;

architecture DOPA of DOPA is

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

begin

----  Component instantiations  ----

U1 : M_WB
  port map(
       M_WBo => M_WBo,
       cWBo => cWBo,
       cWBo1 => cWBo1,
       ckM_WB => ckM_WB,
       dmout => dmout,
       endw => endw,
       regout => regout
  );


end DOPA;
