library ieee;
use ieee.std_logic_1164.all;
 
entity slow is
	port(p, clk : in std_logic;
		  slow_p : out std_logic);
end slow;

architecture behavior of slow is

signal contador : integer range 0 to 1000;
signal aux : std_logic;

begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
		
		if (p = '1') then
			aux <= '1';
			slow_p <= '1';
		end if;
		
		if (aux = '1') then
		contador <= contador + 1;
		end if;
		
		if (contador = 100) then
			aux <= '0';
			contador <= 0;
			slow_p <= '0';
		end if;
		
		end if;
	end process;
end behavior;