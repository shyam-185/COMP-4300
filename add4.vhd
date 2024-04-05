library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_types.all;  
use work.bv_arithmetic.all;  

entity add4 is
    port (
        input:  in  dlx_word;  
        output: out dlx_word  
    );
end entity add4;

architecture behavioral of add4 is
begin
    process (input)
        variable temp_result : dlx_word;
        variable ovfl : boolean;          
    begin
        bv_addu(input, "00000000000000000000000000000100", temp_result, ovfl); 
        output <= temp_result after 5 ns; 
    end process;
end architecture behavioral;


