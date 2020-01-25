library verilog;
use verilog.vl_types.all;
entity BancoRegistrador_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        rp_addr         : in     vl_logic_vector(3 downto 0);
        rp_rd           : in     vl_logic;
        rq_addr         : in     vl_logic_vector(3 downto 0);
        rq_rd           : in     vl_logic;
        w_addr          : in     vl_logic_vector(3 downto 0);
        w_data          : in     vl_logic_vector(15 downto 0);
        w_wr            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end BancoRegistrador_vlg_sample_tst;
