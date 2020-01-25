library verilog;
use verilog.vl_types.all;
entity Memoria_vlg_sample_tst is
    port(
        addr            : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rd              : in     vl_logic;
        W_data          : in     vl_logic_vector(15 downto 0);
        wr              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Memoria_vlg_sample_tst;
