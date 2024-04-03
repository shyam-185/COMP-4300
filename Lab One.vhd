entity flipflop is
	port(clk: in bit; result: out bit);
end entity flipflop;

architecture behavior of fiipflop is
begin

	flipflopprocess : process (clk) is
	variable state: bit ;
	begin
		if (clk = '1') then
			if (state = '1') then
				state := '1';
			end if;
			result <= state after 15 ns;
		end if;
	end process flipflopprocess;
end architecture behavior;

