library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all; --

-------------------------------------------------
-- This module is in charge printing the character 
-- on the screen in the right orientation, size, and color
-------------------------------------------------

entity mario_character is
port 	(
	   	CLK  			: in std_logic; 
		RESETn			: in std_logic;
		
		oCoord_X		: in integer;					 -- current pixel that the VGA controller is handling
		oCoord_Y		: in integer;
		
		ObjectStartX	: in integer;					 -- current coordinates of upper left pixel of the char
		ObjectStartY 	: in integer;
		
		orientation 	: integer;						 -- not moving 0 moving left 2, moving right 1
		during_jump		: in std_logic;					 -- character during jump '1', else '0'
		mario_size		: in std_logic;					 -- '0' for small mario and '1' for big mario
		xFrameClk		: in std_logic;					 -- slow (frequency changing) clk of pictures frame
				
		collision_left			: out std_logic;
		collision_right			: out std_logic; 
		collision_top			: out std_logic; 
		collision_bottom		: out std_logic;   					
		
		drawing_request	: out std_logic ;					 -- whether to print the character on current pixel or not
		mVGA_RGB 		: out std_logic_vector(7 downto 0)   -- color of current character pixel in 8bit

	);
end mario_character;

architecture behav of mario_character is 
		
		------ roms containing character movements -----
		
		component pic_big_mario_walk1 is
			port(
				ADDR    : in integer range 0 to 2047;
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;
		
		
		signal RGB_rom_bwalk1		: std_logic_vector(7 downto 0);
		
		-------------------------------------------------
		
		component pic_small_mario_walk1 is
			port(
				ADDR    	: in integer range 0 to 1023;
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;
		
		
		signal RGB_rom_swalk1		: std_logic_vector(7 downto 0);
		
		-------------------------------------------------
		
		component pic_big_mario_walk2 is
			port(
				ADDR    : in integer range 0 to 2047;
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;
		
		signal RGB_rom_bwalk2		: std_logic_vector(7 downto 0);
		
		-------------------------------------------------
		
		component pic_small_mario_walk2 is
			port(
				ADDR    : in integer range 0 to 1023;
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;
		
		
		signal RGB_rom_swalk2		: std_logic_vector(7 downto 0);
		
		-------------------------------------------------
				
		component pic_big_mario_jump is
			port
			(
				ADDR    : in integer range 0 to 2047;
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;
		
		
		signal RGB_rom_bjump		: std_logic_vector(7 downto 0);
		

		-------------------------------------------------
		
		component pic_small_mario_jump is
			port
			(
				ADDR    : in integer range 0 to 1023;
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;
		
		signal RGB_rom_sjump		: std_logic_vector(7 downto 0);
		
		-------------------------------------------------
		
		signal bCoord_X : integer := 0;
		signal bCoord_Y : integer := 0;

		signal drawing_X : std_logic := '0';
		signal drawing_Y : std_logic := '0';

		signal objectEastXboundary : integer;
		signal objectSouthboundary : integer;
						
		-------------------------------------------------
		
		constant object_X_size 			: integer := 32;
		constant small_mario_Y_size 	: integer := 32;
		constant big_mario_Y_size 		: integer := 64;
		constant pixels_between_steps 	: integer := 40;	 --number of pixels between each feet change to make walking animation
		signal object_Y_size 			: integer;
	
		-------------------------------------------------
		
		signal address_rom_big 			: integer range 0 to 2047 := 0;
		signal address_rom_small 		: integer range 0 to 1023 := 0;
				
		-------------------------------------------------
		
		type char_state  is (small_1, small_2, big_1, big_2, jump_small, jump_big); --idle is 1 (big or small)
		signal current : char_state;
		
		-------------------------------------------------
		
		begin

		m_bwalk1: pic_big_mario_walk1 	port map(address_rom_big,RGB_rom_bwalk1);
		m_swalk1: pic_small_mario_walk1 port map(address_rom_small,RGB_rom_swalk1);
		m_bwalk2: pic_big_mario_walk2 	port map(address_rom_big,RGB_rom_bwalk2);
		m_swalk2: pic_small_mario_walk2 port map(address_rom_small,RGB_rom_swalk2);
		m_bjump: pic_big_mario_jump		port map(address_rom_big,RGB_rom_bjump);
		m_sjump: pic_small_mario_jump 	port map(address_rom_small,RGB_rom_sjump);
		
		-------------------------------------------------
		
		object_Y_size 			<= small_mario_Y_size when mario_size = '0' else big_mario_Y_size;
		objectEastXboundary		<= object_X_size + ObjectStartX;
		objectSouthboundary		<= object_Y_size + ObjectStartY;   

		-- Signals drawing_X[Y] are active when obects coordinates are being crossed

			drawing_X	<= '1' when  (oCoord_X  >= ObjectStartX) and  (oCoord_X < objectEastXboundary) else '0';
			drawing_Y	<= '1' when  (oCoord_Y  >= ObjectStartY) and  (oCoord_Y < objectSouthboundary) else '0';

			bCoord_X 	<= (oCoord_X - ObjectStartX) when ( drawing_X = '1' and  drawing_Y = '1'  ) else 0 ; 
			bCoord_Y 	<= (oCoord_Y - ObjectStartY) when ( drawing_X = '1' and  drawing_Y = '1'  ) else 0 ; 
	

		process ( RESETn, CLK)
		  
			variable current_walking_state 		 : std_logic := '0';
			variable current_count 				 : integer := 0;
			
			-----------------------------------------------------------------------------------------------------------------------
			
			begin
				if RESETn = '0' then
					mVGA_RGB					<=  (others => '0') ; 	
					drawing_request				<= '0' ;
					current_count 				:= 0;	
					current 					<= small_1;
					collision_left				<= '0' ;
					collision_right				<= '0' ;
					collision_top				<= '0' ;
					collision_bottom			<= '0' ; 	
									
				elsif rising_edge(CLK) then
									
					collision_left		<= '0' ;
					collision_right		<= '0' ;
					collision_top		<= '0' ;
					collision_bottom	<= '0' ; 	
					
					-----------------------------------------------------------------------------------------------------------------------
							
					if(xFrameClk = '1') then	--counting how many pixels have progressed in current state (for animating the character)
						current_count := current_count + 1;
					end if;
					
					if(orientation = 0) then	--we don't want changing legs when the character is standing still
						current_count := 0;
					end if;
							
					address_rom_big   <= bCoord_Y * object_X_size + bCoord_X;
					address_rom_small <= bCoord_Y * object_X_size + bCoord_X;
					
					-----------------------------------------------------------------------------------------------------------------------

					if((bCoord_X <= 1) and (bCoord_Y > 1) and (bCoord_Y < object_Y_size - 2)) then 						-- left  (2 pixel accuracy)
						collision_left <= '1';
					elsif((bCoord_X >= object_X_size - 2 ) and (bCoord_Y > 1) and (bCoord_Y < object_Y_size - 2)) then 	-- right (2 pixel accuracy)
						collision_right <= '1';
					end if;
					
					if((bCoord_Y <= 5) and (bCoord_X > 3) and (bCoord_X < object_X_size - 4)) then 						--top
						collision_top <= '1';
					-- we fall
					elsif((bCoord_Y >= object_Y_size - 5) and (bCoord_X > 3) and (bCoord_X < object_X_size - 4)) then 	--bottom
						collision_bottom <= '1';
					end if;
					
					
					-----------------------------------------------------------------------------------------------------------------------
					-- animation states machine
					
					case current is 
			
						when small_1 =>
							if(orientation = 2) then
								address_rom_small <= bCoord_Y * object_X_size + object_X_size - bCoord_X; --reading the matrix right to left 
							end if;
							mVGA_RGB	<=  RGB_rom_swalk1;
							if (during_jump = '1') then
								current <= jump_small;
							elsif(mario_size = '1') then
								current <= big_1;	
								current_count := 0;			
							elsif(current_count = pixels_between_steps) then
								current <= small_2;
								current_count := 0;
							end if;
											
						when small_2 =>
							if(orientation = 2) then
								address_rom_small <= bCoord_Y * object_X_size + object_X_size - bCoord_X; --reading the matrix right to left 
							end if;
							mVGA_RGB	<=  RGB_rom_swalk2;
							if (during_jump = '1') then
								current <= jump_small;
							elsif(mario_size = '1') then
								current <= big_1;	
								current_count := 0;			
							elsif(current_count = pixels_between_steps) then
								current <= small_1;
								current_count := 0;
							end if;
							
						when big_1 =>
							if(orientation = 2) then
								address_rom_big <= bCoord_Y * object_X_size + object_X_size - bCoord_X; --reading the matrix right to left 
							end if;
							mVGA_RGB	<=  RGB_rom_bwalk1;							
							if (during_jump = '1') then
								current <= jump_big;
							elsif(mario_size = '0') then
								current <= small_1;	
								current_count := 0;			
							elsif(current_count = pixels_between_steps) then
								current <= big_2;
								current_count := 0;
							end if;
							
						when big_2 =>
							if(orientation = 2) then
								address_rom_big <= bCoord_Y * object_X_size + object_X_size - bCoord_X; --reading the matrix right to left 
							end if;
							mVGA_RGB	<=  RGB_rom_bwalk2;								
							if (during_jump = '1') then
								current <= jump_big;
							elsif(mario_size = '0') then
								current <= small_1;	
								current_count := 0;			
							elsif(current_count = pixels_between_steps) then
								current <= big_1;
								current_count := 0;
							end if;
								
						when jump_small =>
							if(orientation = 2) then
								address_rom_small <= bCoord_Y * object_X_size + object_X_size - bCoord_X; --reading the matrix right to left 
							end if;
							mVGA_RGB	<=  RGB_rom_sjump;
							if (during_jump = '0') then
								current <= small_1;
								current_count := 0;	
							elsif(mario_size = '1') then
								current <= jump_big;	
								current_count := 0;		
							end if;
							
						when jump_big =>
							if(orientation = 2) then
								address_rom_big <= bCoord_Y * object_X_size + object_X_size - bCoord_X; --reading the matrix right to left 
							end if;
							mVGA_RGB	<=  RGB_rom_bjump;
							if (during_jump = '0') then
								current <= big_1;
								current_count := 0;	
							elsif(mario_size = '0') then
								current <= jump_small;	
								current_count := 0;		
							end if;
							
					
					end case;	
					
					-----------------------------------------------------------------------------------------------------------------------
					
					drawing_request	<= drawing_X and drawing_Y ;
					
				end if;

		  end process;

				
end behav;		
		