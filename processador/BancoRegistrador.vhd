library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;


entity BancoRegistrador is
	port(
		w_data: in std_logic_vector(15 downto 0);
		w_addr: in std_logic_vector(3 downto 0);
		w_wr: in std_logic;
		rp_addr: in std_logic_vector(3 downto 0);
		rp_rd: in std_logic;
		rq_addr: in std_logic_vector(3 downto 0);
		rq_rd: in std_logic;
		rp_data: out std_logic_vector(15 downto 0);
		rq_data: out std_logic_vector(15 downto 0);
		clk: in std_logic
		);

end BancoRegistrador;

architecture arq of BancoRegistrador is
	type registrador_matriz is array (0 to 15) of std_logic_vector(15 downto 0);
	signal registrador : registrador_matriz := (others => (others =>'0'));
	signal addr_w : integer;
	signal addr_rp : integer;
	signal addr_rq : integer;
	begin
		process(clk)
			begin
			addr_w <= to_integer(unsigned(w_addr));
			addr_rp <= to_integer(unsigned(rp_addr));
			addr_rq <= to_integer(unsigned(rq_addr));
			
			if(rising_edge(clk)) then
			
				registrador(1) <= "0000000000000001"; -- 1
				registrador(2) <= "0000000000000010"; -- 2
			
				if (rq_rd = '1') then
					rq_data <= registrador(addr_rq);
				end if;
				
				if (rp_rd = '1') then
					rp_data <= registrador(addr_rp);
				end if;
				
				if (w_wr = '1') then
					registrador(addr_w) <= w_data;
				end if;
				
			end if;
		end process;	
end arq;