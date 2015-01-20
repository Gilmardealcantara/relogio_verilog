library verilog;
use verilog.vl_types.all;
entity contador_2 is
    port(
        q               : out    vl_logic_vector(3 downto 0);
        En              : in     vl_logic;
        Clk             : in     vl_logic;
        Clear1          : in     vl_logic
    );
end contador_2;
