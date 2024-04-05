library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bv_arithmetic.all;
use work.dlx_types.all;

entity dlx_register is

    port (
        in_val: in dlx_word; 
        clock: in bit;        
        out_val: out dlx_word   
    );
end entity dlx_register;

architecture behavioral of dlx_register is
begin
    process (clock)
    begin
        if (rising_edge(clock)) then
            out_val <= in_val after 5 ns; 
        end if;
    end process;
end architecture behavioral;
