library ieee ;
use ieee.std_logic_1164.all ;

entity REG is

	port(	signal_r 	: in std_logic_vector(15 downto 0) ;
		control_clk	: in std_logic ;
		control_rst	: in std_logic ;
		control_en	: in std_logic ;
		signal_q 	: out std_logic_vector(15 downto 0) 
		);
end REG;

architecture behavior of REG is

	begin
		process
			begin
			wait until control_clk'EVENT and control_clk = '1' ;

			if control_rst = '1' then
				signal_q <= "0000000000000000";
			else
				if control_en = '1' then signal_q <= signal_r ;
				end if;
			end if;
		end process;

end behavior ;