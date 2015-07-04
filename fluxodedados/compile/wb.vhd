-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\fluxodedados\fluxodedados\compile\wb.vhd
-- Generated   : Fri Jul  3 18:33:35 2015
-- From        : c:\My_Designs\fluxodedados\fluxodedados\src\wb.bde
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

entity WB is
  port(
       M_WBo : in STD_LOGIC_VECTOR(68 downto 0);
       cWBo : in STD_LOGIC_VECTOR(1 downto 0);
       RW : out STD_LOGIC;
       dataw : out STD_LOGIC_VECTOR(31 downto 0);
       enderw : out STD_LOGIC_VECTOR(4 downto 0)
  );
end WB;

architecture WB of WB is

---- Component declarations -----

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

begin

----  Component instantiations  ----

U1 : multiplexador
  port map(
       I0 => M_WBo( 31 downto 0 ),
       I1 => M_WBo( 63 downto 32 ),
       O => dataw( 31 downto 0 ),
       S => cWBo(0)
  );


---- Terminal assignment ----

    -- Output\buffer terminals
	RW <= cWBo(1);
	enderw(0) <= M_WBo(64);
	enderw(1) <= M_WBo(65);
	enderw(2) <= M_WBo(66);
	enderw(3) <= M_WBo(67);
	enderw(4) <= M_WBo(68);


end WB;
