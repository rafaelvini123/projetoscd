library verilog;
use verilog.vl_types.all;
entity Memoria_vlg_check_tst is
    port(
        mem_disp        : in     vl_logic_vector(15 downto 0);
        R_data          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Memoria_vlg_check_tst;
