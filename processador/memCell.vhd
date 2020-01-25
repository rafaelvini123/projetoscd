library ieee;
use ieee.std_logic_1164.all;

entity memCell is
	port(
		Sy, Sx, W, clk : in std_logic;
		Q : buffer std_logic_vector(15 downto 0);
		datain : in std_logic_vector(15 downto 0);
		dataout : out std_logic_vector(15 downto 0)
	);
end memCell;

architecture behavior of memCell is

component mux_ram is
	port(
		a, b : in std_logic_vector(15 downto 0);
		load : in std_logic;
		s : out std_logic_vector(15 downto 0)
	);
end component;

signal output : std_logic_vector(15 downto 0);
signal ld1, ld2 : std_logic;

begin
	ld1 <= Sy and Sx and W;
	u1 : mux_ram port map(a => Q, b => datain, load => ld1, s => output);
	ld2 <= Sy and Sx;
	u2 : mux_ram port map(a => "0000000000000000", b => Q, load => ld2, s => dataout);
	
	process(clk)
	begin
			if clk'event and clk = '1' then
				Q <= output;
			end if;
	end process;
	
end behavior;