library ieee;
use ieee.std_logic_1164.all;

entity decoder_ram is
	port(
		code : in std_logic_vector(3 downto 0);
		selection : out std_logic_vector(15 downto 0)
	);
end decoder_ram;

architecture behavior of decoder_ram is

begin
	process(code)
	begin
		case code is
		when "0000" =>
			selection(0) <= '1';
		when "0001" =>
			selection(1) <= '1';
		when "0010" =>
			selection(2) <= '1';
		when "0011" =>
			selection(3) <= '1';
		when "0100" =>
			selection(4) <= '1';
		when "0101" =>
			selection(5) <= '1';
		when "0110" =>
			selection(6) <= '1';
		when "0111" =>
			selection(7) <= '1';
		when "1000" =>
			selection(8) <= '1';
		when "1001" =>
			selection(9) <= '1';
		when "1010" =>
			selection(10) <= '1';
		when "1011" =>
			selection(11) <= '1';
		when "1100" =>
			selection(12) <= '1';
		when "1101" =>
			selection(13) <= '1';
		when "1110" =>
			selection(14) <= '1';
		when "1111" =>
			selection(15) <= '1';
		end case;
	end process;
end behavior;