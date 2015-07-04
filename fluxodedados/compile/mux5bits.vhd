-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fluxodedados
-- Author      : Asua
-- Company     : ad
--
-------------------------------------------------------------------------------
--
-- File        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\compile\mux5bits.vhd
-- Generated   : Sat Jul  4 12:02:06 2015
-- From        : f:\POLI\SETIMO SEMESTRE\arquitetura\projeto-pcs2405\fluxodedados\src\mux5bits.bde
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


entity mux5bits is
  generic(
       NumeroBits : integer := 5;
       Tsel : time := 2 ns;
       Tdata : time := 1 ns
  );
  port(
       S : in std_logic;
       I0 : in std_logic_vector(NumeroBits - 1 downto 0);
       I1 : in std_logic_vector(NumeroBits - 1 downto 0);
       O : out std_logic_vector(NumeroBits - 1 downto 0)
  );
end mux5bits;

architecture mux5bits of mux5bits is

begin

---- Processes ----

Mux :
process (I0, I1, S)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
variable Delay: time := 0 ns;
begin
	If (S'event) then 
		Delay := Tsel;
	else
		Delay := Tdata;
	end if;
	case S is
		when '0' 	=> O <= I0 				after Delay;
		when '1' 	=> O <= I1 				after Delay;
		when others => O <= (others => 'X') after Delay;
	end case;
end process Mux;

end mux5bits;
