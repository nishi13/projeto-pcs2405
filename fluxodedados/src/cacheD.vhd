																 library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use ieee.math_real.all;

entity Cache_D is
  generic(
   bits_addr : integer := 32;
   bits_word : integer := 32;
   bits_block_conj : integer := 1;
   bits_conjuntos : integer := 8;
   bits_words : integer := 4
  );

  port(
        Clock : in std_logic;
        reset : in std_logic;
        a_write : in std_logic;
        ready : out std_logic;
		address : in std_logic_vector(bits_addr - 1 downto 0);
        data_in : in std_logic_vector(bits_word - 1 downto 0);
        data_out : out std_logic_vector(bits_word - 1 downto 0);
		memPrim_enable : out std_logic;
        memPrim_write : out std_logic;

        memPrim_ready : in std_logic;
		memPrim_addr : out std_logic_vector(bits_addr - 1 downto 0);
        memPrim_data_in : in std_logic_vector(2**bits_words*bits_word - 1 downto 0);
		memPrim_block_out : out std_logic_vector(2**bits_words*bits_word - 1 downto 0);

        hit_par : out std_logic;
        miss_par : out std_logic
        );
end Cache_D;

architecture Cache_D of Cache_D is

        constant n_blocks : integer := 2**bits_block_conj;
        constant n_conj : integer := 2**bits_conjuntos;
        constant n_words : integer := 2**bits_words;

        constant t_access : time :=  0.5 ns;
		type data_t is array (0 to n_words - 1) of std_logic_vector(bits_word - 1 downto 0);

        type bloco is record
                valid: boolean;
				tag: integer;
                data: data_t;
        end record;

        type conjunto is array (0 to n_blocks - 1) of bloco;
		type LRU_t is array (0 to n_conj - 1) of integer;
        type t_cache is array (0 to n_conj - 1) of conjunto;

        Signal Cache : t_cache;
        signal reading_hit : std_logic;

begin


        process(Clock, memPrim_ready, reading_hit)

        variable addr: std_logic_vector(bits_addr - 1 downto 0);

		variable LRU:LRU_t;
        variable cache_temp : t_cache;
        variable data_t: integer;
        variable bloco: integer;
		variable ret: boolean;
        variable tag: integer;
        variable word: integer;
        variable hit: boolean;
        variable hasEmpty: boolean;
        variable empty: integer;
        variable seed1,seed2: positive;
        variable random: real;
		variable bits:integer;
        variable random_block: integer;
        variable writing : boolean;
        variable reading : boolean;
		variable addr_ret: std_logic_vector(bits_addr - 1 downto 0);

        begin
        if reset = '1' then
            ready <= '0';
            memPrim_enable <= '0';
            memPrim_write <= '0';
            memPrim_addr <= (others => '0');
                for conj_index in 0 to n_conj - 1 loop
                        for bloco_index in 0 to n_blocks - 1 loop
                                cache_temp(conj_index)(bloco_index).valid := false;
                                cache_temp(conj_index)(bloco_index).tag := 0;

                                cache_temp(conj_index)(bloco_index).data := (others => (others => '0') );
                        end loop;
						LRU(conj_index):=0;
                end loop;
                Cache <= cache_temp;
                writing := false;
                reading := false;
                reading_hit <= '0';
                hit_par <= '0';
                miss_par <= '0';

        end if;

        if Clock'event and Clock = '1' and not writing
                and not reading and reading_hit = '0' and not reading_hit'event then
                hit := false;
                hasEmpty := false;
                empty := -1;
                addr :=  address;
                ready <= '0';
                memPrim_enable <= '0';
                memPrim_write <= '0';
                hit_par <= '0' after 0 ns;
                miss_par <= '0' after 0 ns;

                data_t := CONV_INTEGER(addr( (bits_conjuntos + bits_words + 1 ) downto (bits_words+2)));
                tag := CONV_INTEGER(addr ((bits_addr - 1 ) downto (bits_conjuntos + bits_words)+2));
                word := CONV_INTEGER(addr ((bits_words +1) downto 2));
				bits :=CONV_INTEGER(addr(1 downto 0));

                for bloco_index in 0 to n_blocks - 1 loop
                        if Cache(data_t)(bloco_index).valid  then
                                if Cache(data_t)(bloco_index).tag = tag then
                                        hit := true;
                                        bloco := bloco_index;
                                end if;
                        else
                                hasEmpty := true;
                                empty := bloco_index;
                        end if;
                end loop;

                if hit then
                        hit_par <= '0' after 1ps, '1' after t_access+1ps;
                        LRU(data_t):=1-bloco;
                        if a_write = '1' then

                                Cache(data_t)(bloco).data(word) <= data_in;


                        else

                                reading_hit <= '1';

                        end if;
                else
                        miss_par <= '0' after 1ps, '1' after t_access+1ps;

                        if a_write = '1' then
                                 if hasEmpty then
										bloco:=empty;
										Cache(data_t)(empty).valid <= true;
                                        Cache(data_t)(empty).tag <= tag;
										Cache(data_t)(empty).data(word) <= data_in;
								else
										bloco := 1-LRU(data_t);
										if Cache(data_t)(bloco).valid then
											memPrim_addr <=conv_std_logic_vector(Cache(data_t)(0).tag,bits_addr-(bits_conjuntos + bits_words+2)) & conv_std_logic_vector(data_t,bits_conjuntos)& conv_std_logic_vector(0,bits_words+2);
											for word_index in 0 to n_words-1 loop
													memPrim_block_out ((word_index+1)*bits_word-1 downto word_index*bits_word)<= Cache(data_t)(bloco).data(word_index);

											end loop;

											Cache(data_t)(bloco).valid <= true;
											Cache(data_t)(bloco).tag <= tag;
											Cache(data_t)(bloco).data(word) <= data_in;
											memPrim_enable <= '1' after t_access;

											memPrim_write <= '1' after t_access;
											writing := true;
											bloco := 1-LRU(data_t);
										end if;

								end if;
                        else

                                if  hasEmpty then

                                        bloco := empty;
                                        Cache(data_t)(empty).valid <= true;
                                        Cache(data_t)(empty).tag <= tag;

                                        memPrim_enable <= '1' after t_access;
                                        memPrim_addr <= addr after t_access;
                                        memPrim_write <= '0' after t_access;
                                        reading := true;
										LRU(data_t):=1-bloco;
                                else

                                        bloco := LRU(data_t) ;
										if Cache(data_t)(bloco).valid then
											--addr_ret :=conv_std_logic_vector(data_t,bits_conjuntos) & conv_std_logic_vector(Cache(data_t)(0).tag,bits_addr-(bits_conjuntos + bits_words)) & conv_std_logic_vector(0,bits_words);
											addr_ret := conv_std_logic_vector(Cache(data_t)(0).tag,bits_addr-(bits_conjuntos + bits_words+2)) & conv_std_logic_vector(data_t,bits_conjuntos)& conv_std_logic_vector(0,bits_words+2);

											ret:=true;
											for word_index in 0 to n_words-1 loop
													memPrim_block_out ((word_index+1)*bits_word-1 downto word_index*bits_word)<= Cache(data_t)(bloco).data(word_index);

											end loop;
										end if;
                                        Cache(data_t)(bloco).valid <= true;
                                        Cache(data_t)(bloco).tag <= tag;
                                        memPrim_enable <= '1' after t_access;
                                        memPrim_addr <= addr after t_access;
                                        memPrim_write <= '0' after t_access;
                                        reading := true;
										if ret then
											memPrim_enable <= '1' after t_access;

											memPrim_write<='1';
											memPrim_write <= '1' after t_access;
											writing := true;
										end if;
                                end if;


                        end if;
                end if;


        end if;

        if reading_hit = '1' and reading_hit'event then
                ready <= '1' after t_access+1ps;
                data_out <= Cache(data_t)(bloco).data(word) after t_access;
                reading_hit <= '0' after t_access+1ps;
        end if;



        if memPrim_ready'event and memPrim_ready = '1' and reading then
                reading := false;
                for word_index in 0 to n_words-1 loop
                        Cache(data_t)(bloco).data(word_index) <= memPrim_data_in ((word_index+1)*bits_word-1 downto word_index*bits_word);
                        if word_index = word then
                                data_out <= memPrim_data_in ((word_index+1)*bits_word-1 downto word_index*bits_word);
                        end if;
                end loop;
                ready <= '1';
                memPrim_enable <= '0';
        end if;
        if memPrim_ready'event and memPrim_ready = '1' and writing then
                if ret then
					memPrim_addr <= addr_ret  after t_access;
				end if;
				writing := false;
                ready <= '1';
                memPrim_enable <= '0';

        end if;
        end process;


end Cache_D;
