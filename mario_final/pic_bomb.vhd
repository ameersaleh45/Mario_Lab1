library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_bomb is
port(
	  ADDR    : in integer range 0 to 1023;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_bomb;

architecture arch of pic_bomb is

type matrix is array(0 to 1023) of std_logic_vector(7 downto 0);

constant bomb : matrix := (
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"C8", X"C8", X"00", X"00", X"00", X"00", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"C8", X"C8", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"C8", X"C8", X"00", X"00", X"00", X"00", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"C8", X"C8", X"13", X"13", X"13", X"13", 
X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", 
X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", 
X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", 
X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", 
X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", 
X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"00", X"00", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", 
X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", 
X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", 
X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", 
X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", 
X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", 
X"13", X"13", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13" 
							  
							  );
begin

	Q <= bomb(ADDR);		
			
end arch;