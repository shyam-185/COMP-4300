library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity regfile is
    port (
        read_notwrite, clock : in bit;
        regA, regB:          in  register_index;
        data_in:             in  dlx_word;
        dataA_out, dataB_out: out dlx_word
    );
end entity regfile;

architecture behavioral of regfile is
    type register_array is array (0 to 31) of dlx_word;
    signal registers : register_array := (others => (others => '0'));

begin
    process (clock) 
    begin
      if rising_edge(clock) then
        if (read_notwrite = '0') then
            registers(bv_to_integer(regA)) <= data_in after 5 ns; 
        end if;
      end if;
    end process;

    process (regA, regB, registers)
    begin
      dataA_out <= registers(bv_to_integer(regA)) after 5 ns;
      dataB_out <= registers(bv_to_integer(regB)) after 5 ns;
    end process;

end architecture behavioral;
