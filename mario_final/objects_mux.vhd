library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity objects_mux is
port 	(	 
		CLK	: in std_logic;	
		RESETn : in std_logic;
		
		ground_drawing_request 					: in std_logic;
		ground_mVGA_RGB 						: in std_logic_vector(7 downto 0); 
		
		mario_drawing_request 					: in std_logic;
		mario_mVGA_RGB 							: in std_logic_vector(7 downto 0); 
		
		static_objects_drawing_request 			: in std_logic;	
		static_objects_mVGA_RGB 				: in std_logic_vector(7 downto 0); 
				
		
		bombs_rewards_drawing_request 			: in std_logic;	
		bombs_rewards_mVGA_RGB 					: in std_logic_vector(7 downto 0);
		
		
		m_mVGA_R 	: out std_logic_vector(9 downto 0); 
		m_mVGA_G 	: out std_logic_vector(9 downto 0); 
		m_mVGA_B 	: out std_logic_vector(9 downto 0)
		

	);
end objects_mux;

architecture behav of objects_mux is 
signal m_mVGA_t 	: std_logic_vector(7 downto 0); 

begin

process ( RESETn, CLK)
begin 
	if RESETn = '0' then
			m_mVGA_t	<=  (others => '0') ; 	

	elsif rising_edge(CLK) then
	
		if (static_objects_drawing_request = '1' ) then	 		 -- static objects have the highest priority and can't be overriden
			m_mVGA_t <= static_objects_mVGA_RGB;
		elsif(ground_drawing_request = '1' ) then		 		 -- ground has higher pririty than character
			m_mVGA_t <= ground_mVGA_RGB;
		elsif (mario_drawing_request = '1' ) then				 -- character has higher priority than rewards or bombs (coins, mushrooms, bomb)	
			m_mVGA_t <= mario_mVGA_RGB;
		elsif (bombs_rewards_drawing_request = '1' ) then		 -- character has higher priority than rewards (coins, mushrooms)	
			m_mVGA_t <= bombs_rewards_mVGA_RGB;
		else
			
			m_mVGA_t <=  "00010011" ; 					 --background
		end if; 
	end if ; 

end process ;

m_mVGA_R	<= m_mVGA_t(7 downto 5)& "0000000"; -- expand to 10 bits 
m_mVGA_G	<= m_mVGA_t(4 downto 2)& "0000000";
m_mVGA_B	<= m_mVGA_t(1 downto 0)& "00000000";


end behav;