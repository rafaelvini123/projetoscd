library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity inversor is
    port (  
			A:IN STD_LOGIC_VECTOR(0 to 3);
         Y:OUT STD_LOGIC_VECTOR(0 to 3)
			);
end inversor;
architecture behavior of inversor is

    begin
    
	 Y<= NOT A;

end behavior; 