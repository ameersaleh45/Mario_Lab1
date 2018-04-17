library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_super_mushroom is
port(
	  ADDR    : in integer range 0 to 1023;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_super_mushroom;

architecture arch of pic_super_mushroom is

type matrix is array(0 to 1023) of std_logic_vector(7 downto 0);

constant super_mushroom : matrix := (

X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", 
X"13", X"13", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"F1", X"F1", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"F1", X"F1", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"F1", X"F1", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"F1", X"F1", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"F1", X"F1", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"F1", X"F1", X"FF", X"FF", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13" 
							  
							  );
begin

	Q <= super_mushroom(ADDR);		
			
end arch;