library IEEE;
use IEEE.std_logic_1164.all;


-- other libraries declarations
library BIBLIOTECA_DE_COMPONENTES1;

entity DMEM is
  port(
       memread : in STD_LOGIC;
       memwrite : in STD_LOGIC;
       dataw : in STD_LOGIC_VECTOR(31 downto 0);
       endr : in STD_LOGIC_VECTOR(31 downto 0);
       endw : in STD_LOGIC_VECTOR(31 downto 0);
       datao : out STD_LOGIC_VECTOR(31 downto 0)
  );
end DMEM;

architecture DMEM of DMEM is

---- Component declarations -----

component cache_teste
  port (
       dado_escrita : in STD_LOGIC_VECTOR(31 downto 0);
       endereco : in STD_LOGIC_VECTOR(31 downto 0);
       mem_read : in STD_LOGIC;
       mem_write : in STD_LOGIC;
       dado_leitura : out STD_LOGIC_VECTOR(31 downto 0)
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

signal smuxmem : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : cache_teste
  port map(
       dado_escrita => dataw,
       dado_leitura => datao,
       endereco => smuxmem,
       mem_read => memread,
       mem_write => memwrite
  );

U2 : multiplexador
  generic map (
       NumeroBits => 32,
       Tdata => 1 ns,
       Tsel => 2 ns
  )
  port map(
       I0 => endr( 31 downto 0 ),
       I1 => endw( 31 downto 0 ),
       O => smuxmem( 31 downto 0 ),
       S => memwrite
  );


end DMEM;
