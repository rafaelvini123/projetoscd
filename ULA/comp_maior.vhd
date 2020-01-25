library IEEE;

    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;

    entity comp_maior is
    port (  
			A:IN STD_LOGIC_VECTOR(0 to 3);
         B:IN STD_LOGIC_VECTOR(0 to 3);
         AmaiorB:OUT STD_LOGIC;
			Co: out std_LOGIC
			);

    end comp_maior;

    architecture behavior of comp_maior is

    begin
    
    with A > B select

    AmaiorB <=   '1' when true,
        '0' when others;
	 
	 if A > B then
		Co<='1';
	 end if;
    end behavior; 