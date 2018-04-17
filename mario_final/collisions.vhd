library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all; --

-------------------------------------------------
-- This module is in charge of catching collisions and handling them
-------------------------------------------------

entity collisions is
port 	(
			CLK  								: in std_logic; 
			RESETn								: in std_logic;
					
			drawing_request_character			: in std_logic ;	
			drawing_request_static				: in std_logic ;	
			drawing_request_bombs_rewards		: in std_logic ;				
			drawing_request_ground				: in std_logic;
			
			collision_left						: in std_logic;
			collision_right						: in std_logic; 
			collision_top						: in std_logic; 
			collision_bottom					: in std_logic;   	
							
			bombs_rewards_type					: in integer ;	 -- 0 for bomb, 1 for coin, 2 for mushroom
			yFrameClk							: in std_logic;
				
			col_left_happened					: out std_logic;
			col_right_happened					: out std_logic; 
			col_top_happened					: out std_logic; 
			col_bottom_happened					: out std_logic; 
			col_static_dynamic					: out std_logic; -- when static and dynamic objects collide, static objects change direction 	
			mario_size							: out std_logic;
			remove_collided						: out std_logic  -- sent back to bombs_rewards to eleminate last collided coin from game
	);		
	
end collisions;

architecture behav of collisions is 
		signal mario_size_sig : std_logic := '0';
		
		begin
	
		process ( RESETn, CLK)
		   begin				
				
				if RESETn = '0' then
					mario_size_sig			<= '0';
					col_left_happened		<= '0';
					col_right_happened		<= '0';
					col_top_happened		<= '0';
					col_bottom_happened		<= '0';
					col_static_dynamic		<= '0';
					remove_collided 		<= '0';
										
				elsif rising_edge(CLK) then
					
					-- defaults
					remove_collided <= '0';
					col_left_happened		<= '0';
					col_right_happened		<= '0';
					col_top_happened		<= '0';
					col_bottom_happened		<= '0';
					col_static_dynamic		<= '0';
					
					if(drawing_request_character = '1' and drawing_request_bombs_rewards = '1') then
						
						remove_collided <= '1'; --need to remove the bomb or reward
						if(bombs_rewards_type = 0) then -- bomb
							if(mario_size_sig = '1') then
								mario_size_sig <= '0';
							end if;
						else -- coin or mushroom
							if (bombs_rewards_type = 2 and mario_size_sig = '0') then -- turn into big mario
								mario_size_sig <= '1';
							end if;
						end if;
					
					end if;
						
					if(drawing_request_character = '1' and (drawing_request_static = '1' or drawing_request_ground = '1')) then
						if(collision_left = '1') then
							col_left_happened <= '1';
						end if;
						
						if (collision_right = '1') then
							col_right_happened <= '1';
						end if;
						
						if(collision_top = '1') then
							col_top_happened <= '1';
						end if;
						
						if (collision_bottom = '1') then
							col_bottom_happened <= '1';
						end if;
					
					end if;
					
					if(drawing_request_bombs_rewards = '1' and drawing_request_static = '1') then
						col_static_dynamic		<= '1';
					end if;
				end if;

		end process;
		
		mario_size <= mario_size_sig ;
				
end behav;		
		