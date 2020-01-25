library verilog;
use verilog.vl_types.all;
entity BancoRegistrador is
    port(
        w_data          : in     vl_logic_vector(15 downto 0);
        w_addr          : in     vl_logic_vector(3 downto 0);
        w_wr            : in     vl_logic;
        rp_addr         : in     vl_logic_vector(3 downto 0);
        rp_rd           : in     vl_logic;
        rq_addr         : in     vl_logic_vector(3 downto 0);
        rq_rd           : in     vl_logic;
        rp_data         : out    vl_logic_vector(15 downto 0);
        rq_data         : out    vl_logic_vector(15 downto 0);
        clk             : in     vl_logic
    );
end BancoRegistrador;
