library verilog;
use verilog.vl_types.all;
entity Flip_flop_T is
    port(
        Q               : out    vl_logic;
        CLK             : in     vl_logic;
        Clear           : in     vl_logic;
        T               : in     vl_logic
    );
end Flip_flop_T;
