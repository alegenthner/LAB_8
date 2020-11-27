library ieee ;
use ieee.std_logic_1164.all ;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CONTROLE is

	port(	control_clk	: in std_logic ;
		control_start	: in std_logic ;
		control_c0 	: in std_logic ;
		control_ena	: out std_logic ;
		control_rst	: out std_logic ;
		control_busy	: out std_logic
		);
end CONTROLE;

architecture behavior of CONTROLE is

type state_type is (S0,S1,S2);
signal q : state_type;

	begin
		process(control_clk)
			begin
			--control_clk'EVENT and control_clk = '1' ;

			case q is 
			when S0 => 
				if control_start = '0'
				then  q <= S0;
				else q <= S1;
				end if;
			when S1 =>
				q <= S2;
			when S2 =>
				if control_c0 = '1'
				then q <= S2;
				else q <= s0;
				end if;
			end case;
		end process;

	control_ena <= '1' when q = S2 else '0';
	control_rst <= '1' when q = S1 else '0';
	control_busy <= '0' when q <= S0 else '1';

end behavior ;