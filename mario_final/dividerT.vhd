library ieee;
use ieee.std_logic_1164.all;

entity dividerT is
  port (CLK 		: in 	std_logic; --Clock, active high
        RESETN 		: in 	std_logic; --Async. Reset, active low
        HZ			: in 	integer;
        speed		: in    integer;
        rate		: in 	integer;
        slowClk 	: out 	std_logic -- output CLK
    );
end entity;

architecture CounterT_arch of dividerT is

	signal one_sec_flag : std_logic := '0'; 

	begin
		slowClk  <= one_sec_flag;
	process(CLK,RESETN)
			variable one_sec: integer := 0;
		begin
			
			if RESETN = '0' then
				one_sec := 0 ;
				one_sec_flag <= '0' ;
				
			elsif rising_edge(CLK) then
				
					one_sec := one_sec + 1 ;
					if (one_sec >= HZ-speed*rate) then
						one_sec_flag <= '1';
						one_sec := 0;
					else
						one_sec_flag <= '0';
					end if;
				end if;
	end process;

end CounterT_arch;
