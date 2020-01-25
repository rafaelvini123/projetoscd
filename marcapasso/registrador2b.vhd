library ieee;
use ieee.std_logic_1164.all;

ENTITY registrador2b IS
	PORT (ep : IN STD_LOGIC_VECTOR (0 to 1);
			clk : IN STD_LOGIC;
			e: BUFFER STD_LOGIC_VECTOR (0 to 1));
END registrador2b;

ARCHITECTURE behavior OF registrador2b IS 
	BEGIN
	PROCESS (clk)
		BEGIN
			IF clk'EVENT AND clk = '1' THEN
				e <= ep;
			END IF;
	END PROCESS;
END behavior;