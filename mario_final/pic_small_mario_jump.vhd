library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_small_mario_jump is
port(
	  ADDR    : in integer range 0 to 1023;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_small_mario_jump;

architecture arch of pic_small_mario_jump is

type matrix is array(0 to 1023) of std_logic_vector(7 downto 0);

constant small_mario_jump : matrix := (
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", 
X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"13", X"13", X"AC", X"AC", 
X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"13", X"13", X"AC", X"AC", 
X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"AC", X"AC", 
X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"AC", X"AC", 
X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"E4", X"E4", X"AC", X"AC", 
X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"E4", X"E4", X"AC", X"AC", 
X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", 
X"13", X"13", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", 
X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13"		  
							  );
begin
			
	Q <= small_mario_jump(ADDR);
	
end arch;