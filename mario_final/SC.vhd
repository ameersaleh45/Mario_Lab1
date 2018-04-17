library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SC is
port(
	  S    : out std_logic_vector(3 downto 0);
	  C    : out std_logic_vector(3 downto 0)
);
end SC;

architecture arch of SC is

begin

	S <= "1110";		
	C <= "1111";
			
end arch;