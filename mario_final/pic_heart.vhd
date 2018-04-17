library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_heart is
port(
	  ADDR    : in integer range 0 to 224;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_heart;

architecture arch of pic_heart is

type matrix is array(0 to 224) of std_logic_vector(7 downto 0);

constant heart : matrix := (
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"C9", X"A0", X"A0", X"A5", X"C9", X"13", X"C9", X"A5", X"A0", X"A0", X"C9", X"13", X"13", 
X"13", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"C9", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"13", 
X"CE", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"D2", 
X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A4", 
X"A4", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A5", 
X"CD", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"CE", 
X"C9", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"C9", 
X"13", X"A9", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A9", X"13", 
X"13", X"13", X"C9", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"13", X"13", 
X"13", X"13", X"C9", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"C9", X"13", X"13", 
X"13", X"13", X"13", X"C9", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"A0", X"C9", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"C9", X"A0", X"A0", X"A0", X"A0", X"A0", X"C9", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"C9", X"A0", X"C9", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"C9", X"13", X"13", X"13", X"13", X"13", X"13", X"13" 

);
begin

	Q <= heart(ADDR);		
			
end arch;