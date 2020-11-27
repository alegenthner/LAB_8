
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TOPO is
  port(
	 topo_clk		      : in std_logic;
   topo_start	      : in std_logic;
   topo_busy        : out std_logic;
	 topo_A 		      : in std_logic_vector(7 downto 0);
   topo_B 		      : in std_logic_vector(7 downto 0);
	 topo_S 		      : out std_logic_vector(15 downto 0)
	 );
end TOPO;

architecture behavior of TOPO is

  --verificar se aqui tem todos os sinais internos necessários
  signal signal_reg_in: std_logic_vector(15 downto 0);
  signal signal_reg_out: std_logic_vector(15 downto 0);
  signal counter_out: std_logic_vector(7 downto 0);
  signal control_topo_c0: std_logic;
  signal control_topo_ena: std_logic;
  signal control_topo_rst: std_logic;
  signal control_topo_busy: std_logic;

 component ADDER is
	  port (
      signal_a : in std_logic_vector(7 downto 0);
      signal_b : in std_logic_vector(15 downto 0);
      signal_rsl : out std_logic_vector(15 downto 0)
		  );
 end component;

 component COMPR is
	 port (
      signal_x : in std_logic_vector(7 downto 0);
      signal_y : in std_logic_vector(7 downto 0);
      control_c : out std_logic
	  	);
 end component;

 component CONTROLE is
   port (
     control_clk	: in std_logic ;
     control_start	: in std_logic ;
     control_c0 	: in std_logic ;
     control_ena	: out std_logic ;
     control_rst	: out std_logic ;
     control_busy	: out std_logic
   );
 end component;

 component COUNTER is
   port (
     control_clk	: in std_logic ;
 		 control_rst	: in std_logic ;
 		 control_en	  : in std_logic ;
 		 signal_c 	  : out std_logic_vector(7 downto 0)
   );
 end component;

 component REG is
   port (
     signal_r 	  : in std_logic_vector(15 downto 0) ;
     control_clk	: in std_logic ;
     control_rst	: in std_logic ;
     control_en	  : in std_logic ;
     signal_q 	  : out std_logic_vector(15 downto 0)
   );
 end component;

 -- adiocionar os sinais: signal_reg_out, signal_reg_in, counter_out
 -- adicionar os seguintes controles: control_topo_c0,control_topo_ena,
 --   control_topo_rst, control_topo_busy
begin
		U1: ADDER port map(topo_A,signal_reg_out,signal_reg_in);
		U2: COMPR port map(counter_out,topo_B,control_topo_c0);
    U3: CONTROLE port map(topo_clk,topo_start,control_topo_c0,control_topo_ena,control_topo_rst, control_topo_busy);
    U4: COUNTER port map(topo_clk,control_topo_rst,control_topo_ena,counter_out);
    U5: REG port map(signal_reg_in,topo_clk,control_topo_rst,control_topo_ena,signal_reg_out);

		topo_S <= signal_reg_out;
    topo_busy <= control_busy;

end behavior;
