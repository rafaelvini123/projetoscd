library ieee;
use ieee.std_logic_1164.all;
 
entity timer is
	port(clk, t : in std_logic;
		  z : out std_logic);
end timer;

architecture behavior of timer is

signal contador: integer range 0 to 1600;

begin
	process(clk, t)
	begin
		if clk'event and clk = '1' then
			contador <= contador + 1;
			
			if(t = '1') then
				contador <= 0;
			end if;
			
			if (contador = 800) then
				z <= '1';
			end if;
		end if;
	end process;
end behavior;