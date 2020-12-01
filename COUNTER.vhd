library ieee;
use ieee.std_logic_1164.all;

entity COUNTER is

	port(	
		control_clk	: in std_logic ;
		control_rst	: in std_logic ;
		control_en	: in std_logic ;
		signal_c 	: out std_logic_vector(7 downto 0) 
	);
end COUNTER;

architecture behavior of COUNTER is

signal count_buffer : std_logic_vector(7 downto 0);

	begin
		process(control_rst, control_clk, control_en)
		begin
			if (control_rst = '1') then
				count_buffer <= (others=>'0');
				signal_c     <= (others=>'0');
			elsif (rising_edge(control_clk) and (control_en = '1')) then
				count_buffer <= count_buffer + "00000001";
				signal_c     <= count_buffer;				
			end if;					 
		end process;

end behavior ;