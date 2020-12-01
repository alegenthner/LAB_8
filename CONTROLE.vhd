library ieee;
use ieee.std_logic_1164.all;

entity CONTROLE is

	port(	
		control_clk	  : in std_logic;
		control_start : in std_logic;
		control_c0 	  : in std_logic;
		control_ena	  : out std_logic;
		control_rst	  : out std_logic;
		control_busy  : out std_logic
	);
end CONTROLE;

architecture behavior of CONTROLE is

type state_type is (S0,S1,S2);
signal current_state : state_type;
signal next_state : state_type;

	begin
		-- Next state logic
		process(current_state)
		begin
			next_state <= current_state;
			case current_state is
				when S0 =>
					if control_start = '1' then
						next_state <= S1;
					end if;
				when S1 => 
					next_state <= S2;
				when S2 =>
					if control_c0 = '0' then
						next_state <= S0;
					end if;
			end case;
		end process;

		-- State register
		process(control_clk, control_rst)
		begin
			if Reset = '1' then 
				current_state <= S0;
			elsif rising_edge(Clock) then
				current_state <= next_state; 
			end if;
		end process;

		-- Output logic
		process(current_state)
		begin
			control_busy <= '1';
			control_rst  <= '0';
			control_ena  <= '0';
			
			case current_state is
				when S0 => 
					control_busy <= '0';
				when S1 =>
					control_rst  <= '1';
				when S2 =>
					control_ena  <= '1';
			end case;
		end process;

end behavior ;



	