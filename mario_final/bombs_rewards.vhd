library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all; --

-------------------------------------------------
-- This module is in charge printing the character 
-- on the screen in the right orientation, size, and color
-------------------------------------------------

entity bombs_rewards is
	port 	(
	   	CLK  					: in std_logic; 
		RESETn					: in std_logic;
		
		oCoord_X				: in integer;					 -- current pixel that the VGA controller is handling
		oCoord_Y				: in integer;
		map_offset				: in integer;					 -- current screen game offset from beginning 
		start					: in std_logic;
		remove_collided_reward  : in std_logic;					 -- remove last collided  
		make_rand				: in std_logic;
		bombs_rewards_type		: out integer;						 -- 0 for bomb, 1 for coin, 2 for mushroom
		drawing_request			: out std_logic ;					 -- whether an object exists in current pixel
		mVGA_RGB 				: out std_logic_vector(7 downto 0);  -- color of current character pixel in 8bit	
		update_score			: out std_logic;	 				 --	holds the current score of the game 
		game_over				: out std_logic;
		bomb_hit				: out std_logic 					-- used to trigger hit sound
	);
	
end bombs_rewards;

architecture behav of bombs_rewards is 

	--------------------------------------------------
	-- roms of the game objects (rewards and bombs)
	--------------------------------------------------
	
	COMPONENT generic_object IS
		port (
					CLK  			: in std_logic; 
					RESETn			: in std_logic;
					
					oCoord_X		: in integer;						 
					oCoord_Y		: in integer;
					map_offset		: in integer;
					
					ObjectStartX	: in integer;						
					ObjectStartY 	: in integer;
					object_X_size	: in integer;
					object_Y_size 	: in integer;
					
					drawing_request	: out std_logic ;
					address 		: out integer  			
			);
	
	END COMPONENT;
	
	---------------------objects---------------------
	type drawing_requests_array			 is array (0 to 10) of std_logic;
	-------------------------------------------------- 
	constant bombSizeX : integer := 32;
	constant bombSizeY : integer := 32;
	
	COMPONENT pic_bomb IS
		PORT
		(
			ADDR   		: in integer range 0 to (bombSizeX*bombSizeY - 1);
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;	
	
	signal muxed_bomb 				: integer range 0 to (bombSizeX*bombSizeY - 1);
	signal bomb_rgb 				: std_logic_vector (7 downto 0);
	signal drawing_request_bomb		: std_logic := '0';
	signal bombs_dr			 		: drawing_requests_array := ( others => '0' );
	-------------------------------------------------- 
	
	constant coinSizeX : integer := 16;
	constant coinSizeY : integer := 28;
	
	COMPONENT pic_coin IS
		PORT
		(
			ADDR   		: in integer range 0 to (coinSizeX*coinSizeY - 1);
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
		
	signal muxed_coin				: integer range 0 to (coinSizeX*coinSizeY - 1);
	signal coin_rgb					: std_logic_vector (7 downto 0);
	signal drawing_request_coin		: std_logic := '0';
	signal coins_dr			 		: drawing_requests_array := ( others => '0' );
	-------------------------------------------------- 
	
	
	constant rocketSizeX : integer := 32;
	constant rocketSizeY : integer := 28;
	
	COMPONENT pic_rocket IS
		PORT
		(
			ADDR   		: in integer range 0 to (rocketSizeX*rocketSizeY - 1);
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
		
	signal muxed_rocket				: integer range 0 to (rocketSizeX*rocketSizeY - 1);
	signal rocket_rgb				: std_logic_vector (7 downto 0);
	signal drawing_request_rocket	: std_logic := '0';
	signal rocket_dr			 	: std_logic := '0';
	signal rocket_address			: integer := 0;
	-------------------------------------------------- 
	constant starSizeX : integer := 28;
	constant starSizeY : integer := 32;
	
	COMPONENT pic_star IS
		PORT
		(
			ADDR   		: in integer range 0 to (starSizeX*starSizeY - 1);
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
		
	signal muxed_star				: integer range 0 to (starSizeX*starSizeY - 1);
	signal star_rgb					: std_logic_vector (7 downto 0);
	signal drawing_request_star		: std_logic := '0';
	signal star_dr			 		: std_logic := '0';
	signal star_address				: integer := 0;
	-------------------------------------------------- 
	constant mushroomSizeX : integer := 32;
	constant mushroomSizeY : integer := 32;
	
	COMPONENT pic_super_mushroom IS
		PORT
		(
			ADDR   		: in integer range 0 to (mushroomSizeX*mushroomSizeY - 1);
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	
	signal muxed_super_mushroom 		: integer range 0 to (mushroomSizeX*mushroomSizeY - 1);
	signal super_mushroom_rgb			: std_logic_vector (7 downto 0);
	signal drawing_request_superMush	: std_logic := '0';
	signal super_mushrooms_dr			: drawing_requests_array := ( others => '0' );
	-------------------------------------------------- 

	constant heartSizeX 		: integer := 15;
	constant heartSizeY 		: integer := 15;
	
	COMPONENT pic_heart IS
		port(
			ADDR    : in integer range 0 to (heartSizeX*heartSizeY - 1);
			Q       : out std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	signal muxed_heart					: integer range 0 to (heartSizeX*heartSizeY - 1) := 0;
	signal heart_rgb					: std_logic_vector (7 downto 0);
	signal drawing_request_heart		: std_logic := '0';
	signal hearts_dr		 			: drawing_requests_array := ( others => '0' );
	
	--------------------------------------------------
	
	signal drawing_request_sig			: std_logic := '0';				-- global drawing request
	type addresses_array				 is array (0 to 9) of integer;

	-----------------------------------------------------
	-- arrays containing coordinates 
	-----------------------------------------------------
	type object_locations			 	 is array (0 to 9) of integer;
	type rewards_still_active			 is array (0 to 10) of integer; 				-- indicates if the rewards have been touched or still active
	
	constant bombs_XrightLmt			: object_locations := (7,15,30,39,49,63,74,86,8,81);
	constant bombs_XleftLmt				: object_locations := (2,8,20,34,44,52,68,78,6,80);
																
	constant bombs_locsY				: object_locations := (384,384,384,384,384,384,384,384,256,256);
	
	signal bombs_addresses				: addresses_array := ( others => 0 );
	signal bombs_still_active			: rewards_still_active := (others => 1 );
	-----------------------------------------------------
	
	constant coins_locsX	 			: object_locations := (200,232,264,600, 800, 950, 1250,1400,1800,2000);
	constant coins_locsY	 			: object_locations := (317,317,317, 360, 270,270,360,317,317,256);
	signal coins_addresses				: addresses_array := ( others => 0 );
	signal coins_still_active			: rewards_still_active := (others => 1 );
	-----------------------------------------------------
	
	constant super_mushrooms_locsX		: object_locations := ( 432,2080,0,0,0,0,0,0,0,0 ); --we have only two mushrooms in the game
	constant super_mushrooms_locsY		: object_locations := ( 192,256,0,0,0,0,0,0,0,0 );
	signal super_mushrooms_addresses	: addresses_array := ( others => 0 );
	signal mushrooms_still_active		: rewards_still_active := (1,1,others => 0 );
	-----------------------------------------------------
	
	constant hearts_locsX				: object_locations := (615,595,575,555,535, others => 10000);	
	constant hearts_locsY				: object_locations := (10,10,10,10,10	  , others => 10000);	
	signal hearts_addresses	 			: addresses_array := ( others => 0 );
	signal hearts_still_active			: rewards_still_active := (1,1,1,0,0, others => 0);  -- we only have up to five lives but w use a general array type
	-----------------------------------------------------
	
	--saving the last drawing request item so we can remove it from the game in case we detected collision with character in the past cycle
	type  last_dr_object  is (coin, mushroom, bomb);
	signal last_dr_index : integer;
	signal last_dr_type  : last_dr_object;
	
	-----------------------------------------------------
	component dividerT is	--one HZ clk
	port (
		CLK 		: in 	std_logic; --Clock, active high
        RESETN 		: in 	std_logic; --Async. Reset, active low
        HZ			: in 	integer;
        speed		: in    integer;
        rate		: in 	integer;
        slowClk 	: out 	std_logic -- output CLK
    );
	end component;
	------------------------------------------------------
	component rand_counter IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END component;
	------------------------------------------------------
	
	constant xLocksMultiplier : integer := 32;
	
	type arrXbombs is array (0 to 9) of integer;
	signal XspeedBombs			: arrXbombs 	:= (others => 0);
	signal XCtrBombs			: arrXbombs 	:= (others => 0);
	signal bombs_locsX			: arrXbombs		:= (224,256,960,1088,1568,1664,2368,2496,192,2560);
	signal clk_frameXbombs		: std_logic := '0';
	signal rand_out				: std_logic_vector(15 downto 0);
	
	signal rocketX				: integer := 640;	
	signal rocketSpeed			: integer := 15;
	signal rocketCtr			: integer := 0;
	signal starX				: integer := 640;
	signal starSpeed			: integer := 15;
	signal starCtr				: integer := 0;
	
	begin
		
		-- one rom per object, multiple readers
				
		bomb_rom			: pic_bomb 				port map(muxed_bomb,bomb_rgb);
		coin_rom			: pic_coin	 			port map(muxed_coin,coin_rgb);
		super_mushroom_rom  : pic_super_mushroom 	port map(muxed_super_mushroom,super_mushroom_rgb);
		heart_rom			: pic_heart				port map(muxed_heart,heart_rgb);
		rocket_rom			: pic_rocket			port map(muxed_rocket,rocket_rgb);
		star_rom			: pic_star				port map(muxed_star,star_rgb);
			
		-----------------------------------------------------------------
		-- moving objects of the game 
		-----------------------------------------------------------------
		clk_bombsX : dividerT port map(CLK,RESETn,80000,0,0, clk_frameXbombs);
		rand_maker : rand_counter port map(CLK, rand_out);
		
		bombs :				for i in 0 to 9 generate
								bombs :generic_object port map(CLK, RESETn, oCoord_X, oCoord_Y, map_offset, bombs_locsX(i),bombs_locsY(i), bombSizeX, bombSizeY,bombs_dr(i), bombs_addresses(i));
							end generate bombs;
							
		coins :				for i in 0 to 9 generate
								coins :generic_object port map(CLK, RESETn, oCoord_X, oCoord_Y, map_offset, coins_locsX(i)  , coins_locsY(i), coinSizeX, coinSizeY,coins_dr(i), coins_addresses(i));
							end generate coins;
		
		
		super_mushrooms :	for i in 0 to 9 generate
								super_mushrooms :generic_object port map(CLK, RESETn, oCoord_X, oCoord_Y, map_offset, super_mushrooms_locsX(i), super_mushrooms_locsY(i), mushroomSizeX, mushroomSizeY, super_mushrooms_dr(i), super_mushrooms_addresses(i));
							end generate super_mushrooms;
		
		hearts :			for i in 0 to 4 generate
								hearts :generic_object port map(CLK, RESETn, oCoord_X, oCoord_Y, 0, hearts_locsX(i), hearts_locsY(i), heartSizeX, heartSizeY, hearts_dr(i), hearts_addresses(i));
							end generate hearts;
		 
		rocket :	generic_object port map(CLK, RESETn, oCoord_X, oCoord_Y, map_offset, rocketX ,356, rocketSizeX, rocketSizeY, rocket_dr, rocket_address);
		
		star:		generic_object port map(CLK, RESETn, oCoord_X, oCoord_Y, map_offset, starX ,164, starSizeX, starSizeY, star_dr, star_address);

							
		 process ( RESETn, CLK)
			variable lives 			: integer := 3;
			variable random_num     : std_logic_vector(15 downto 0) := (others => '0');
			
			begin
				if RESETn = '0' then
					drawing_request			<= '0' ;				
					mVGA_RGB 				<= (others => '0');	
					muxed_bomb 				<= 0;
					muxed_super_mushroom 	<= 0;
					muxed_coin 				<= 0;
					muxed_heart				<= 0;
					coins_still_active	  	<= (others => 1 );
					mushrooms_still_active  <= (1,1, others => 0 );
					bombs_still_active		<= (others => 1 );
					hearts_still_active		<= (1,1,1,0,0, others => 0);
					lives					:= 3;
					game_over 				<= '0';
					XspeedBombs				<= (others => 0);
					XCtrBombs				<= (others => 0);
					bombs_locsX				<= (224,256,960,1088,1568,1664,2368,2496,192,2560);
					rocketX					<= 640;	
					starX		 			<= 640;
					starCtr					<= 0;
					rocketCtr				<= 0;
					bomb_hit				<= '0';
					
				elsif rising_edge(CLK) then
			
						drawing_request_sig <= '0';
						update_score 		<= '0';
						bomb_hit			<= '0';
					------------------------------------------------------------------------------
					-- removing coins and mushrooms collided with the character in the previous cycle
					------------------------------------------------------------------------------
					
						if(remove_collided_reward = '1') then
							if(last_dr_type = coin and coins_still_active(last_dr_index) = 1) then
								coins_still_active(last_dr_index) <= 0;
								update_score <= '1';
								
							elsif(last_dr_type = mushroom and mushrooms_still_active(last_dr_index) = 1) then
								mushrooms_still_active(last_dr_index) <= 0;
								update_score 						  <= '1';
								hearts_still_active(lives) 	 		  <= 1;
								lives 						 		  := lives + 1;
									
							elsif(last_dr_type = bomb and bombs_still_active(last_dr_index) = 1) then
								bombs_still_active(last_dr_index) 	<= 0;
								lives							  	:= lives - 1;
								bomb_hit							<= '1';
								hearts_still_active(lives) 			<= 0;
								if(lives = 0) then
									game_over <= '1';
								end if;
							end if;
						end if;
						
					------------------------------------------------------------------------------
					-- moving the bombs
					------------------------------------------------------------------------------	
					if(make_rand = '1') then -- giving each bomb a random speed
						random_num := rand_out;
						for i in 0 to 9 loop
							XspeedBombs(i) <= conv_integer(unsigned(random_num(i+5 downto i)));
						end loop;
						starSpeed <= conv_integer(unsigned(random_num(6 downto 3)))+2;
						rocketSpeed <= conv_integer(unsigned(random_num(13 downto 10)))+2;
					end if;
					
					if(start = '1') then
						if(clk_frameXbombs = '1') then 
							for i in 0 to 9 loop
								if((bombs_locsX(i) >=  bombs_XrightLmt(i)*xLocksMultiplier and XspeedBombs(i) > 0) or(bombs_locsX(i) <= bombs_XleftLmt(i)*xLocksMultiplier and XspeedBombs(i) < 0)) then
									XCtrBombs(i) <= 0;
									XspeedBombs(i) <= -XspeedBombs(i);
								end if;
								
								if(XCtrBombs(i) = XspeedBombs(i)) then
									if(XspeedBombs(i) > 0 ) then
										bombs_locsX(i) <= bombs_locsX(i) + 1;
									else
										bombs_locsX(i) <= bombs_locsX(i) - 1;
									end if;
									XCtrBombs(i) <= 0;
								elsif(XspeedBombs(i) > 0) then 
									XCtrBombs(i) <= XCtrBombs(i) + 1;
								elsif(XspeedBombs(i) < 0) then
									XCtrBombs(i) <= XCtrBombs(i) - 1;
								end if;
							end loop;
							
					-------------------------------------------------------------------------
					--moving the rocket and star
					-------------------------------------------------------------------------
							
							starCtr <= starCtr + 1;
							rocketCtr <= rocketCtr + 1;
							
							if(starCtr >= starSpeed) then
								starX <= starX -3;
								starCtr <= 0;
							end if;
							
							if (rocketCtr >= rocketSpeed) then
								rocketX <= rocketX -3;
								rocketCtr <= 0;
							end if;
							
							if bombs_still_active(10) = 0 then
								bombs_still_active(10) <= 1;
								rocketX <= map_offset- 640;
							end if;
							
							if coins_still_active(10) = 0 then
								coins_still_active(10) <= 1;
								starX <= map_offset- 640;
							end if;
							
						end if;
					end if;			
						
						if(starX < map_offset - 320) then -- reached end of screen, randomie a new one
							starX <= map_offset + 760;
							starSpeed <= conv_integer(unsigned(rand_out(7 downto 4)))+2;
							
						end if;
						
						if(rocketX < map_offset - 320) then -- reached end of screen, randomie a new one
							rocketX <= map_offset + 760;
							rocketSpeed <= conv_integer(unsigned(rand_out(9 downto 6)))+2;
							
						end if;
						
						-----------------------------------------------------------------------------------------	
						-- muxing the object in current scanned VGA pixel from arrays of different dynamic objects
						-----------------------------------------------------------------------------------------
							
						if(rocket_dr = '1' and bombs_still_active(10) = 1) then 						-- rocket
								drawing_request_sig <= '1';
								last_dr_type <= bomb;
								last_dr_index <= 10;
								bombs_rewards_type <= 0;
								muxed_rocket <= rocket_address;
								mVGA_RGB <= rocket_rgb;
						elsif(star_dr = '1' and coins_still_active(10) = 1) then 						-- star
								drawing_request_sig <= '1';
								last_dr_type <= coin;
								last_dr_index <= 10;
								bombs_rewards_type <= 1;
								muxed_star <= star_address;
								mVGA_RGB <= star_rgb;
						end if;
						
								
						for i in 0 to 9 loop
							if(bombs_dr(i) = '1' and bombs_still_active(i) = 1) then 					-- bombs
								drawing_request_sig <= '1';
								last_dr_type <= bomb;
								last_dr_index <= i;
								bombs_rewards_type <= 0;
								muxed_bomb <= bombs_addresses(i);
								mVGA_RGB <= bomb_rgb;
								exit;
							elsif(super_mushrooms_dr(i) = '1' and mushrooms_still_active(i) = 1) then 	-- mushrooms
								drawing_request_sig <= '1';
								last_dr_type <= mushroom;
								last_dr_index <= i;
								bombs_rewards_type <= 2;
								muxed_super_mushroom <= super_mushrooms_addresses(i);
								mVGA_RGB <= super_mushroom_rgb;
								exit;						
							elsif(coins_dr(i) = '1' and coins_still_active(i) = 1) then 				-- coins
								drawing_request_sig <= '1';
								last_dr_type <= coin;
								last_dr_index <= i;
								bombs_rewards_type <= 1;
								muxed_coin <= coins_addresses(i);
								mVGA_RGB <= coin_rgb;
								exit;
							elsif(hearts_dr(i) = '1' and hearts_still_active(i) = 1) then 				-- hearts (we have only 5 hearts but we can ignore indexes 5 to 9 because dr = 0)
								drawing_request_sig <= '1';
								muxed_heart <= hearts_addresses(i);
								mVGA_RGB <= heart_rgb;
								exit;							
							end if;
						end loop;
						
						-----------------------------------------------------------------------------------------
																
						drawing_request <= drawing_request_sig;
					end if;	
		 end process;

				
end behav;		
		