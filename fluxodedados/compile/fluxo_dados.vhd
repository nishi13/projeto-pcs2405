-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Luis Higa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\fluxodedados\fluxodedados\compile\fluxo_dados.vhd
-- Generated   : Fri Jul  3 17:06:43 2015
-- From        : c:\My_Designs\fluxodedados\fluxodedados\src\fluxo_dados.bde
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


entity FLUXO_DADOS is
  port(
       ClkGREG : in STD_LOGIC;
       cPC : in STD_LOGIC;
       ckEX_M : in STD_LOGIC;
       ckM_WB : in STD_LOGIC;
       cklC : in STD_LOGIC;
       cklID_EX : in STD_LOGIC;
       ckri : in STD_LOGIC;
       clk : in STD_LOGIC;
       rw : in STD_LOGIC;
       Ctc4 : in SIGNED(31 downto 0);
       PCin : in STD_LOGIC_VECTOR(31 downto 0);
       Output0 : out STD_LOGIC
  );
end FLUXO_DADOS;

architecture FLUXO_DADOS of FLUXO_DADOS is

use ieee.std_logic_arith.all;
function aldec_sig2slv1 (val:signed) return std_logic_vector is
begin
return conv_std_logic_vector(val,1);
end aldec_sig2slv1;

use ieee.std_logic_arith.all;

---- Component declarations -----

component EX
  port (
       ID_EXout : in STD_LOGIC_VECTOR(137 downto 0);
       cEXo : in STD_LOGIC_VECTOR(3 downto 0);
       cMo : in STD_LOGIC_VECTOR(2 downto 0);
       cWBo : in STD_LOGIC_VECTOR(1 downto 0);
       ckEX_M : in STD_LOGIC;
       EX_Mo : out STD_LOGIC_VECTOR(100 downto 0);
       Zeroo : out STD_LOGIC;
       cMo1 : out STD_LOGIC_VECTOR(2 downto 0);
       cWBo1 : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component ID
  port (
       ClkGREG : in STD_LOGIC;
       RIout : in STD_LOGIC_VECTOR(63 downto 0);
       cklID_EX : in STD_LOGIC;
       dataw : in STD_LOGIC_VECTOR(31 downto 0);
       enderw : in STD_LOGIC_VECTOR(4 downto 0);
       rw : in STD_LOGIC;
       ID_EXout : out STD_LOGIC_VECTOR(137 downto 0);
       cEXo : out STD_LOGIC_VECTOR(3 downto 0);
       cMo : out STD_LOGIC_VECTOR(2 downto 0);
       cWBo : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component mem2
  port (
       EX_Mo : in STD_LOGIC_VECTOR(100 downto 0);
       PCin : in STD_LOGIC_VECTOR(31 downto 0);
       Zero : in STD_LOGIC;
       cMo : in STD_LOGIC_VECTOR(2 downto 0);
       cWBc : in STD_LOGIC_VECTOR(1 downto 0);
       ckM_WB : in STD_LOGIC;
       clk : in STD_LOGIC;
       M_WBo : out STD_LOGIC_VECTOR(68 downto 0);
       NPCJ : out STD_LOGIC_VECTOR(31 downto 0);
       PCout : out STD_LOGIC_VECTOR(31 downto 0);
       cWBo : out STD_LOGIC_VECTOR(1 downto 0);
       pcsrc : out STD_LOGIC
  );
end component;
component WB
  port (
       M_WBo : in STD_LOGIC_VECTOR(68 downto 0);
       cWBo : in STD_LOGIC_VECTOR(1 downto 0);
       Output0 : out STD_LOGIC;
       dataw : out STD_LOGIC_VECTOR(31 downto 0);
       enderw : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component \IF\
  port (
       Ctc4 : in SIGNED(31 downto 0);
       NPCJ : in SIGNED(31 downto 0);
       cPC : in STD_LOGIC;
       cklC : in STD_LOGIC;
       ckri : in STD_LOGIC;
       pcsrc : in STD_LOGIC;
       RIout : out SIGNED(63 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET324 : STD_LOGIC;
signal NET492 : STD_LOGIC;
signal BUS333 : STD_LOGIC_VECTOR (2 downto 0);
signal BUS342 : STD_LOGIC_VECTOR (100 downto 0);
signal BUS358 : STD_LOGIC_VECTOR (68 downto 0);
signal BUS363 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS384 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS405 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS414 : STD_LOGIC_VECTOR (2 downto 0);
signal BUS423 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS432 : STD_LOGIC_VECTOR (1 downto 0);
signal BUS466 : STD_LOGIC_VECTOR (137 downto 0);
signal BUS479 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS501 : STD_LOGIC_VECTOR (1 downto 0);
signal BUS510 : STD_LOGIC_VECTOR (1 downto 0);

begin

----  Component instantiations  ----

U1 : \IF\
  port map(
       Ctc4 => Ctc4,
       NPCJ => signed(BUS479( 31 downto 0 )),
       RIout => BUS363,
       cPC => cPC,
       cklC => cklC,
       ckri => ckri,
       pcsrc => NET492
  );

U2 : WB
  port map(
       M_WBo => BUS358,
       Output0 => Output0,
       cWBo => BUS510,
       dataw => BUS384,
       enderw => BUS405
  );

U3 : mem2
  port map(
       EX_Mo => BUS342,
       M_WBo => BUS358,
       NPCJ => BUS479,
       PCin => PCin,
       Zero => NET324,
       cMo => BUS333,
       cWBc => BUS501,
       cWBo => BUS510,
       ckM_WB => ckM_WB,
       clk => clk,
       pcsrc => NET492
  );

U4 : EX
  port map(
       EX_Mo => BUS342,
       ID_EXout => BUS466,
       Zeroo => NET324,
       cEXo => BUS423,
       cMo => BUS414,
       cMo1 => BUS333,
       cWBo => BUS432,
       cWBo1 => BUS501,
       ckEX_M => ckEX_M
  );

U5 : ID
  port map(
       ClkGREG => ClkGREG,
       ID_EXout => BUS466,
       RIout => BUS363,
       cEXo => BUS423,
       cMo => BUS414,
       cWBo => BUS432,
       cklID_EX => cklID_EX,
       dataw => BUS384,
       enderw => BUS405,
       rw => rw
  );


end FLUXO_DADOS;
