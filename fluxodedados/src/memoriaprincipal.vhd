library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use ieee.numeric_std.all;
use std.textio.all;

entity memPrim is
  generic(
       BE : integer := 32;
       BP : integer := 32;
       nombre: string := "C:\Users\DianaCarolina\Dropbox\Projeto Arquitetura\arquivos VHDL\Caches\sort.txt";
	   bits_words : integer := 4; 
       TRW : time := 100 ns;
       Tsetup : time := 2 ns
              
       

  );
  port(
       Clock : in std_logic;
       
	   addressI:in std_logic_vector(BP - 1 downto 0);
	   addressD:in std_logic_vector(BP - 1 downto 0);
	   data_inI: in std_logic_vector(2**bits_words*BP-1 downto 0);
	   data_inD: in std_logic_vector(2**bits_words*BP-1 downto 0);
	   data_outI: out std_logic_vector(2**bits_words*BP-1 downto 0);
	   data_outD: out std_logic_vector(2**bits_words*BP-1 downto 0);
	   m_writeI:in std_logic;
	   m_writeD:in std_logic;
	   m_enableI:in std_logic;
	   m_enableD:in std_logic;
	   m_readyI : out std_logic; 
	   m_readyD: out std_logic

       
  );
end memPrim;

architecture memPrim of memPrim is


	type    tipo_memoria  is array (0 to 50000) of std_logic_vector(BP - 1 downto 0);
	signal Mram: tipo_memoria := ( others  => (others => '0')) ;
	constant n_words : integer := 2**bits_words; 

begin

Carga_Inicial_e_Ram_Memoria :process (Clock, data_inD,data_inI)
variable endereco: integer;
variable rw : std_logic;
variable ftD: std_logic:='1';
variable ftI: std_logic:='1';
variable dadoEntrada : std_logic_vector(2**bits_words*BP - 1 downto 0);
variable ender : std_logic_vector(BE - 1 downto 0);
variable dadoSaida : std_logic_vector(2**bits_words*BP - 1 downto 0);

variable inicio: std_logic := '1';	 




function fill_memory return tipo_memoria is
        type HexTable is array (character range <>) of integer;
        constant lookup: HexTable ('0' to '1') :=
                (0, 1);

        file infile: text open read_mode is nombre;
        variable buff: line;
        variable addr_s: character; 
        variable data_s: character; 
		variable v_sep:character;
		variable addr_1:integer;
        variable data: std_logic_vector(31 downto 0);
        variable Mem: tipo_memoria := ( others  => (others => '0')) ;
        begin
                while (not endfile(infile)) loop
                        readline(infile,buff);                
                        addr_1 := 0;
                        for i in (32 - 1) downto 2 loop	 
								read(buff,addr_s);
								if lookup(addr_s)=1 then 
								addr_1 := addr_1 + lookup(addr_s)*2**(i-2); 
								end if;
                        end loop; 
						read(buff,v_sep);
						read(buff,v_sep);
						read(buff,v_sep);
						
						for i in (32- 1) downto 0 loop
							read(buff,data_s); 
							if(lookup(data_s)=1) then
								data (i):= '1';
							else 
								data (i):= '0';
							end if;
								

                        end loop;
						Mem(addr_1) := data;                       
                end loop;
        return Mem;
end fill_memory;
 
begin
if inicio = '1' then
	m_readyI<='0';
		m_readyD<='0';
        Mram <= fill_memory;
        
        inicio := '0';
end if;
if m_enableI='0' then
	m_readyI<='0';
end if;				
if m_enableD='0' then
	m_readyD<='0';
end if;
if Clock'event and Clock  = '1' then
	
		       	if m_enableD = '1' and ftD='1' then	
					rw := m_writeD; 	
					dadoEntrada:=data_inD;
					ender:= addressD;
				end if;	
				if m_enableI = '1' and ftI='1' then
					rw := m_writeI; 	
					dadoEntrada:=data_inI;
					ender:= addressI;
				end if;
                endereco := CONV_INTEGER(ender(31 downto 2));
                case rw is
                        when '0' =>
								for word_index in 0 to n_words-1 loop
									dadoSaida ((word_index+1)*BP-1 downto word_index*BP) := Mram(endereco+word_index);										               
								end loop; 
                                
                        when '1' => 
                                for word_index in 0 to n_words-1 loop
																	               
									Mram(endereco+word_index) <= dadoEntrada ((word_index+1)*BP-1 downto word_index*BP);
								end loop; 
                               
                        when others =>
                                Null;
                end case;  
		if m_enableD='1' and ftD='1' then
			data_outD<=dadoSaida after TRW;
			m_readyD<='1' after TRW;	 
		end if;
		if m_enableI='1' and ftI='1' then
			data_outI<=dadoSaida after TRW;
			m_readyI<='1' after TRW;	
		end if;	   
		
		if m_enableI='1' then			
			ftI:='0';
		end if;	
		if m_enableD='1' then			
			ftD:='0';
		end if;
		if m_enableD='0' then 
			ftD:='1';
		end if;
		if m_enableI='0' then 
			ftI:='1';
		end if;
     	
end if;	


end process;

end memPrim;
