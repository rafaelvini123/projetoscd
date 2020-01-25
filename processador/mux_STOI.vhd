library ieee;
use ieee.std_logic_1164.all;

entity mux_STOI is
	port(
		D_addr, mem_STOI : in std_logic_vector(7 downto 0);
		ld_STOI : in std_logic;
		address : out std_logic_vector(7 downto 0)
	);
end mux_STOI;

architecture behavior of mux_STOI is

begin

	process(ld_STOI)
	begin
			if ld_STOI = '1' then
				address <= mem_STOI;
			else
				address <= D_addr;
			end if;
	end process;
	
end behavior;	