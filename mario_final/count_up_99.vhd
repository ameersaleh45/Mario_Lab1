library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity count_up_99   is
  port (
		RESETN 		: in 	std_logic; 
		CLK 		: in 	std_logic;

		ena			: in 	std_logic;
        countL	 	: out 	std_logic_vector (3 downto 0); 
        countH	 	: out 	std_logic_vector (3 downto 0)
		
    );
end entity;

architecture BCD_counter_arch of count_up_99 is

signal sig_countL 		: std_logic_vector (3 downto 0); 
signal sig_countH 		: std_logic_vector (3 downto 0);

begin

	process(CLK ,RESETN )
	begin
		if (RESETN = '0') then
				sig_countL <= "0000";
				sig_countH <= "0000";
				
		elsif rising_edge(CLK) then
			if ena = '1' then
				if (sig_countL = "1001") and (sig_countH = "1001") then
					sig_countL <= "0000";
					sig_countH <= "0000";	
				elsif sig_countL = "1001" and sig_countH < "1001" then
					sig_countL <=	"0000";
					sig_countH <= sig_countH + 1;
				else
					sig_countL <= sig_countL + 1;
				end if;
				
			end if;
		end if;	
		
	end process;
	
	countL <= sig_countL;
	countH <= sig_countH;
	
end BCD_counter_arch; 
