-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\fluxodedados\fluxodedados\compile\ex.vhd
-- Generated   : Mon Jun  1 21:34:45 2015
-- From        : C:\My_Designs\fluxodedados\fluxodedados\src\ex.bde
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
library BIBLIOTECA_DE_COMPONENTES;
library FEMTOMIPS2013;

entity EX is
  port(
       ckEX_M : in STD_LOGIC;
       ID_EXout : in STD_LOGIC_VECTOR(137 downto 0);
       cEXo : in STD_LOGIC_VECTOR(3 downto 0);
       cMo : in SIGNED(2 downto 0);
       cWBo : in SIGNED(1 downto 0);
       Zeroo : out STD_LOGIC;
       EX_Mo : out SIGNED(100 downto 0);
       cMo1 : out SIGNED(2 downto 0);
       cWBo1 : out SIGNED(1 downto 0)
  );
end EX;

architecture EX of EX is

use ieee.std_logic_arith.all;

---- Component declarations -----

component EX_M
  port (
       NPCJ : in SIGNED(31 downto 0);
       Reg : in SIGNED(31 downto 0);
       ULAo : in SIGNED(31 downto 0);
       Zero : in STD_LOGIC;
       cMo : in SIGNED(2 downto 0);
       cWBo : in SIGNED(1 downto 0);
       ckEX_M : in STD_LOGIC;
       endReg : in SIGNED(4 downto 0);
       EX_Mo : out SIGNED(100 downto 0);
       Zeroo : out STD_LOGIC;
       cMo1 : out SIGNED(2 downto 0);
       cWBo1 : out SIGNED(1 downto 0)
  );
end component;
component mux5bits
  generic(
       NumeroBits : INTEGER := 5;
       Tdata : TIME := 1 ns;
       Tsel : TIME := 2 ns
  );
  port (
       I0 : in STD_LOGIC_VECTOR(NumeroBits-1 downto 0);
       I1 : in STD_LOGIC_VECTOR(NumeroBits-1 downto 0);
       S : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR(NumeroBits-1 downto 0)
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
component ula
  generic(
       NB : integer := 8;
       Tgate : time := 1 ns;
       Tsom : time := 5 ns;
       Tsub : time := 5 ns;
       Ttrans : time := 5 ns
  );
  port (
       A : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       B : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       Veum : in STD_LOGIC;
       cUla : in STD_LOGIC_VECTOR(2 downto 0);
       C : out STD_LOGIC_VECTOR(NB - 1 downto 0);
       Sinal : out STD_LOGIC;
       Vaum : out STD_LOGIC;
       Zero : out STD_LOGIC
  );
end component;
component Controle_ULA
  port (
       In1 : in STD_LOGIC_VECTOR(5 downto 0);
       ulaop : in STD_LOGIC_VECTOR(1 downto 0);
       out1 : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
component SL2
  port (
       In1 : in STD_LOGIC_VECTOR(31 downto 0);
       Out1 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET1086 : STD_LOGIC;
signal NET1145 : STD_LOGIC;
signal BUS1109 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS253 : STD_LOGIC_VECTOR (7 downto 0);
signal endreg : STD_LOGIC_VECTOR (4 downto 0);
signal NPCJ : STD_LOGIC_VECTOR (31 downto 0);
signal ULAO : STD_LOGIC_VECTOR (31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

---- Declarations for Dangling outputs ----
signal DANGLING_U6_out1_1 : STD_LOGIC;
signal DANGLING_U6_out1_0 : STD_LOGIC;
signal DANGLING_U7_Out1_23 : STD_LOGIC;
signal DANGLING_U7_Out1_22 : STD_LOGIC;
signal DANGLING_U7_Out1_21 : STD_LOGIC;
signal DANGLING_U7_Out1_20 : STD_LOGIC;
signal DANGLING_U7_Out1_19 : STD_LOGIC;
signal DANGLING_U7_Out1_18 : STD_LOGIC;
signal DANGLING_U7_Out1_17 : STD_LOGIC;
signal DANGLING_U7_Out1_16 : STD_LOGIC;
signal DANGLING_U7_Out1_15 : STD_LOGIC;
signal DANGLING_U7_Out1_14 : STD_LOGIC;
signal DANGLING_U7_Out1_13 : STD_LOGIC;
signal DANGLING_U7_Out1_12 : STD_LOGIC;
signal DANGLING_U7_Out1_11 : STD_LOGIC;
signal DANGLING_U7_Out1_10 : STD_LOGIC;
signal DANGLING_U7_Out1_9 : STD_LOGIC;
signal DANGLING_U7_Out1_8 : STD_LOGIC;
signal DANGLING_U7_Out1_7 : STD_LOGIC;
signal DANGLING_U7_Out1_6 : STD_LOGIC;
signal DANGLING_U7_Out1_5 : STD_LOGIC;
signal DANGLING_U7_Out1_4 : STD_LOGIC;
signal DANGLING_U7_Out1_3 : STD_LOGIC;
signal DANGLING_U7_Out1_2 : STD_LOGIC;
signal DANGLING_U7_Out1_1 : STD_LOGIC;
signal DANGLING_U7_Out1_0 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : somador
  port map(
       A => ID_EXout( 137 downto 106 ),
       B => BUS1109( 7 downto 0 ),
       C => NPCJ( 31 downto 0 ),
       S => Dangling_Input_Signal,
       Vum => Dangling_Input_Signal
  );

U2 : mux5bits
  port map(
       I0 => ID_EXout( 9 downto 5 ),
       I1 => ID_EXout( 4 downto 0 ),
       O => endreg( 4 downto 0 ),
       S => cEXo(0)
  );

U4 : ula
  port map(
       A => ID_EXout( 105 downto 74 ),
       B => BUS253( 7 downto 0 ),
       cUla(0) => Dangling_Input_Signal,
       cUla(1) => Dangling_Input_Signal,
       cUla(2) => NET1086,
       Veum => Dangling_Input_Signal,
       Zero => NET1145,
       signed(C) => ULAO( 31 downto 0 )
  );

U5 : EX_M
  port map(
       EX_Mo => EX_Mo,
       NPCJ => signed(NPCJ( 31 downto 0 )),
       Reg => signed(ID_EXout( 73 downto 42 )),
       ULAo => signed(ULAO( 31 downto 0 )),
       Zero => NET1145,
       Zeroo => Zeroo,
       cMo => cMo,
       cMo1 => cMo1,
       cWBo => cWBo,
       cWBo1 => cWBo1,
       ckEX_M => ckEX_M,
       endReg => signed(endreg( 4 downto 0 ))
  );

U6 : Controle_ULA
  port map(
       In1(0) => ID_EXout(10),
       In1(1) => ID_EXout(11),
       In1(2) => ID_EXout(12),
       In1(3) => ID_EXout(13),
       In1(4) => ID_EXout(14),
       In1(5) => ID_EXout(15),
       out1(0) => DANGLING_U6_out1_0,
       out1(1) => DANGLING_U6_out1_1,
       out1(2) => NET1086,
       ulaop(0) => cEXo(1),
       ulaop(1) => cEXo(2)
  );

U7 : SL2
  port map(
       In1(0) => ID_EXout(10),
       In1(1) => ID_EXout(11),
       In1(2) => ID_EXout(12),
       In1(3) => ID_EXout(13),
       In1(4) => ID_EXout(14),
       In1(5) => ID_EXout(15),
       In1(6) => ID_EXout(16),
       In1(7) => ID_EXout(17),
       In1(8) => ID_EXout(18),
       In1(9) => ID_EXout(19),
       In1(10) => ID_EXout(20),
       In1(11) => ID_EXout(21),
       In1(12) => ID_EXout(22),
       In1(13) => ID_EXout(23),
       In1(14) => ID_EXout(24),
       In1(15) => ID_EXout(25),
       In1(16) => ID_EXout(26),
       In1(17) => ID_EXout(27),
       In1(18) => ID_EXout(28),
       In1(19) => ID_EXout(29),
       In1(20) => ID_EXout(30),
       In1(21) => ID_EXout(31),
       In1(22) => ID_EXout(32),
       In1(23) => ID_EXout(33),
       In1(24) => ID_EXout(34),
       In1(25) => ID_EXout(35),
       In1(26) => ID_EXout(36),
       In1(27) => ID_EXout(37),
       In1(28) => ID_EXout(38),
       In1(29) => ID_EXout(39),
       In1(30) => ID_EXout(40),
       In1(31) => ID_EXout(41),
       Out1(0) => DANGLING_U7_Out1_0,
       Out1(1) => DANGLING_U7_Out1_1,
       Out1(2) => DANGLING_U7_Out1_2,
       Out1(3) => DANGLING_U7_Out1_3,
       Out1(4) => DANGLING_U7_Out1_4,
       Out1(5) => DANGLING_U7_Out1_5,
       Out1(6) => DANGLING_U7_Out1_6,
       Out1(7) => DANGLING_U7_Out1_7,
       Out1(8) => DANGLING_U7_Out1_8,
       Out1(9) => DANGLING_U7_Out1_9,
       Out1(10) => DANGLING_U7_Out1_10,
       Out1(11) => DANGLING_U7_Out1_11,
       Out1(12) => DANGLING_U7_Out1_12,
       Out1(13) => DANGLING_U7_Out1_13,
       Out1(14) => DANGLING_U7_Out1_14,
       Out1(15) => DANGLING_U7_Out1_15,
       Out1(16) => DANGLING_U7_Out1_16,
       Out1(17) => DANGLING_U7_Out1_17,
       Out1(18) => DANGLING_U7_Out1_18,
       Out1(19) => DANGLING_U7_Out1_19,
       Out1(20) => DANGLING_U7_Out1_20,
       Out1(21) => DANGLING_U7_Out1_21,
       Out1(22) => DANGLING_U7_Out1_22,
       Out1(23) => DANGLING_U7_Out1_23,
       Out1(24) => BUS1109(0),
       Out1(25) => BUS1109(1),
       Out1(26) => BUS1109(2),
       Out1(27) => BUS1109(3),
       Out1(28) => BUS1109(4),
       Out1(29) => BUS1109(5),
       Out1(30) => BUS1109(6),
       Out1(31) => BUS1109(7)
  );

U8 : multiplexador
  port map(
       I0 => aldec_sig2slv(ID_EXout( 73 downto 42 )),
       I1 => ID_EXout( 41 downto 10 ),
       O => BUS253( 7 downto 0 ),
       S => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end EX;
