LIBRARY Ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.ALL;


ENTITY datapath IS
	PORT (
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
	END datapath ;
	
	
ARCHITECTURE arq OF datapath is

SIGNAL saida_mux: std_logic_vector(15 downto 0);
SIGNAL entrada_mux_B: std_logic_vector(15 downto 0);
SIGNAL saida_rq_data: std_logic_vector(15 downto 0);
SIGNAL saida_rp_data: std_logic_vector(15 downto 0);



COMPONENT display is
	PORT(
		input: in std_logic_vector(15 downto 0);
		display1: buffer std_logic_vector(6 downto 0);
		display2: buffer std_logic_vector(6 downto 0)
	);
END COMPONENT;

component mux_STOI is
	port(
		D_addr, mem_STOI : in std_logic_vector(7 downto 0);
		ld_STOI : in std_logic;
		address : out std_logic_vector(7 downto 0)
	);
end component;

COMPONENT MUX is 
	PORT(		
		saida_ula : in std_logic_vector(15 downto 0);
		saida_memoria: in std_logic_vector(15 downto 0);
		constante : in std_logic_vector(7 downto 0 );
		seletor : in	 std_logic_vector(1 downto 0);
		saida_mux : out std_logic_vector(15 downto 0)
		);		
END COMPONENT ;

COMPONENT ULA is 
	port(
		sinal_controle: in std_logic_vector(1 downto 0);
		A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		output: out std_logic_vector(15 downto 0)
	);
END COMPONENT ;

COMPONENT BancoRegistrador is 
	port(
		w_data: in std_logic_vector(15 downto 0);
		w_addr: in std_logic_vector(3 downto 0);
		w_wr: in std_logic;
		rp_addr: in std_logic_vector(3 downto 0);
		rp_rd: in std_logic;
		rq_addr: in std_logic_vector(3 downto 0);
		rq_rd: in std_logic;
		rp_data: out std_logic_vector(15 downto 0);
		rq_data: out std_logic_vector(15 downto 0);
		clk: in std_logic
		);	
END COMPONENT ;

COMPONENT comparador is 
	port( 
			saida_banco : in std_logic_vector(15 downto 0);
			saida_comparador : out std_logic
		 );
END COMPONENT;

 BEGIN 
 
mux_mem : mux_STOI port map (
					D_addr => D_addr, 
					mem_STOI => saida_rq_data(7 downto 0), 
					ld_STOI => ld_STOI, 
					address => Real_address
					);

--W_data <= saida_rp_data;

mux1 : MUX PORT MAP (
					seletor => RF_s,
					constante=>RF_W_data,
					saida_memoria => R_data,
					saida_ula => entrada_mux_B,
					saida_mux => saida_mux
					);

ula1: ULA  PORT MAP (
					sinal_controle => alu_s,
					A => saida_rp_data,  
					B => saida_rq_data,
					output => entrada_mux_B
					);
					
bancoRegistradores1: BancoRegistrador  PORT MAP (
					w_data => saida_mux,
					w_addr => RF_w_addr,
					w_wr => RF_w_wr,
					rp_addr => RF_rp_addr,
					rp_rd => RF_rp_rd,
					rq_addr => RF_rq_addr,
					rq_rd => RF_rq_rd,
					rp_data => W_data,
					rq_data => saida_rq_data,
					clk => clk2
					);

comparador1 : comparador PORT MAP (
					saida_banco=>saida_rp_data,
					saida_comparador=>RF_rp_zero
					);

disp : display PORT MAP(
			input =>  R_data,
			display1 => display1,
			display2 => display2
			);
 
 END arq ;