library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity display is
	port(
		input: in std_logic_vector(15 downto 0);
		display1, display2: out std_logic_vector(6 downto 0)
	);
end display;

architecture arq of display is
		begin
			process(input)
				begin
				case input is
					when "0000000000000000" => --0
						display1 <= "0000001";
						display2 <= "0000001";
					when "0000000000000001" => --1
						display1 <= "0000001";
						display2 <= "1001111";
					when "0000000000000010" => --2
						display1 <= "0000001";
						display2 <= "0010010";
					when "0000000000000011" => --3
						display1 <= "0000001";
						display2 <= "0000110";
					when "0000000000000100" => --4
						display1 <= "0000001";
						display2 <= "1001100";
					when "0000000000000101" => --5
						display1 <= "0000001";
						display2 <= "0100100";
					when "0000000000000110" => --6
						display1 <= "0000001";
						display2 <= "0100000";
					when "0000000000000111" => --7 
						display1 <= "0000001";
						display2 <= "0001111";
					when "0000000000001000" => --8
						display1 <= "0000001";
						display2 <= "0000000";
					when "0000000000001001" => --9
						display1 <= "0000001";
						display2 <= "0000100";
					when "0000000000001010" => --10
						display1 <= "1001111";
						display2 <= "0000001";
					when "0000000000001011" => --11
						display1 <= "1001111";
						display2 <= "1001111";
					when "0000000000001100" => --12
						display1 <= "1001111";
						display2 <= "0010010";
					when "0000000000001101" => --13
						display1 <= "1001111";
						display2 <= "0000110";
					when "0000000000001110" => --14
						display1 <= "1001111";
						display2 <= "1001100";
					when "0000000000001111" => --15
						display1 <= "1001111";
						display2 <= "0100100";
					when others => null;	
				end case;
			end process;
end arq;