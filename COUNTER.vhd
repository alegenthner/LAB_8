library ieee ;
use ieee.std_logic_1164.all ;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity COUNTER is

	port(	control_clk	: in std_logic ;
		control_rst	: in std_logic ;
		control_en	: in std_logic ;
		signal_c 	: out std_logic_vector(7 downto 0) 
		);
end COUNTER;

architecture behavior of COUNTER is

signal support : std_logic_vector(7 downto 0);

	begin
		process
			begin
			wait until control_clk'EVENT and control_clk = '1' ;

			if control_rst = '1' then
				support <= "00000000";
			else
				if control_en = '1' then
					support <= support + "00000001";
				end if;					 
			end if;
			signal_c <= support;	
		end process;

end behavior ;