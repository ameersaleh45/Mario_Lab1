library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_coin is
port(
	  ADDR    : in integer range 0 to 447;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_coin;

architecture arch of pic_coin is

type matrix is array(0 to 447) of std_logic_vector(7 downto 0);

constant coin : matrix := (
							 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"F1", X"F1", X"F1", X"F1", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"FF", X"FF", X"E4", X"E4", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"F1", X"F1", X"F1", X"F1", X"13", X"13", X"13", X"13", X"13", X"13"  
							  );
begin

	Q <= coin(ADDR);		
			
end arch;