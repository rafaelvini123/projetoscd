library ieee;
use ieee.std_logic_1164.all;
 
entity pacemaker is
	port(s, clk_in: in std_logic;
		  p: out std_logic);
end pacemaker;

architecture behavior of pacemaker is
	component osc is
		port(clk_in: in std_logic;
				clk_out: buffer std_logic);
	end component;
	
	component controller is
		port(clk, s, z: in std_logic;
			  t, p: out std_logic);
	end component;
	
	component timer is
		port(clk, t : in std_logic;
			  z : out std_logic);
	end component;
	
	component slow is
		port(p, clk : in std_logic;
			  slow_p : out std_logic);
	end component;

	
	signal clkT, clkC, clkS, t, z, slow_p : std_logic;

begin
	component_osc : osc port map(clk_out => clkT, clk_in => clk_in);
	clkC <= clkT;
	clkS <= clkT;
	
	component_timer : timer port map(clk => clkT, t => t, z => z);
	
	component_controller : controller port map(clk => clkC, s => s, z => z, t => t, p => slow_p);
	
	component_slow : slow port map(p => slow_p, clk => clkS, slow_p => p);
end behavior;