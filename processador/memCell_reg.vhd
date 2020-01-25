library ieee;
use ieee.std_logic_1164.all;

entity memCell_reg is
	port(
		Sy, Sx, W, clk: in std_logic;
		Q : buffer std_logic_vector(15 downto 0);
		datain : in std_logic_vector(15 downto 0);
		dataout : out std_logic_vector(15 downto 0)
	);
end memCell_reg;

architecture behavior of memCell_reg is

component mux_ram is
	port(
		a, b : in std_logic_vector(15 downto 0);
		load : in std_logic;
		s : out std_logic_vector(15 downto 0)
	);
end component;

signal output : std_logic_vector(15 downto 0);
signal ld, ld_rd : std_logic;

begin
	ld <= Sy and Sx and W;
	u1 : mux_ram port map(a => Q, b => datain, load => ld, s => output);
	
	--ld_rd <= ((Sy_rp and Sx_rp and rd_rp) or (Sy_rq and Sx_rq and rd_rq));
	--u2 : mux_ram port map(a => "0000000000000000", b => Q, load => ld_rd, s => dataout);
	dataout <= Q;
	
	process(clk)
	begin
			if clk'event and clk = '1' then
				Q <= output;
			end if;
	end process;
	
end behavior;