library ieee ;
use ieee.std_logic_1164.all ;


entity sound_control is
port(
	RESETN 						:in std_logic;
	CLK    						:in std_logic;
	
	jump_enable 				:in std_logic;
	coin_enable 				:in std_logic;
	bomb_enable 				:in std_logic;
	finish  					:in std_logic;
	

	sound_enable  				:out std_logic;
	reset_out		 			:out std_logic;
	choose							:out std_logic_vector(1 downto 0)
);
end sound_control;


architecture bhv of sound_control is
type state is (idle, jump, coin, bomb);
signal current : state := idle;
signal reset :std_logic := '1';

begin
	
	
	
	process(CLK,RESETN)

	begin
		
		if(RESETN = '0') then
			current <= idle;
			sound_enable <= '0';
			reset <= '1';
			choose <= "11";
		elsif rising_edge(CLK) then
		
			case current is
			
				when idle =>
					if(jump_enable = '1') then
						sound_enable <= '1';
						reset <= '0';
						choose <= "00";
						current <= jump;
					elsif(coin_enable = '1') then
						sound_enable <= '1';
						reset <= '0';
						choose <= "10";
						current <= coin;
					elsif(bomb_enable = '1') then
						sound_enable <= '1';
						reset <= '0';
						choose <= "01";
						current <= bomb;		
					else
						reset <= '1';
						sound_enable <= '0';
						choose <= "11";
						current <= idle;
					end if;
					
				when jump => 
					if(finish = '1') then
						reset <= '1';
						current <= idle;
					elsif(coin_enable = '1') then
						reset <= '1';
						choose <= "10";
						current <= coin;
					elsif(bomb_enable = '1') then
						reset <= '1';
						choose <= "01";
						current <= bomb;
					else
						reset <= '0';
						choose <= "00";
						current <= jump;
					end if;
					
				when coin => 
					if(finish = '1') then
						reset <= '1';
						current <= idle;
					elsif(jump_enable = '1') then
						reset <= '1';
						choose <= "00";
						current <= jump;
					elsif(bomb_enable = '1') then
						reset <= '1';
						choose <= "01";
						current <= bomb;
					else
						reset <= '0';
						choose <= "10";
						current <= coin;
					end if;
					
				when bomb => 
					if(finish = '1') then
						reset <= '1';
						current <= idle;
					elsif(coin_enable = '1') then
						reset <= '1';
						choose <= "10";
						current <= coin;
					elsif(jump_enable = '1') then
						reset <= '1';
						choose <= "01";
						current <= jump;
					else
						reset <= '0';
						choose <= "01";
						current <= bomb;
					end if;
			end case;									
		
		end if;
	end process;
	reset_out <= reset;
end bhv;
		