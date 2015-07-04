																		 LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.NUMERIC_STD.ALL;

ENTITY EXE IS
	GENERIC (NUMBITS:NATURAL:=32);
	PORT 	(	rst			: 	IN STD_LOGIC;	
				clk 		: 	IN STD_LOGIC;
				wbcon_i		:	IN STD_LOGIC_VECTOR(2 DOWNTO 0); --3 bits
				memcon_i	:	IN STD_LOGIC_VECTOR(2 DOWNTO 0); --3 bits
				excon		:	IN STD_LOGIC_VECTOR(6 DOWNTO 0); --7 bits	
				next_int_i	:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				j_abs_i		:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				rs			:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				rt_i		:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				imm			:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				rs_addr		:  	IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				rt_addr		:  	IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				rd_addr		:  	IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				EXMEM_rdaddr 	:	IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
				MEMWB_rdaddr 	:	IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
				EXMEM_RegWrite	:	IN 	STD_LOGIC;
				MEMWB_RegWrite	:	IN 	STD_LOGIC;
				op_M		:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				op_W		:  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				DEXWrite		:	IN	STD_LOGIC;
				
				IDEX_rtaddr		:	OUT	STD_LOGIC_VECTOR(4 DOWNTO 0);
				IDEX_MemRead	:	OUT STD_LOGIC;
				PCSrcj		:	OUT STD_LOGIC;
				j_addr		:  	OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				j_abs_o		:  	OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);				
				zero		:	OUT	STD_LOGIC;
				wbcon_o		:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0); --3 bits
				memcon_o	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0); --3 bits
				next_int_o	:  	OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				write_data	:	OUT	STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				ALU_R		:	OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
				rf_addr		:  	OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
			);
		
END EXE;

ARCHITECTURE behavior OF EXE IS

COMPONENT EXE_buff IS
	GENERIC (NUMBITS		: NATURAL := 32);
	PORT( rst 		 :  	IN STD_LOGIC;
		  clk 		 :  	IN STD_LOGIC;
		  load		 :		IN STD_LOGIC;
		  wbcon		 :		IN STD_LOGIC_VECTOR(2 DOWNTO 0); --3 bits
		  memcon	 :		IN STD_LOGIC_VECTOR(2 DOWNTO 0); --3 bits
		  excon		 :		IN STD_LOGIC_VECTOR(6 DOWNTO 0); --7 bits
		  next_int_i :		IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0); --32 bits
		  rs		 :  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0); --32 bits
		  rt		 :  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0); --32 bits
		  imm		 :  	IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0); --32 bits
		  jabs		 :		IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0); --32 bits
		  rs_addr	 :		IN STD_LOGIC_VECTOR(4 DOWNTO 0); --5 bits
		  rt_addr	 :		IN STD_LOGIC_VECTOR(4 DOWNTO 0); --5 bits
		  rd_addr	 :		IN STD_LOGIC_VECTOR(4 DOWNTO 0); --5 bits
		  
		  data_o	 : 		OUT STD_LOGIC_VECTOR(187 DOWNTO 0)); --total: 188 bits
END COMPONENT;

COMPONENT ALU is
	generic(NUMBITS : integer := 32);
    Port ( Operando1 : in  STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
           ALUctrl : in  STD_LOGIC_VECTOR (3 downto 0);
           Zero : out  STD_LOGIC;
           Resultado : out  STD_LOGIC_VECTOR (NUMBITS-1 downto 0));
end COMPONENT;

COMPONENT shift_left2 is 
        generic(NUMBITS : integer := 32);
         port(
				datain : 		in STD_LOGIC_VECTOR(NUMBITS-1 downto 0);
                 
				dataout : 		out STD_LOGIC_VECTOR(NUMBITS-1 downto 0)
             );
end COMPONENT;

COMPONENT ALUcontrol is
    Port ( ALUop : in  STD_LOGIC_VECTOR (2 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

COMPONENT multiplexor2a1 IS
	GENERIC (NUMBITS	: NATURAL := 32);
	PORT (	a	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
		    b	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
			sel	:  IN STD_LOGIC;
		    f	: OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0));
END COMPONENT;

COMPONENT somador IS
	GENERIC (NUMBITS	: NATURAL := 32);
	PORT (	SIGNAL x	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
			SIGNAL y	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
			SIGNAL XY	: OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0));
END COMPONENT;

COMPONENT forwarding_unit IS
	PORT(	rs_addr	 	:	IN 	STD_LOGIC_VECTOR(4 DOWNTO 0); 
		rt_addr	 		:	IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);  
		EXMEM_rdaddr 	:	IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
		MEMWB_rdaddr 	:	IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);		
		EXMEM_RegWrite	:	IN 	STD_LOGIC;
		MEMWB_RegWrite	:	IN 	STD_LOGIC;
		ForwardA		: 	OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		ForwardB		: 	OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0)		
	     );
END COMPONENT;

COMPONENT multiplexor3a1 IS
	GENERIC (NUMBITS	: NATURAL := 32);
	PORT (	    a	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
		    b	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
		    c	:  IN STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
		    sel	:  IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		    f	: OUT STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0));
END COMPONENT;

SIGNAL op1	:	STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
SIGNAL op2	:	STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
SIGNAL opr2	:	STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
SIGNAL sls	:	STD_LOGIC_VECTOR(NUMBITS-1 DOWNTO 0);
SIGNAL tomxrd2	:	STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL outbff	:	STD_LOGIC_VECTOR(187 DOWNTO 0);
SIGNAL ALUc	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL forA	:	STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL forB	:	STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

j_abs_o <= outbff(187 DOWNTO 156);
wbcon_o <= outbff(150 DOWNTO 148);
memcon_o <= outbff(147 DOWNTO 145);
next_int_o <= outbff(137 DOWNTO 106);
PCSrcj <= outbff(143);
IDEX_rtaddr <= outbff(9 DOWNTO 5);
IDEX_MemRead <= outbff(146);
write_data <= opr2;

buff: EXE_buff GENERIC MAP(NUMBITS => NUMBITS)
				PORT MAP(rst, clk, DEXWrite, wbcon_i, memcon_i, excon, next_int_i,rs,rt_i,imm,j_abs_i,rs_addr,rt_addr,rd_addr, outbff);

alu1 : ALU GENERIC MAP(NUMBITS => NUMBITS)
		  PORT MAP(op1, op2, ALUc, zero, ALU_R);

jcal: somador GENERIC MAP(NUMBITS => NUMBITS)
			PORT MAP(outbff(137 DOWNTO 106),sls,j_addr);
			
shift: shift_left2 GENERIC MAP(NUMBITS => NUMBITS)
				PORT MAP(outbff(41 downto 10),sls);
				
aluc1 : ALUcontrol 
				PORT MAP(outbff(140 DOWNTO 138), outbff(15 DOWNTO 10), ALUc);
				
mxop1 : multiplexor3a1 GENERIC MAP(NUMBITS => NUMBITS)
					PORT MAP (outbff(105 DOWNTO 74),op_W, op_M, forA, op1);
				
mxopr2 : multiplexor2a1 GENERIC MAP(NUMBITS => NUMBITS)
					PORT MAP (opr2,outbff(41 downto 10), outbff(144), op2);
					
mxop2 : multiplexor3a1 GENERIC MAP(NUMBITS => NUMBITS)
					PORT MAP (outbff(73 DOWNTO 42),op_W, op_M, forB, opr2);
					
mxrd1 : multiplexor2a1 GENERIC MAP(NUMBITS => 5)
					PORT MAP (outbff(4 downto 0),outbff(9 downto 5), outbff(141), tomxrd2);
					
mxrd2 : multiplexor2a1 GENERIC MAP(NUMBITS => 5)
					PORT MAP (tomxrd2,"11111", outbff(142), rf_addr);

forward : forwarding_unit 
					PORT MAP (outbff(152 DOWNTO 148), outbff(9 downto 5), EXMEM_rdaddr, MEMWB_rdaddr, EXMEM_RegWrite, MEMWB_RegWrite, forA, forB);

END behavior;