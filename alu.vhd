use work.dlx_types.all;
use work.bv_arithmetic.all;

entity alu is
	generic(prop_delay: time := 5 ns);
	port(operand1, operand2: in dlx_word; operation: in alu_operation_code;
		signed: in bit;
		result: out dlx_word; error: out error_code);
end entity alu;

architecture behaviour of alu is

begin -- behaviour

  alu_behav: process(operand1,operand2,operation) is
     variable resultval: dlx_word;
     variable errorval : error_code;
     variable ovfl : boolean;
  begin
     case operation is
	when B"0000" =>		--add
	   if signed = '1' then
	      bv_add(operand1,operand2,resultval,ovfl);
	      if ovfl = true then
	        errorval := B"0001";
	      else
	        errorval := B"0000";
	      end if;
	   else
	        bv_addu(operand1,operand2,resultval,ovfl);
	      if ovfl = true then
	        errorval := B"0001";
	      else
	        errorval := B"0000";
	      end if;
	   end if;
	 
	when B"0001" =>		--sub
	   if signed = '1' then
	      bv_sub(operand1,operand2,resultval,ovfl);
	      if ovfl = true then
		 errorval := B"0001";
	      else
	        errorval := B"0000";
	      end if;
	   else
	        bv_subu(operand1,operand2,resultval,ovfl);
	      if ovfl = true then
	        errorval := B"0001";
	      else
	        errorval := B"0000";
	      end if;
	   end if;

	when B"0010" =>		--and
	   resultval := operand1 AND operand2;

	when B"0011" =>		--or
	   resultval := operand1 OR operand2;

	when B"0100" =>		--xor
	   resultval := operand1 XOR operand2;

	when B"0101" =>		--unused
	   resultval := x"00000000";

	when B"0110" => 	--sll unused
	   resultval := x"00000000";

	when B"0111" => 	--srl unused
	   resultval := x"00000000";

	when B"1000" => 	--sra unused
	   resultval := x"00000000";

	when B"1001" => 	--seq unused
	   resultval := x"00000000";

	when B"1010" => 	--sne unused
	   resultval := x"00000000";

	when B"1011" => 	--slt unused
	   if bv_lt(operand1,operand2) then
	     resultval := operand1;
	   end if;

	when B"1100" => 	--sgt unused
	   resultval := x"00000000";

	when B"1101" => 	--unused
	   resultval := x"00000000";

	when B"1110" => 	--mul
	   if signed = '1' then
	   bv_mult(operand1,operand2,resultval,ovfl);
	      if ovfl = true then
	        errorval := B"0001";
	      else
	        errorval := B"0000";
	      end if;
	   else
	      bv_multu(operand1,operand2,resultval,ovfl);
	      if ovfl = true then
	        errorval := B"0001";
	      else
	        errorval := B"0000";
	      end if;
	   end if;

	when B"1111" =>		--div unused
	   resultval := x"00000000";

     end case;
     result <= resultval after prop_delay;
     error <= errorval after prop_delay;
  end process alu_behav;
end architecture behaviour;
	    
