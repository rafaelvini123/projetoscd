LIBRARY Ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.ALL;
ENTITY processador IS
	PORT (
		PC_inc: in std_logic;
		clock: in std_logic;--ok
		led : out std_logic;
		display1, display2, display_stoi1, display_stoi2 : buffer std_logic_vector(6 downto 0);--para display no fpga
		ir_data: out std_logic_vector(15 downto 0)
		);
	END processador ;
	
	
	
ARCHITECTURE arq OF processador is

----------------------SINAIS
		signal I_rd, D_rd, D_wr, RF_s, RF_w_wr, RF_rp_rd, RF_rq_rd, RF_rp_zero, ld_STOI: std_logic;
		signal RF_s1,alu_s : std_LOGIC_vector(1 downto 0);
		signal RF_w_addr, RF_rp_addr, RF_rq_addr: std_logic_vector(3 downto 0);
		signal D_addr, RF_W_data, Real_address : std_LOGIC_vector(7 downto 0);
		signal data_in, I_ADDR, W_data, R_data, mem_stoi	: std_LOGIC_vector(15 downto 0);
		
---------------------

COMPONENT datapath is 
	port(
		ld_STOI : in std_logic;
		D_addr: in std_logic_vector(7 downto 0);
		R_data: in std_logic_vector(15 downto 0);
		W_data: out std_logic_vector(15 downto 0);
		RF_w_addr: in std_logic_vector(3 downto 0);
		RF_w_wr: in std_logic;
		RF_rp_addr: in std_logic_vector(3 downto 0);
		RF_rp_rd: in std_logic;
		RF_rq_addr: in std_logic_vector(3 downto 0);
		RF_rq_rd: in std_logic;
		RF_s: in std_logic_vector(1 downto 0);
		clk2: in std_logic;
		alu_s: in std_logic_vector(1 downto 0);
		display1 : out std_logic_vector(6 downto 0);--para display no fpga
		display2 : out std_logic_vector(6 downto 0);--para display no fpga
		RF_rp_zero: out std_logic;
		RF_W_data: in std_logic_vector(7 downto 0);
		Real_address: out std_logic_vector(7 downto 0)
	);
END COMPONENT ;

COMPONENT banco_instrucao is 
	port(
		addr: in std_logic_vector(15 downto 0);
		data: out std_logic_vector(15 downto 0);
		rd: in std_logic;
		clk: in std_logic
	);
END COMPONENT ;

COMPONENT Memoria is
	port(
		addr: in std_logic_vector(7 downto 0);
		clk: in std_logic;
		rd: in std_logic;
      wr: in std_logic;
		W_data: in std_logic_vector(15 downto 0);
		R_data: out std_logic_vector(15 downto 0);
		mem_disp: out std_logic_vector(15 downto 0)
		);
end COMPONENT;

COMPONENT unidade_de_controle is 
	port(
		PC_inc: in std_logic;
		D_addr: out std_logic_vector(7 downto 0);-- endereço na memoria a ser usada
		D_rd: out std_logic; -- ativar leitura da memoria
		D_wr: out std_logic; --- ativar escrita da memoria
		RF_w_addr: out std_logic_vector(3 downto 0);
		RF_w_wr: out std_logic;
		RF_rp_addr: out std_logic_vector(3 downto 0);
		RF_rp_rd: out std_logic;
		RF_rq_addr: out std_logic_vector(3 downto 0);
		RF_rq_rd: out std_logic;
		RF_s: out std_logic_vector(1 downto 0); -- sinal de controle do mux
		clk2: in std_logic;
		alu_s: out std_logic_vector(1 downto 0);
		I_rd:  out std_logic; -- ativar leitura do banco de registradores de instruções
		data_in: in std_logic_vector(15 downto 0); --entrada do banco de instrução
		I_ADDR : inout STD_LOGIC_vector(15 downto 0); -- saida do contador, endereço onde está a instrução
		RF_rp_zero: in std_logic;
		RF_W_data: out std_LOGIC_vector(7 downto 0);
		ir_data: out std_logic_vector(15 downto 0);
		ld_STOI: out std_logic
	);
END COMPONENT ;

COMPONENT display is
	PORT(
		input: in std_logic_vector(15 downto 0);
		display1: buffer std_logic_vector(6 downto 0);
		display2: buffer std_logic_vector(6 downto 0)
	);
END COMPONENT;


BEGIN 

led <= clock;

datapath1 : datapath PORT MAP (--OK
		ld_STOI => ld_STOI,
		Real_address => Real_address,
		D_addr => D_addr,
		R_data => R_data,
		W_data => W_data,--ENTRADA NA MEMORIA
		RF_w_addr => RF_w_addr,
		RF_w_wr => RF_w_wr,
		RF_rp_addr => RF_rp_addr,
		RF_rp_rd => RF_rp_rd,
		RF_rq_addr => RF_rq_addr,
		RF_rq_rd => RF_rq_rd,
		RF_s => RF_s1,
		clk2 => clock,
		alu_s => alu_s,
		display1 => display1,
		display2 => display2,
		RF_rp_zero=>RF_rp_zero,
		RF_W_data => RF_W_data
		);

banco_instrucao1 : banco_instrucao PORT MAP (--OK
		addr => I_ADDR,
		data => data_in,
		rd => I_rd,
		clk => clock
					);
					
memoria1 : memoria PORT MAP (--OK
		addr => Real_address,
		clk => clock,
		rd => D_rd,
      wr => D_wr,
		W_data => W_data,
		R_data => R_data,
		mem_disp => mem_stoi
		);
					
unidade_de_controle1 : unidade_de_controle PORT MAP (--OK
		PC_inc => PC_inc,
		ld_STOI => ld_STOI,
		D_addr => D_addr,
		D_rd => D_rd,
		D_wr => D_wr,
		RF_w_addr => RF_w_addr,
		RF_w_wr =>RF_w_wr ,
		RF_rp_addr =>RF_rp_addr ,
		RF_rp_rd => RF_rp_rd,
		RF_rq_addr => RF_rq_addr,
		RF_rq_rd =>RF_rq_rd ,
		RF_s =>RF_s1,
		clk2 => clock ,
		alu_s => alu_s,
		I_rd => I_rd,
		data_in =>data_in ,
		I_ADDR => I_ADDR,
		RF_rp_zero=>RF_rp_zero,
		RF_W_data => RF_W_data,
		ir_data => ir_data
		);

display_stoi: display port map(
	input => mem_stoi,
	display1 => display_stoi1,
	display2 => display_stoi2
);

 END arq ;