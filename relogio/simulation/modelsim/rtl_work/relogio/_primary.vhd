library verilog;
use verilog.vl_types.all;
entity relogio is
    port(
        Q0              : out    vl_logic_vector(3 downto 0);
        Q1              : out    vl_logic_vector(3 downto 0);
        Q2              : out    vl_logic_vector(3 downto 0);
        Q3              : out    vl_logic_vector(3 downto 0);
        Q4              : out    vl_logic_vector(3 downto 0);
        Q5              : out    vl_logic_vector(3 downto 0);
        En              : in     vl_logic;
        Clk             : in     vl_logic;
        Clear           : in     vl_logic
    );
end relogio;
