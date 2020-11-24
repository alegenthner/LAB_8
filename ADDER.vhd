library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY ADDER IS
	port(	signal_a : in std_logic_vector(7 downto 0); 
		signal_b : in std_logic_vector(15 downto 0); 
	  	signal_rsl : out std_logic_vector(15 downto 0)
	  	);
END ADDER;

architecture behavior of ADDER is

	--signal AUX : std_logic_vector(15 downto 0);

begin 
	process(signal_b)

		begin
		signal_rsl <= ("00000000" & signal_a) + signal_b;
	end process;

end behavior;