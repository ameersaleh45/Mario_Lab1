library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all; --

-------------------------------------------------
-- This module is in generic module for drawing an object
-- on the screen in the right coordinates
-------------------------------------------------

entity generic_object is
port 	(
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
	
end generic_object;

architecture behav of generic_object is 
		
		signal bCoord_X : integer := 0;
		signal bCoord_Y : integer := 0;
		signal objectEastXboundary : integer := 0;
		signal objectSouthboundary : integer := 0;
		signal drawing_X  : std_logic := '0';
		signal drawing_Y  : std_logic := '0';
	
		signal effectiveX : integer := 0;
		
		begin
	
			effectiveX <= ObjectStartX - map_offset;
				
			objectEastXboundary	<= object_X_size + effectiveX ;
			objectSouthboundary	<= object_Y_size + ObjectStartY ;

			drawing_X	<= '1' when  (oCoord_X  >= effectiveX) and  (oCoord_X < objectEastXboundary) else '0';
			drawing_Y	<= '1' when  (oCoord_Y  >= ObjectStartY) and  (oCoord_Y < objectSouthboundary) else '0';

			bCoord_X 	<= (oCoord_X - effectiveX) when ( drawing_X = '1' and  drawing_Y = '1'  ) else 0 ; 
			bCoord_Y 	<= (oCoord_Y - ObjectStartY) when ( drawing_X = '1' and  drawing_Y = '1'  ) else 0 ; 


		process ( RESETn, CLK)
		   begin
				if RESETn = '0' then
					drawing_request	<= '0' ;
					address <= 0;

				elsif rising_edge(CLK) then
					address <= bCoord_Y * object_X_size + bCoord_X;
					drawing_request	<= drawing_X and drawing_Y ;
				end if;

		  end process;

				
end behav;		
		