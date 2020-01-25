library ieee;
use ieee.std_logic_1164.all;
 
entity comb_logic is
	port(s, z : in std_logic;
		  e: in std_logic_vector(0 to 1);
		  ep : out std_logic_vector(0 to 1);
		  t, p: out std_logic);
end comb_logic;

architecture behavior of comb_logic is
begin
	ep(0) <= (not s) and z and (not e(0)) and e(1);
	ep(1) <= ( (not e(0)) and (not e(1)) ) or ( (not s) and (not z) and (not e(0)) and (not e(1)) );
	t <= not(e(1) or e(0));
	p <= e(0) and (not e(1));
end behavior;