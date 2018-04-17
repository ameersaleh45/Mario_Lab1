library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all; --

entity SI_OB  is
  port (TC	 		: in 	std_logic_vector (7 downto 0);
        OB	 		: out 	std_logic_vector (7 downto 0)
    );
end entity;

architecture SI_OB_arch of SI_OB  is
begin

	process (TC)
	begin
		if (TC(7) = '0') then
			OB <= TC - 128;
		else
			OB <= TC + 128;
		end if;
	end process;
	
end SI_OB_arch;

