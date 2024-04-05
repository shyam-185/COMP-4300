library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bv_arithmetic.all;
use work.dlx_types.all;

entity sign_extend is
    port (
        input:  in  half_word;
        output: out dlx_word  
    );
end entity sign_extend;

architecture behavioral of sign_extend is
begin
    process (input)
    begin
        output <= (15 downto 0 => input(15)) & input after 5 ns;
    end process;
end architecture behavioral;
