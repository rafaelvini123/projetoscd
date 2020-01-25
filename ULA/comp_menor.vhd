library IEEE;

    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;

    entity comp_menor is
    port (  
			A:IN STD_LOGIC_VECTOR(0 to 3);
         B:IN STD_LOGIC_VECTOR(0 to 3);
			Co: out STD_LOGIC;
         AmenorB:OUT STD_LOGIC
			);

    end comp_menor;

    architecture behavior of comp_menor is

    begin
    
    with A < B select

    AmenorB <=   '1' when true,
        '0' when others;
	 if A < B then
		Co<='1';
	 end if;

    end behavior; 