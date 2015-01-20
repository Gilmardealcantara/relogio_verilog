library verilog;
use verilog.vl_types.all;
entity my_clock is
    port(
        clk_50          : in     vl_logic;
        clk_1           : out    vl_logic
    );
end my_clock;
