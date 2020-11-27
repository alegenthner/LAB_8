library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;

ENTITY COMPR IS
	port(
	 signal_x : in std_logic_vector(7 downto 0);
	 signal_y : in std_logic_vector(7 downto 0);
	 control_c : out std_logic
	);
END COMPR;

architecture behavior of COMPR is

	signal signal_compr : std_logic_vector(7 downto 0);

begin

	process(signal_x)

	begin
		-- deve-se diminuir de uma unidade para que a opera
		-- cao ocorra normalmente
		if signal_y = "00000000" then
			signal_compr <= signal_y;
		else
			signal_compr <= signal_y + "11111111";
		end if;

		if signal_x /= signal_compr then
			control_c <= '1';
		else
			control_c <= '0';
		end if;
	end process;

end behavior;
