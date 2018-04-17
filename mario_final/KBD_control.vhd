--KBD


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity KBD_control  is
  port (
        RESETN      : in    std_logic;
		CLK         : in    std_logic;
		make		: in    std_logic;
		break		: in    std_logic;
		din			: in    std_logic_vector(8 downto 0);
		
		jump_start			: out 	std_logic; -- indicated long press
		still_pressed_right	: out 	std_logic; -- indicated long press
		still_pressed_left	: out 	std_logic; -- indicated long press
		start				: out 	std_logic; -- player trying to start the game
		make_rand			: out 	std_logic; -- trigger to sample a semi-random number
		still_pressed_map	: out 	std_logic -- indicated long press
    );
end entity;

architecture KBD_arch of KBD_control is

signal jump : std_logic;
signal start_sig : std_logic := '0';
begin
	process(CLK, RESETN)
		begin
		if (RESETN='0') then
			jump_start				<= '0';
			still_pressed_right	    <= '0';
			still_pressed_left		<= '0';
			still_pressed_map		<= '0';
			start_sig 				<= '0';
			make_rand				<= '0';
			
		elsif (rising_edge(CLK)) then
			jump <= '0';
			make_rand <= '0';
			
			if(make = '1') then 		
				if(din="101110101") then --up
					jump <= '1';
				elsif(din="101110100") then --right
					still_pressed_right <= '1';
					still_pressed_left <= '0';
				elsif(din="101101011") then --left
					still_pressed_left <= '1';
					still_pressed_right <= '0';
				elsif(din="000101001") then --space to start
					if(start_sig = '0') then 
						make_rand <= '1'; -- outputs to a module that uses this signal to trigger a counter and sample a semi random number
						start_sig <= '1';
					end if;
				elsif(din="00111010") then --M to show map	
					still_pressed_map <= '1';
				end if;
			elsif(break = '1') then
				if(din="101110101") then --up
					jump <= '0';
				elsif(din="101110100") then --right
					still_pressed_right <= '0';
				elsif(din="101101011") then --left
					still_pressed_left <= '0';
				elsif(din="00111010") then --map M
					still_pressed_map <= '0';	
				end if;
			end if;

		end if;
		start <= start_sig;	
		jump_start <= jump;
	end process;
	

	
end KBD_arch;