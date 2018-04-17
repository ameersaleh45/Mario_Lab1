library ieee;
use ieee.std_logic_1164.all;


entity check_finish is
port(
	CLK     : in std_logic;
	command : in std_logic_vector(1 downto 0);
	Q1      : in std_logic_vector(13 downto 0);
	Q2      : in std_logic_vector(11 downto 0);
	Q3		: in std_logic_vector(12 downto 0);		
	finish  : out std_logic
);
end check_finish;

architecture bhv of check_finish is
begin

	process(CLK)
	begin
	
		if(rising_edge(CLK)) then
			finish <= '0';
			if(command = "00") then
				if(Q1 = "11111111111111") then 
					finish <= '1';
				end if;
			elsif(command = "01") then
				if(Q2 = "111111111111") then 
					finish <= '1';
				end if;
			elsif(command = "10" ) then
				if(Q3 = "1111111111111") then 
					finish <= '1';
				end if;
			end if;
		end if;
		
	end process;
end bhv;
		

	