library ieee;
use ieee.std_logic_1164.all;
 
entity controller is
	port(clk, s, z: in std_logic;
		  t, p: out std_logic);
end controller;

architecture behavior of controller is

component comb_logic is
	port(s, z : in std_logic;
		  e: in std_logic_vector(0 to 1);
		  ep : out std_logic_vector(0 to 1);
		  t, p: out std_logic);
end component;

component registrador2b IS
	PORT (ep : IN STD_LOGIC_VECTOR (0 to 1);
			clk : IN STD_LOGIC;
			e : BUFFER STD_LOGIC_VECTOR (0 to 1));
END component;

signal e, ep : std_logic_vector(0 to 1);

begin
	logic : comb_logic port map(s => s, z => z, e => e, ep => ep, t => t, p => p);
	reg : registrador2b port map(ep => ep, clk => clk, e => e);
end behavior;