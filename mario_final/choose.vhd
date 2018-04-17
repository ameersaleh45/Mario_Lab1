library ieee;
use ieee.std_logic_1164.all;


entity choose is
port(
	CLK: in std_logic;
	jump : in std_logic_vector(7 downto 0);
	bomb : in std_logic_vector(7 downto 0);
	coin : in std_logic_vector(7 downto 0);
	--Q4 : in std_logic_vector(7 downto 0);
	--Q5 : in std_logic_vector(7 downto 0);
	--Q6 : in std_logic_vector(7 downto 0);
	
	mux : in std_logic_vector(1 downto 0);
	
	qout : out std_logic_vector(7 downto 0)
);
end choose;

architecture bhv of choose is
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			if(mux = "00") then
			qout <= jump;
			elsif(mux = "01") then
			qout <= bomb;
			elsif(mux = "10") then
			qout <= coin; 
			else
			qout <= "00000000";
			end if;
		end if;	
	end process;
		
end bhv;
				
				