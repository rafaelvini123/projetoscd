library ieee;
use ieee.std_logic_1164.all;

entity mux_ram is
	port(
		a, b : in std_logic_vector(15 downto 0);
		load : in std_logic;
		s : out std_logic_vector(15 downto 0)
	);
end mux_ram;

architecture behavior of mux_ram is

begin

	process(load)
	begin
			if load = '1' then
				s <= b;
			else
				s <= a;
			end if;
	end process;
	
end behavior;	