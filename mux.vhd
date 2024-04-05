library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bv_arithmetic.all;
use work.dlx_types.all;

entity mux is
    port (
        input_1, input_0 : in dlx_word; 
        which: in bit;        
        output: out dlx_word   
    );
end entity mux;

architecture behavioral of mux is
begin
    process (input_1, input_0, which)
    begin
        if (which = '1') then
            output <= input_1 after 5 ns; 
        else 
            output <= input_0 after 5 ns;
        end if; 
    end process;
end architecture behavioral;

