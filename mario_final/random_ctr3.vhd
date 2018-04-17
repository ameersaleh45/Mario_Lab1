library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity random_ctr3   is
  port (
		CLK 		: in 	std_logic;
		RESETN 		: in 	std_logic; 
		
        random1	 	: out 	std_logic_vector (2 downto 0);
        random2	 	: out 	std_logic_vector (2 downto 0);
        random3	 	: out 	std_logic_vector (2 downto 0)


    );
end entity;

architecture random_ctr3_arch of random_ctr3 is
	signal random1_sig : std_logic_vector (2 downto 0) := "001";
	signal random2_sig : std_logic_vector (2 downto 0) := "011";
	signal random3_sig : std_logic_vector (2 downto 0) := "101";

	
begin

	process(CLK ,RESETN )
	begin
		if (RESETN = '0') then
			random1_sig <= "001";
			random2_sig <= "011";
			random3_sig <= "101";

		elsif rising_edge(CLK) then
			random1_sig <= random1_sig + 5;
			random2_sig <= random2_sig + 3;
			random3_sig <= random3_sig + 1;
		end if;	
		
	end process;
	
	random1 <= random1_sig;
	random2 <= random2_sig;
	random3 <= random3_sig;
	
end random_ctr3_arch; 
