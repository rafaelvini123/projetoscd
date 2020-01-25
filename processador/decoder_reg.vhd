library ieee;
use ieee.std_logic_1164.all;

entity decoder_reg is
	port(
		code : in std_logic_vector(1 downto 0);
		selection : out std_logic_vector(3 downto 0)
	);
end decoder_reg;

architecture behavior of decoder_reg is

begin

	selection(0) <= (not code(0)) and (not code(1));
	selection(1) <= (not code(0)) and (code(1));
	selection(2) <= (code(0)) and (not code(1));
	selection(3) <= (code(0)) and (code(1));
	
end behavior;