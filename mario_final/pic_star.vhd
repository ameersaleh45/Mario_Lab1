library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_star is
port(
	  ADDR    : in integer range 0 to 895;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_star;

architecture arch of pic_star is

type matrix is array(0 to 895) of std_logic_vector(7 downto 0);

constant star : matrix := (
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"14", X"14", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13"
);

begin

	Q <= star(ADDR);		
			
end arch;