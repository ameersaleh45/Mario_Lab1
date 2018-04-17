library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all; --

-------------------------------------------------
-- This module is in charge printing the ground of the game
-- holes and will be in charge of making rhe ground move
-------------------------------------------------

entity draw_ground is
port 	(
			CLK  			: in std_logic; 
			RESETn			: in std_logic;
			
			oCoord_X		: in integer;							-- current pixel that the VGA controller is handling
			oCoord_Y		: in integer;
			map_offset		: in integer;							-- current screen game offset from beginning 
			
			drawing_request	: out std_logic ;					 	-- whether to print the character on current pixel or not
			mVGA_RGB 		: out std_logic_vector(7 downto 0)  	-- color of current object pixel in 8bit
	);
	
end draw_ground;

architecture behav of draw_ground is 
		
		signal bCoord_X : integer := 0;
		signal bCoord_Y : integer := 0;
			
		constant ObjectStartY 	: integer := 416;											 -- beginning of ground
		-------------------------------------------------
		
		constant object_X_size : integer := 64;
		constant object_Y_size : integer := 64;

		------ roms containing ground pixels -----
		
		component pic_ground is
			PORT
			(
				ADDR		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
				q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		end component;		
		-------------------------------------------------
		
		signal address_rom 			: std_logic_vector(11 downto 0);
		signal RGB_rom				: std_logic_vector(7 downto 0);
			
		-------------------------------------------------
		
		type indexes_array is ARRAY(5 downto 0) of integer;									-- array containing indexes of ground blocks that are missing (will act as holes)
		constant hole_indexes 		: indexes_array := (1,8,9,20,32,33); 
			
		signal blockNumber			: integer := 0;											-- number of current ground block index
		signal block_empty			: std_logic := '0';
		
		
		begin
	
			ground_block: pic_ground port map(address_rom,RGB_rom);
		
			bCoord_X 	<= ((oCoord_X mod object_X_size + map_offset) mod object_X_size); 	-- cool formula
			bCoord_Y 	<= (oCoord_Y - ObjectStartY); 

		process ( RESETn, CLK)
		   begin
				if RESETn = '0' then
					mVGA_RGB		<=  (others => '0') ; 	
					drawing_request	<= '0' ;
					
				elsif rising_edge(CLK) then
					blockNumber <= (oCoord_X+map_offset)/64; 	-- vhdl casts to integer, exactly what we want
					block_empty <= '0';
					
					for i in 0 to 4 loop
						if(hole_indexes(i) = blockNumber or (blockNumber >= 47 and blockNumber<=53)) then -- we have specific indexes of ground holes plus crazy level which has no floor
							block_empty <= '1';
						end if;
					end loop;
					
					if(oCoord_Y > ObjectStartY  and block_empty = '0') then
						address_rom <= conv_std_logic_vector(bCoord_Y * object_X_size + bCoord_X,12);
						mVGA_RGB	<=  RGB_rom;
						drawing_request	<= '1';
					else 
						drawing_request	<= '0';
					end if;
					
				
				end if;

		end process;

				
end behav;		
		