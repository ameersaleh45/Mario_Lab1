library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pic_big_mario_walk2 is
port(
	  ADDR    : in integer range 0 to 2047;
	  Q       : out std_logic_vector(7 downto 0)
);
end pic_big_mario_walk2;

architecture arch of pic_big_mario_walk2 is

type matrix is array(0 to 2047) of std_logic_vector(7 downto 0);

constant big_mario_walk2 : matrix := (
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"F0", X"F0", X"F0", X"F0", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"F0", X"F0", X"F0", X"F0", X"F0", X"F0", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"E4", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", 
X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"AC", X"AC", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13", 
X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"13", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"AC", X"13", X"13"		  
							  );
begin

	Q <= big_mario_walk2(ADDR);		
			
end arch;