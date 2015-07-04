-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\fluxodedados\fluxodedados\compile\ex2.vhd
-- Generated   : Mon Jun  1 21:18:07 2015
-- From        : C:\My_Designs\fluxodedados\fluxodedados\src\ex2.bde
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


-- other libraries declarations
library biblioteca_de_componentes;
library FEMTOMIPS2013;

entity ex2 is
  port(
       clkEX_M : in STD_LOGIC;
       FEX : in STD_LOGIC_VECTOR(31 downto 0);
       FWB : in STD_LOGIC_VECTOR(31 downto 0);
       ForwardA : in STD_LOGIC_VECTOR(1 downto 0);
       ForwardB : in STD_LOGIC_VECTOR(1 downto 0);
       ID_EXout : in STD_LOGIC_VECTOR(137 downto 0);
       PCin : in STD_LOGIC_VECTOR(31 downto 0);
       cEXo : in STD_LOGIC_VECTOR(3 downto 0);
       cMo : in STD_LOGIC_VECTOR(2 downto 0);
       cWBo : in STD_LOGIC_VECTOR(2 downto 0);
       zeroOut : out STD_LOGIC;
       EX_Mout : out STD_LOGIC_VECTOR(100 downto 0);
       PCout : out STD_LOGIC_VECTOR(31 downto 0);
       cMoOut : out STD_LOGIC_VECTOR(2 downto 0);
       cWBoOut : out STD_LOGIC_VECTOR(2 downto 0)
  );
end ex2;

architecture ex2 of ex2 is

---- Component declarations -----

component Controle_ULA
  port (
       In1 : in STD_LOGIC_VECTOR(5 downto 0);
       ulaop : in STD_LOGIC_VECTOR(1 downto 0);
       out1 : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
component EX_M
  port (
       NPCJ : in STD_LOGIC_VECTOR(31 downto 0);
       PCin : in STD_LOGIC_VECTOR(31 downto 0);
       Reg : in STD_LOGIC_VECTOR(31 downto 0);
       ULAout : in STD_LOGIC_VECTOR(31 downto 0);
       cMo : in STD_LOGIC_VECTOR(2 downto 0);
       cWBo : in STD_LOGIC_VECTOR(2 downto 0);
       clkEX_M : in STD_LOGIC;
       endreg : in STD_LOGIC_VECTOR(4 downto 0);
       zero : in STD_LOGIC;
       EX_Mout : out STD_LOGIC_VECTOR(100 downto 0);
       PCout : out STD_LOGIC_VECTOR(31 downto 0);
       cMoOut : out STD_LOGIC_VECTOR(2 downto 0);
       cWBoOut : out STD_LOGIC_VECTOR(2 downto 0);
       zeroOut : out STD_LOGIC
  );
end component;
component SL2
  port (
       In1 : in STD_LOGIC_VECTOR(31 downto 0);
       Out1 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component ULA
  port (
       In1 : in STD_LOGIC_VECTOR(31 downto 0);
       In2 : in STD_LOGIC_VECTOR(31 downto 0);
       controle : in STD_LOGIC_VECTOR(2 downto 0);
       Out1 : out STD_LOGIC_VECTOR(31 downto 0);
       zero : out STD_LOGIC
  );
end component;
component multiplexador
  generic(
       NumeroBits : integer := 8;
       Tdata : time := 1 ns;
       Tsel : time := 2 ns
  );
  port (
       I0 : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       I1 : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       S : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end component;
component mux4x1
  generic(
       NB : integer := 32;
       Tdata : time := 2 ns;
       Tsel : time := 3 ns
  );
  port (
       I0 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I1 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I2 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I3 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       Sel : in STD_LOGIC_VECTOR(1 downto 0);
       O : out STD_LOGIC_VECTOR(NB - 1 downto 0)
  );
end component;
component somador
  generic(
       NumeroBits : integer := 8;
       Tinc : time := 2 ns;
       Tsoma : time := 3 ns
  );
  port (
       A : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       B : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       S : in STD_LOGIC;
       Vum : in STD_LOGIC;
       C : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end component;

----     Constants     -----
constant VCC_CONSTANT   : STD_LOGIC := '1';
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal NET319 : STD_LOGIC;
signal NET89 : STD_LOGIC;
signal VCC : STD_LOGIC;
signal BUS70 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS85 : STD_LOGIC_VECTOR (2 downto 0);
signal gndu8 : STD_LOGIC_VECTOR (31 downto 0);
signal gndu9 : STD_LOGIC_VECTOR (31 downto 0);
signal Mux : STD_LOGIC_VECTOR (4 downto 0);
signal Mux1 : STD_LOGIC_VECTOR (31 downto 0);
signal mux8out : STD_LOGIC_VECTOR (31 downto 0);
signal U3out : STD_LOGIC_VECTOR (31 downto 0);
signal U6out : STD_LOGIC_VECTOR (31 downto 0);
signal u9out : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : multiplexador
  generic map (
       Tdata => 1 ns,
       Tsel => 2 ns,
       NumeroBits => 32
  )
  port map(
       I0 => ID_Exout( 127 downto 96 ),
       I1 => mux8out( 31 downto 0 ),
       O => Mux1( 31 downto 0 ),
       S => NET319
  );

NET319 <= not(cEXo(0));

U2 : multiplexador
  generic map (
       Tdata => 1 ns,
       Tsel => 2 ns,
       NumeroBits => 5
  )
  port map(
       I0 => ID_Exout( 132 downto 128 ),
       I1 => ID_Exout( 137 downto 133 ),
       O => Mux( 4 downto 0 ),
       S => cEXo(3)
  );

U3 : SL2
  port map(
       In1(0) => ID_Exout(96),
       In1(1) => ID_Exout(97),
       In1(2) => ID_Exout(98),
       In1(3) => ID_Exout(99),
       In1(4) => ID_Exout(100),
       In1(5) => ID_Exout(101),
       In1(6) => ID_Exout(102),
       In1(7) => ID_Exout(103),
       In1(8) => ID_Exout(104),
       In1(9) => ID_Exout(105),
       In1(10) => ID_Exout(106),
       In1(11) => ID_Exout(107),
       In1(12) => ID_Exout(108),
       In1(13) => ID_Exout(109),
       In1(14) => ID_Exout(110),
       In1(15) => ID_Exout(111),
       In1(16) => ID_Exout(112),
       In1(17) => ID_Exout(113),
       In1(18) => ID_Exout(114),
       In1(19) => ID_Exout(115),
       In1(20) => ID_Exout(116),
       In1(21) => ID_Exout(117),
       In1(22) => ID_Exout(118),
       In1(23) => ID_Exout(119),
       In1(24) => ID_Exout(120),
       In1(25) => ID_Exout(121),
       In1(26) => ID_Exout(122),
       In1(27) => ID_Exout(123),
       In1(28) => ID_Exout(124),
       In1(29) => ID_Exout(125),
       In1(30) => ID_Exout(126),
       In1(31) => ID_Exout(127),
       Out1 => U3out
  );

U4 : ULA
  port map(
       In1 => u9out,
       In2 => Mux1,
       Out1 => BUS70,
       controle => BUS85,
       zero => NET89
  );

U5 : Controle_ULA
  port map(
       In1(0) => ID_Exout(122),
       In1(1) => ID_Exout(123),
       In1(2) => ID_Exout(124),
       In1(3) => ID_Exout(125),
       In1(4) => ID_Exout(126),
       In1(5) => ID_Exout(127),
       ulaop(0) => cEXo(1),
       ulaop(1) => cEXo(2),
       out1 => BUS85
  );

U6 : somador
  generic map (
       NumeroBits => 32,
       Tinc => 2 ns,
       Tsoma => 3 ns
  )
  port map(
       A => ID_Exout( 31 downto 0 ),
       B => U3out( 31 downto 0 ),
       C => U6out( 31 downto 0 ),
       S => VCC,
       Vum => GND
  );

U7 : EX_M
  port map(
       EX_Mout => EX_Mout,
       NPCJ => U6out,
       PCin => PCin,
       PCout => PCout,
       Reg(0) => ID_Exout(64),
       Reg(1) => ID_Exout(65),
       Reg(2) => ID_Exout(66),
       Reg(3) => ID_Exout(67),
       Reg(4) => ID_Exout(68),
       Reg(5) => ID_Exout(69),
       Reg(6) => ID_Exout(70),
       Reg(7) => ID_Exout(71),
       Reg(8) => ID_Exout(72),
       Reg(9) => ID_Exout(73),
       Reg(10) => ID_Exout(74),
       Reg(11) => ID_Exout(75),
       Reg(12) => ID_Exout(76),
       Reg(13) => ID_Exout(77),
       Reg(14) => ID_Exout(78),
       Reg(15) => ID_Exout(79),
       Reg(16) => ID_Exout(80),
       Reg(17) => ID_Exout(81),
       Reg(18) => ID_Exout(82),
       Reg(19) => ID_Exout(83),
       Reg(20) => ID_Exout(84),
       Reg(21) => ID_Exout(85),
       Reg(22) => ID_Exout(86),
       Reg(23) => ID_Exout(87),
       Reg(24) => ID_Exout(88),
       Reg(25) => ID_Exout(89),
       Reg(26) => ID_Exout(90),
       Reg(27) => ID_Exout(91),
       Reg(28) => ID_Exout(92),
       Reg(29) => ID_Exout(93),
       Reg(30) => ID_Exout(94),
       Reg(31) => ID_Exout(95),
       ULAout => BUS70,
       cMo => cMo,
       cMoOut => cMoOut,
       cWBo => cWBo,
       cWBoOut => cWBoOut,
       clkEX_M => clkEX_M,
       endreg => Mux,
       zero => NET89,
       zeroOut => zeroOut
  );

U8 : mux4x1
  generic map (
       NB => 32,
       Tdata => 2 ns,
       Tsel => 3 ns
  )
  port map(
       I0 => ID_Exout( 95 downto 64 ),
       I1 => FEX( 31 downto 0 ),
       I2 => FWB( 31 downto 0 ),
       I3 => gndu8( 31 downto 0 ),
       O => mux8out( 31 downto 0 ),
       Sel => ForwardB
  );

U9 : mux4x1
  port map(
       I0 => ID_EXout( 63 downto 32 ),
       I1 => FEX( 31 downto 0 ),
       I2 => FWB( 31 downto 0 ),
       I3 => gndu9( 31 downto 0 ),
       O => u9out( 31 downto 0 ),
       Sel => ForwardA
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;
VCC <= VCC_CONSTANT;
gndu8(31) <= GND;
gndu8(30) <= GND;
gndu8(29) <= GND;
gndu8(28) <= GND;
gndu8(27) <= GND;
gndu8(26) <= GND;
gndu8(25) <= GND;
gndu8(24) <= GND;
gndu8(23) <= GND;
gndu8(22) <= GND;
gndu8(21) <= GND;
gndu8(20) <= GND;
gndu8(19) <= GND;
gndu8(18) <= GND;
gndu8(17) <= GND;
gndu8(16) <= GND;
gndu8(15) <= GND;
gndu8(14) <= GND;
gndu8(13) <= GND;
gndu8(12) <= GND;
gndu8(11) <= GND;
gndu8(10) <= GND;
gndu8(9) <= GND;
gndu8(8) <= GND;
gndu8(7) <= GND;
gndu8(6) <= GND;
gndu8(5) <= GND;
gndu8(4) <= GND;
gndu8(3) <= GND;
gndu8(2) <= GND;
gndu8(1) <= GND;
gndu8(0) <= GND;
gndu9(31) <= GND;
gndu9(30) <= GND;
gndu9(29) <= GND;
gndu9(28) <= GND;
gndu9(27) <= GND;
gndu9(26) <= GND;
gndu9(25) <= GND;
gndu9(24) <= GND;
gndu9(23) <= GND;
gndu9(22) <= GND;
gndu9(21) <= GND;
gndu9(20) <= GND;
gndu9(19) <= GND;
gndu9(18) <= GND;
gndu9(17) <= GND;
gndu9(16) <= GND;
gndu9(15) <= GND;
gndu9(14) <= GND;
gndu9(13) <= GND;
gndu9(12) <= GND;
gndu9(11) <= GND;
gndu9(10) <= GND;
gndu9(9) <= GND;
gndu9(8) <= GND;
gndu9(7) <= GND;
gndu9(6) <= GND;
gndu9(5) <= GND;
gndu9(4) <= GND;
gndu9(3) <= GND;
gndu9(2) <= GND;
gndu9(1) <= GND;
gndu9(0) <= GND;

end ex2;
