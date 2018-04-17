library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_signed.all;
use ieee.numeric_std.all;


entity mario_move is
port 	( 
		CLK					: in std_logic; -- fast clock 27MHz
		RESETn				: in std_logic;
		
		jump				: in std_logic; 
		still_pressed_right	: in std_logic; 
		still_pressed_left	: in std_logic;
		mario_size			: in std_logic;
		game_over			: in std_logic;
		start				: in std_logic;
		col_left_happened	: in std_logic;
		col_right_happened	: in std_logic; 
		col_top_happened	: in std_logic; 
		col_bottom_happened	: in std_logic; 
			
		ObjectStartX		: out integer ;
		ObjectStartY		: out integer ;
		
		win					: out std_logic;
		fall_in_hole		: out std_logic;
		orientation			: out integer;
		map_offset			: out integer ;
		during_jump			: out std_logic;
		xFrameClk			: out std_logic

	);
end mario_move;

architecture behav of mario_move is 
	
	-----------------------------------------
	-- clk dividers that change frequency to simulate accelerating character that still
	-- moves 1 pixel at a time to enhance collision detection (most awesome clock)
	-----------------------------------------
	
	component dividerT is
	  port (CLK 		: in 	std_logic; --Clock, active high
			RESETN 		: in 	std_logic; --Async. Reset, active low
			HZ			: in 	integer;
			speed		: in 	integer;
			rate		: in 	integer;
			slowClk 	: out 	std_logic -- output CLK
			
		);
	end component;
	
	
	-----------------------------------------
	
	signal ObjectStartX_t	 	: integer range -1 to 640;
	signal ObjectStartY_t		: integer range -1 to 480;
	
	constant screenResX		 	: integer := 640;  
	constant floorY 	 		: integer := 418;
	
	constant pipeY				: integer := 353;
	constant brickH1Y			: integer := 289;
	constant brickH2Y			: integer := 225;

	constant mario_X_size 		: integer := 32;
	signal mario_Y_size 		: integer;					-- 64 for large and 32 for small
	
	
	constant Ymax				: integer 	:= 479;
	constant InitYSpeed			: integer 	:= 16;
	signal map_offset_sig 		: integer 	:= 0;
	signal during_jump_sig		: std_logic := '0';
	
	signal Yspeed 				: integer 	:= 0;
	signal Xspeed 				: integer 	:= 0;
	signal clk_frameX			: std_logic := '0';
	signal clk_frameY 			: std_logic := '0';
	constant XaccRate			: integer 	:= 80000; 
	signal win_sig				: std_logic := '0';	
	-----------------------------------------

begin

mario_Y_size <= 32 when mario_size = '0' else 64;

clk_X : dividerT port map(CLK,RESETn,900000,abs(Xspeed),XaccRate, clk_frameX);
clk_Y : dividerT port map(CLK,RESETn,900000,abs(Yspeed),0, clk_frameY);

xFrameClk <= clk_frameX;

	process ( RESETn,CLK)
		variable prev_size 	   : std_logic := '0';
		
		begin
		  if RESETn = '0' then
				ObjectStartX_t	<= 0;
				ObjectStartY_t	<= floorY - 32; -- 32 is small mario's size
				Yspeed <= 0;
				Xspeed <= 0;
				during_jump_sig <= '0';
				map_offset_sig	<= 0;
				fall_in_hole    <= '0';
				prev_size 		:= '0';
				win_sig				<= '0';
				
		elsif rising_edge(CLK) then
		
			if(game_over = '0' and start = '1' and win_sig = '0') then
		
				-------------------------------------------------------------------------------
				-- changes mario starting coordinates in case he changed size in the past cycle
				
				if((mario_size xor prev_size) = '1') then 		--changed size in past cycle
					prev_size := mario_size;
					if(mario_size ='1') then 					--shrinked
						ObjectStartY_t <= ObjectStartY_t - 32;
					else
						ObjectStartY_t <= ObjectStartY_t + 32;
					end if;
				end if;
				
				-------------------------------------------------------------------------------
				-- sets and outputs the orientation of the character to use the right animation
				
				if(still_pressed_right = '1' ) then 			--orientation right
					orientation <= 1;
				elsif(still_pressed_left = '1' ) then 			--orientation left
					orientation <= 2;
				else 											--orientation standing
					orientation <= 0;
				end if;
				
				-------------------------------------------------------------------------------
				--indicating start of jump (if he's standing on something and gets a jump make
				
				if(jump = '1' and during_jump_sig = '0') then-- and col_bottom_happened = '1') then
					Yspeed <= InitYSpeed;
					during_jump_sig <= '1';
				end if;
				
				-------------------------------------------------------------------------------
						
				if (col_bottom_happened = '1') then
					if(Yspeed < 0)then
						during_jump_sig <= '0';
						Yspeed <= 0;
					elsif(ObjectStartY_t > floorY - mario_Y_size) then
						ObjectStartY_t <= floorY - mario_Y_size;
						Yspeed <= 0;
					elsif(ObjectStartY_t > pipeY - mario_Y_size and ObjectStartY_t < floorY - mario_Y_size - 5) then			-- -5 is the guardband
						ObjectStartY_t <= pipeY - mario_Y_size;
						Yspeed <= 0;
					elsif(ObjectStartY_t > brickH1Y - mario_Y_size and ObjectStartY_t < pipeY - mario_Y_size - 5) then
						ObjectStartY_t <= brickH1Y- mario_Y_size;
						Yspeed <= 0;
					elsif(ObjectStartY_t > brickH2Y - mario_Y_size and ObjectStartY_t < brickH1Y - mario_Y_size - 5) then
						ObjectStartY_t <= brickH2Y - mario_Y_size;
						Yspeed <= 0;
					end if;
				end if;	
				
					if(col_top_happened = '1' and Yspeed > 0) then 					-- if mario hits a static 
						Yspeed <= -Yspeed/4;											-- object with his head
					end if;															-- he starts falling
				
				if(ObjectStartY_t >= 470) then										-- check if we fell in a hole
						fall_in_hole <= '1';
				end if;
				
				-------------------------------------------------------------------------------
				
				if(col_left_happened = '1' and Xspeed < 0) then 	--collided on the left side with a static object
					Xspeed <= 0;
				elsif(col_right_happened = '1' and Xspeed > 0) then --collided on the right side with a static object
					Xspeed <= 0;
				end if;
				
				-------------------------------------------------------------------------------
				-- Y axis movment slow clock, 30 fps
				
				if(clk_frameY = '1') then
							   
					if(col_bottom_happened = '0' and Yspeed > -InitYSpeed) then
						Yspeed <= Yspeed - 1;
					end if;
					 
					ObjectStartY_t <= ObjectStartY_t - Yspeed;						
				end if;
				
				-------------------------------------------------------------------------------
			
				if(clk_frameX = '1') then --changing clk frame rate to simulate acceleration
					--speed in X axis
					if(still_pressed_left = '1' and Xspeed > -9 ) then
						Xspeed <= Xspeed - 1;
					elsif(still_pressed_right = '1' and Xspeed < 9) then
						Xspeed <= Xspeed + 1;
					end if;
					
					-- deacceleration when stopping movement
					if(still_pressed_left = '0' and still_pressed_right = '0') then
						if(Xspeed > 0) then
							Xspeed <= Xspeed - 1;
						end if;
						if(Xspeed < 0) then
							Xspeed <= Xspeed + 1;
						end if;
					end if;
				
					-- once the character reaches the middle of the screen it stops moving and instead the screen
					-- starts moving on the opposite direction.	
								
					if(Xspeed > 0 and ObjectStartX_t < screenResX/2) then 		-- character moves right
						ObjectStartX_t <= ObjectStartX_t + 1;
					elsif(Xspeed < 0 and ObjectStartX_t > 0) then 		  		-- character moves left
						ObjectStartX_t <= ObjectStartX_t - 1;
					elsif(Xspeed > 0 and ObjectStartX_t = screenResX/2) then	-- screen shifts
						map_offset_sig <= map_offset_sig + 1;
					end if;
				end if;
				
				-------------------------------------------------------------------------------
				-- check if we reached the end
				if(	map_offset_sig = 3700) then
					win_sig <= '1';
				end if;
				-------------------------------------------------------------------------------
		end if;
		
		end if;
		
	end process ;
	map_offset 		<= map_offset_sig;
	during_jump 	<= during_jump_sig;
	ObjectStartX	<= ObjectStartX_t;			
	ObjectStartY	<= ObjectStartY_t;	
	win				<= win_sig;
end behav;