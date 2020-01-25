library verilog;
use verilog.vl_types.all;
entity Memoria is
    port(
        addr            : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        W_data          : in     vl_logic_vector(15 downto 0);
        R_data          : out    vl_logic_vector(15 downto 0);
        mem_disp        : out    vl_logic_vector(15 downto 0)
    );
end Memoria;
