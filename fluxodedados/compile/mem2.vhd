-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : F:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\compile\mem2.vhd
-- Generated   : Sat Jul  4 15:07:22 2015
-- From        : F:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\src\mem2.bde
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


entity mem2 is
  port(
       Zero : in STD_LOGIC;
       ckM_WB : in STD_LOGIC;
       EX_Mo : in STD_LOGIC_VECTOR(100 downto 0);
       cMo : in STD_LOGIC_VECTOR(2 downto 0);
       cWBc : in SIGNED(1 downto 0);
       pcsrc : out STD_LOGIC;
       M_WBo : out SIGNED(68 downto 0);
       NPCJ : out STD_LOGIC_VECTOR(31 downto 0);
       cWBo : out SIGNED(1 downto 0)
  );
end mem2;

architecture mem2 of mem2 is

use ieee.std_logic_arith.all;

---- Component declarations -----

component DMEM
  port (
       dataw : in STD_LOGIC_VECTOR(31 downto 0);
       endr : in STD_LOGIC_VECTOR(31 downto 0);
       endw : in STD_LOGIC_VECTOR(31 downto 0);
       memread : in STD_LOGIC;
       memwrite : in STD_LOGIC;
       datao : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component M_WB3
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

---- Signal declarations used on the diagram ----

signal BUS450 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : DMEM
  port map(
       dataw(0) => EX_Mo(64),
       dataw(1) => EX_Mo(65),
       dataw(2) => EX_Mo(66),
       dataw(3) => EX_Mo(67),
       dataw(4) => EX_Mo(68),
       dataw(5) => EX_Mo(69),
       dataw(6) => EX_Mo(70),
       dataw(7) => EX_Mo(71),
       dataw(8) => EX_Mo(72),
       dataw(9) => EX_Mo(73),
       dataw(10) => EX_Mo(74),
       dataw(11) => EX_Mo(75),
       dataw(12) => EX_Mo(76),
       dataw(13) => EX_Mo(77),
       dataw(14) => EX_Mo(78),
       dataw(15) => EX_Mo(79),
       dataw(16) => EX_Mo(80),
       dataw(17) => EX_Mo(81),
       dataw(18) => EX_Mo(82),
       dataw(19) => EX_Mo(83),
       dataw(20) => EX_Mo(84),
       dataw(21) => EX_Mo(85),
       dataw(22) => EX_Mo(86),
       dataw(23) => EX_Mo(87),
       dataw(24) => EX_Mo(88),
       dataw(25) => EX_Mo(89),
       dataw(26) => EX_Mo(90),
       dataw(27) => EX_Mo(91),
       dataw(28) => EX_Mo(92),
       dataw(29) => EX_Mo(93),
       dataw(30) => EX_Mo(94),
       dataw(31) => EX_Mo(95),
       endr(0) => Ex_Mo(32),
       endr(1) => Ex_Mo(33),
       endr(2) => Ex_Mo(34),
       endr(3) => Ex_Mo(35),
       endr(4) => Ex_Mo(36),
       endr(5) => Ex_Mo(37),
       endr(6) => Ex_Mo(38),
       endr(7) => Ex_Mo(39),
       endr(8) => Ex_Mo(40),
       endr(9) => Ex_Mo(41),
       endr(10) => Ex_Mo(42),
       endr(11) => Ex_Mo(43),
       endr(12) => Ex_Mo(44),
       endr(13) => Ex_Mo(45),
       endr(14) => Ex_Mo(46),
       endr(15) => Ex_Mo(47),
       endr(16) => Ex_Mo(48),
       endr(17) => Ex_Mo(49),
       endr(18) => Ex_Mo(50),
       endr(19) => Ex_Mo(51),
       endr(20) => Ex_Mo(52),
       endr(21) => Ex_Mo(53),
       endr(22) => Ex_Mo(54),
       endr(23) => Ex_Mo(55),
       endr(24) => Ex_Mo(56),
       endr(25) => Ex_Mo(57),
       endr(26) => Ex_Mo(58),
       endr(27) => Ex_Mo(59),
       endr(28) => Ex_Mo(60),
       endr(29) => Ex_Mo(61),
       endr(30) => Ex_Mo(62),
       endr(31) => Ex_Mo(63),
       endw(0) => Ex_Mo(32),
       endw(1) => Ex_Mo(33),
       endw(2) => Ex_Mo(34),
       endw(3) => Ex_Mo(35),
       endw(4) => Ex_Mo(36),
       endw(5) => Ex_Mo(37),
       endw(6) => Ex_Mo(38),
       endw(7) => Ex_Mo(39),
       endw(8) => Ex_Mo(40),
       endw(9) => Ex_Mo(41),
       endw(10) => Ex_Mo(42),
       endw(11) => Ex_Mo(43),
       endw(12) => Ex_Mo(44),
       endw(13) => Ex_Mo(45),
       endw(14) => Ex_Mo(46),
       endw(15) => Ex_Mo(47),
       endw(16) => Ex_Mo(48),
       endw(17) => Ex_Mo(49),
       endw(18) => Ex_Mo(50),
       endw(19) => Ex_Mo(51),
       endw(20) => Ex_Mo(52),
       endw(21) => Ex_Mo(53),
       endw(22) => Ex_Mo(54),
       endw(23) => Ex_Mo(55),
       endw(24) => Ex_Mo(56),
       endw(25) => Ex_Mo(57),
       endw(26) => Ex_Mo(58),
       endw(27) => Ex_Mo(59),
       endw(28) => Ex_Mo(60),
       endw(29) => Ex_Mo(61),
       endw(30) => Ex_Mo(62),
       endw(31) => Ex_Mo(63),
       datao => BUS450,
       memread => cMO(1),
       memwrite => cMO(2)
  );

U2 : M_WB3
  port map(
       M_WBo => M_WBo,
       cWBo => cWBc,
       cWBo1 => cWBo,
       ckM_WB => ckM_WB,
       dmout => signed(BUS450( 31 downto 0 )),
       endw => signed(Ex_Mo( 100 downto 96 )),
       regout => signed(Ex_Mo( 95 downto 64 ))
  );

pcsrc <= Zero and cMo(0);


---- Terminal assignment ----

    -- Output\buffer terminals
	NPCJ(0) <= EX_Mo(0);
	NPCJ(1) <= EX_Mo(1);
	NPCJ(10) <= EX_Mo(10);
	NPCJ(11) <= EX_Mo(11);
	NPCJ(12) <= EX_Mo(12);
	NPCJ(13) <= EX_Mo(13);
	NPCJ(14) <= EX_Mo(14);
	NPCJ(15) <= EX_Mo(15);
	NPCJ(16) <= EX_Mo(16);
	NPCJ(17) <= EX_Mo(17);
	NPCJ(18) <= EX_Mo(18);
	NPCJ(19) <= EX_Mo(19);
	NPCJ(2) <= EX_Mo(2);
	NPCJ(20) <= EX_Mo(20);
	NPCJ(21) <= EX_Mo(21);
	NPCJ(22) <= EX_Mo(22);
	NPCJ(23) <= EX_Mo(23);
	NPCJ(24) <= EX_Mo(24);
	NPCJ(25) <= EX_Mo(25);
	NPCJ(26) <= EX_Mo(26);
	NPCJ(27) <= EX_Mo(27);
	NPCJ(28) <= EX_Mo(28);
	NPCJ(29) <= EX_Mo(29);
	NPCJ(3) <= EX_Mo(3);
	NPCJ(30) <= EX_Mo(30);
	NPCJ(31) <= EX_Mo(31);
	NPCJ(4) <= EX_Mo(4);
	NPCJ(5) <= EX_Mo(5);
	NPCJ(6) <= EX_Mo(6);
	NPCJ(7) <= EX_Mo(7);
	NPCJ(8) <= EX_Mo(8);
	NPCJ(9) <= EX_Mo(9);


end mem2;
