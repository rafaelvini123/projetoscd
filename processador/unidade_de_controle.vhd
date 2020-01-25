LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.ALL;


ENTITY unidade_de_controle IS
	PORT (	
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
	END unidade_de_controle ;

ARCHITECTURE arq OF unidade_de_controle is

signal PC_clr_S:  std_logic; -- clear do contador
signal data_out_S:  std_logic_vector(15 downto 0);
signal IR_ld_S: std_logic; -- ativar incremento contador
signal RF_rp_zero1: std_logic;
signal PC_ld: std_LOGIC;


COMPONENT contador is 
	PORT(	
		data_in: in std_LOGIC_vector(15 downto 0);
		clr : IN STD_LOGIC;
		up  : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		ld: in std_LOGIC;
		I_ADDR : OUT STD_LOGIC_vector(15 downto 0)
	);	
	
END COMPONENT ;

COMPONENT IR is 
	port(
		data_in: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		ld: in std_logic;
		data_out: out std_logic_vector(15 downto 0)
	);
END COMPONENT;

COMPONENT Controlador IS
    PORT (
		  reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        data : IN STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
        RF_rp_zero : IN STD_LOGIC := '0';
        PC_clr : OUT STD_LOGIC;
        PC_ld : OUT STD_LOGIC;
        IR_ld : OUT STD_LOGIC;
        I_rd : OUT STD_LOGIC;
        D_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        D_rd : OUT STD_LOGIC;
        D_wr : OUT STD_LOGIC;
        RF_s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        RF_W_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        RF_W_wr : OUT STD_LOGIC;
        RF_Rp_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        RF_Rp_rd : OUT STD_LOGIC;
        RF_Rq_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        RF_Rq_rd : OUT STD_LOGIC;
        alu_s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        ld_STOI : OUT STD_LOGIC
    );
END COMPONENT;

 BEGIN 
 ir_data <= data_out_S;
contador1 : contador PORT MAP (
		clr => PC_clr_S,
		up  => PC_inc,
		ld=>PC_ld,
		clk  => clk2,
		I_ADDR  => I_ADDR,
		data_in => I_ADDR + data_out_S - '1'
		);

IR1: IR  PORT MAP (
		clk  => clk2,
		data_in => data_in,
		ld => IR_ld_S,
		data_out => data_out_S 
		);
	
Controller1 : Controlador  PORT MAP (			
		clock => clk2,
		data =>data_out_S,
		PC_clr =>PC_clr_S,
		PC_ld=>PC_ld,
		IR_ld =>IR_ld_S,
		I_rd =>I_rd,
		D_addr =>D_addr,
		D_rd =>D_rd,
		D_wr =>D_wr,
		RF_s =>RF_s,
		RF_W_addr => RF_W_addr,
		RF_W_wr =>RF_W_wr,
		RF_Rp_addr =>RF_Rp_addr,
		RF_Rp_rd =>RF_Rp_rd,
		RF_Rq_addr =>RF_Rq_addr,
		RF_Rq_rd =>RF_Rq_rd,
		alu_s =>alu_s,
		RF_rp_zero =>RF_rp_zero,
		ld_STOI => ld_STOI
		);		

 END arq ;