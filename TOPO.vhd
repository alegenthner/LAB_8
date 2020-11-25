
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TOPO is
  port(
	 clk,rst		: in std_logic;
	 A 		      : in std_logic_vector(31 downto 0);
	 S 		      : out std_logic_vector(31 downto 0);
	 SEL 		    : in std_logic_vector(1 downto 0)
	 );
end TOPO;

architecture behavior of TOPO is

 signal T1, T2: std_logic_vector(31 downto 0);

 component REG is
	port (
	 		R 		: in std_logic_vector(31 downto 0) ;
			clk,rst		: in std_logic ;
			Q 		: out std_logic_vector(31 downto 0)
		);
 end component;

 component ULA is
	 port (
	 		IN1, IN2 	: in std_logic_vector(31 downto 0);
			CRL 		: in std_logic_vector(1 downto 0);
	  		RSL 		: out std_logic_vector(31 downto 0)
	  	);
 end component;

begin
		U1: ULA port map(A,T1,SEL,T2);
		U2: REG port map(T2,clk,rst,T1);

		S <= T1;
end behavior;
