-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Luis Higa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\compile\if.vhd
-- Generated   : Sat Jul  4 12:02:11 2015
-- From        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\src\if.bde
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

entity \IF\ is
  port(
       cPC : in STD_LOGIC;
       ckri : in STD_LOGIC;
       pcsrc : in STD_LOGIC;
       NPCJ : in SIGNED(31 downto 0);
       inst : in STD_LOGIC_VECTOR(31 downto 0);
       PCout : out STD_LOGIC_VECTOR(31 downto 0);
       RIout : out SIGNED(63 downto 0)
  );
end \IF\;

architecture \IF\ of \IF\ is

---- Component declarations -----

component Mxpc
  port (
       in1 : in SIGNED(31 downto 0);
       in2 : in SIGNED(31 downto 0);
       spc : in STD_LOGIC;
       out3 : out SIGNED(31 downto 0)
  );
end component;
component PC
  port (
       PCin : in SIGNED(31 downto 0);
       cPC : in STD_LOGIC;
       PCout : out SIGNED(31 downto 0)
  );
end component;
component RI
  port (
       NPC : in SIGNED(31 downto 0);
       ckri : in STD_LOGIC;
       inst : in SIGNED(31 downto 0);
       RIout : out SIGNED(63 downto 0)
  );
end component;
component Soma4
  port (
       in2 : in SIGNED(31 downto 0);
       sai : out SIGNED(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal Instrucao : SIGNED (31 downto 0);
signal newpc : SIGNED (31 downto 0);
signal NPC : SIGNED (31 downto 0);
signal PCa : SIGNED (31 downto 0);

begin

----  Component instantiations  ----

U1 : PC
  port map(
       PCin => newpc,
       PCout => PCa,
       cPC => cPC
  );

U2 : RI
  port map(
       NPC => NPC,
       RIout => RIout,
       ckri => ckri,
       inst => Instrucao
  );

U3 : Soma4
  port map(
       in2 => PCa,
       sai => NPC
  );

U5 : Mxpc
  port map(
       in1 => NPC,
       in2 => NPCJ,
       out3 => newpc,
       spc => pcsrc
  );


---- Terminal assignment ----

    -- Inputs terminals
	Instrucao <= inst;

    -- Output\buffer terminals
	PCout <= PCa;


end \IF\;
