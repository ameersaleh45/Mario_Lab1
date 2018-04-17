library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_brick is
port(
	  ADDR    : in integer range 0 to 1023;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_brick;

architecture arch of pic_brick is

type matrix is array(0 to 1023) of std_logic_vector(7 downto 0);

constant brick : matrix := (
X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", 
X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", 
X"FA", X"FA", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", X"00", X"00", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", X"00", X"00", X"00", X"00", 
X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", X"00", X"00", 
X"FA", X"FA", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", X"00", X"00", 
X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8", 
X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"C8", X"C8" 

							  
							  );
begin

	Q <= brick(ADDR);		
			
end arch;