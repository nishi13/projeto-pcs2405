-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Luis Higa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\compile\id.vhd
-- Generated   : Sat Jul  4 12:02:10 2015
-- From        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\src\id.bde
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
use IEEE.numeric_std.all;

-- other libraries declarations
library BIBLIOTECA_DE_COMPONENTES;

entity ID is
  port(
       ClkGREG : in STD_LOGIC;
       cklID_EX : in STD_LOGIC;
       rw : in STD_LOGIC;
       RIout : in STD_LOGIC_VECTOR(63 downto 0);
       dataw : in STD_LOGIC_VECTOR(31 downto 0);
       enderw : in STD_LOGIC_VECTOR(4 downto 0);
       ID_EXout : out SIGNED(137 downto 0);
       cEXo : out SIGNED(3 downto 0);
       cMo : out SIGNED(2 downto 0);
       cWBo : out SIGNED(1 downto 0)
  );
end ID;

architecture ID of ID is

use ieee.std_logic_arith.all;


---- Component declarations -----

component GREG
  port (
       DataW : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       endA : in STD_LOGIC_VECTOR(4 downto 0);
       endB : in STD_LOGIC_VECTOR(4 downto 0);
       endW : in STD_LOGIC_VECTOR(4 downto 0);
       rw : in STD_LOGIC;
       dataA : out STD_LOGIC_VECTOR(31 downto 0);
       dataB : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component ID_EX
  port (
       NPC : in SIGNED(31 downto 0);
       cEX : in SIGNED(3 downto 0);
       cM : in SIGNED(2 downto 0);
       cWB : in SIGNED(1 downto 0);
       ckID_EX : in STD_LOGIC;
       r1 : in SIGNED(4 downto 0);
       rega : in SIGNED(31 downto 0);
       regb : in SIGNED(31 downto 0);
       rt : in SIGNED(4 downto 0);
       sext : in SIGNED(31 downto 0);
       ID_EXout : out SIGNED(137 downto 0);
       cEXo : out SIGNED(3 downto 0);
       cMo : out SIGNED(2 downto 0);
       cWBo : out SIGNED(1 downto 0)
  );
end component;
component UC1
  port (
       contin : in SIGNED(7 downto 0);
       cEX : out SIGNED(3 downto 0);
       cM : out SIGNED(2 downto 0);
       cWB : out SIGNED(1 downto 0)
  );
end component;
component xsign
  generic(
       NBE : integer := 8;
       NBS : integer := 16
  );
  port (
       I : in STD_LOGIC_VECTOR(NBE - 1 downto 0);
       O : out STD_LOGIC_VECTOR(NBS - 1 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS1768 : SIGNED (3 downto 0);
signal BUS1770 : SIGNED (1 downto 0);
signal BUS1771 : SIGNED (2 downto 0);
signal dataA : STD_LOGIC_VECTOR (31 downto 0);
signal dataB : STD_LOGIC_VECTOR (31 downto 0);
signal out1o : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : GREG
  port map(
       DataW => dataw,
       endA(0) => RIout(53),
       endA(1) => RIout(54),
       endA(2) => RIout(55),
       endA(3) => RIout(56),
       endA(4) => RIout(57),
       endB(0) => RIout(48),
       endB(1) => RIout(49),
       endB(2) => RIout(50),
       endB(3) => RIout(51),
       endB(4) => RIout(52),
       clk => ClkGREG,
       endW => enderw,
       rw => rw,
       signed(dataA) => dataA( 31 downto 0 ),
       signed(dataB) => dataB( 31 downto 0 )
  );

U3 : UC1
  port map(
       cEX => BUS1768,
       cM => BUS1771,
       cWB => BUS1770,
       contin => signed(RIout( 63 downto 56 ))
  );

U4 : ID_EX
  port map(
       NPC => signed(RIout( 31 downto 0 )),
       aldec_sig2slv(ID_EXout) => ID_EXout( 137 downto 0 ),
       aldec_sig2slv(cEXo) => cEXo( 3 downto 0 ),
       aldec_sig2slv(cMo) => cMo( 2 downto 0 ),
       aldec_sig2slv(cWBo) => cWBo( 1 downto 0 ),
       cEX => BUS1768,
       cM => BUS1771,
       cWB => BUS1770,
       ckID_EX => cklID_EX,
       r1 => signed(RIout( 52 downto 48 )),
       rega => signed(dataA( 31 downto 0 )),
       regb => signed(dataB( 31 downto 0 )),
       rt => signed(RIout( 47 downto 43 )),
       sext => signed(out1o( 31 downto 0 ))
  );

U5 : xsign
  port map(
       I => RIout( 47 downto 32 ),
       O => out1o( 31 downto 0 )
  );


end ID;
