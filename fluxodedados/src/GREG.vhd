library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- other libraries declarations
library biblioteca_de_componentes;

entity GREG is
  port(
       clk : in STD_LOGIC;
       rw : in STD_LOGIC;
       DataW : in STD_LOGIC_VECTOR(31 downto 0);
       endA : in STD_LOGIC_VECTOR(4 downto 0);
       endB : in STD_LOGIC_VECTOR(4 downto 0);
       endW : in STD_LOGIC_VECTOR(4 downto 0);
       dataA : out STD_LOGIC_VECTOR(31 downto 0);
       dataB : out STD_LOGIC_VECTOR(31 downto 0)
  );
end GREG;

architecture GREG of GREG is

---- Component declarations -----

component DualRegFile
  generic(
       NBdado : INTEGER := 8;
       NBend : INTEGER := 4;
       Tread : TIME := 5 ns;
       Twrite : TIME := 5 ns
  );
  port (
       clk : in STD_LOGIC;
       dadoina : in STD_LOGIC_VECTOR(NBdado-1 downto 0);
       enda : in STD_LOGIC_VECTOR(NBend-1 downto 0);
       endb : in STD_LOGIC_VECTOR(NBend-1 downto 0);
       we : in STD_LOGIC;
       dadoouta : out STD_LOGIC_VECTOR(NBdado-1 downto 0);
       dadooutb : out STD_LOGIC_VECTOR(NBdado-1 downto 0)
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

---- Signal declarations used on the diagram ----

signal rwcor : STD_LOGIC;
signal gregmuxout : STD_LOGIC_VECTOR (4 downto 0);

begin

---- Processes ----

definerw :
process (rw)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements
if(rw='1') then
	rwcor<='1';
else
	rwcor<='0';
	end if;
end process;

----  Component instantiations  ----

U1 : multiplexador
  generic map (
       Tdata => 1 ns,
       Tsel => 2 ns,
       NumeroBits => 5
  )
  port map(
       I0 => endA( 4 downto 0 ),
       I1 => endW( 4 downto 0 ),
       O => gregmuxout( 4 downto 0 ),
       S => rwcor
  );

U2 : DualRegFile
  generic map (
       NBdado => 32,
       NBend => 5,
       Tread => 5 ns,
       Twrite => 5 ns
  )
  port map(
       clk => clk,
       dadoina => DataW( 31 downto 0 ),
       dadoouta => dataA( 31 downto 0 ),
       dadooutb => dataB( 31 downto 0 ),
       enda => gregmuxout( 4 downto 0 ),
       endb => endB( 4 downto 0 ),
       we => rwcor
  );


end GREG;