library ieee;
use ieee.std_logic_1164.all;

ENTITY COMPR IS
	port(	
		signal_x  : in std_logic_vector(7 downto 0); 
		signal_y  : in std_logic_vector(7 downto 0); 
	  	control_c : out std_logic
	);
END COMPR;

architecture behavior of COMPR is

	begin 
		control_c <= "0" when (signal_x < signal_y) else "1";

end behavior;
		