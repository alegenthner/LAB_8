library ieee;
use ieee.std_logic_1164.all;

entity REG is

	port(	
		signal_r 	: in std_logic_vector(15 downto 0);
		control_clk	: in std_logic;
		control_rst	: in std_logic;
		control_en	: in std_logic;
		signal_q 	: out std_logic_vector(15 downto 0) 
	);
end REG;

architecture behavior of REG is

	begin
		process(control_rst, control_clk)
    	begin
	        if (control_rst = '1') then
	            signal_q <= (others=>'0');
	        elsif (rising_edge(control_clk)) then
	            signal_q <= signal_r;
	    	end if;
		end process;

end behavior ;



	
