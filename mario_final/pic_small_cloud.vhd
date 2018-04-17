library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_small_cloud is
port(
	  ADDR    : in integer range 0 to 3071;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_small_cloud;

architecture arch of pic_small_cloud is

type matrix is array(0 to 3071) of std_logic_vector(7 downto 0);

constant small_cloud : matrix := (
							    X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"00", X"00", 
								X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"00", X"00", 
								X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", 
								X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", 
								X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", 
								X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", 
								X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"37", X"37", X"37", X"37", X"37", X"37", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"00", X"00", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"00", X"00", X"13", X"13", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"13", X"13", X"00", X"00", X"00", X"00", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"00", X"00", X"00", X"00", X"13", X"13", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
								X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13" 
							  );
begin

	Q <= small_cloud(ADDR);		
			
end arch;