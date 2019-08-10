library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity gcd_toplevel_tb is
end gcd_toplevel_tb ;

architecture behav of gcd_toplevel_tb is
  constant clockperiod: time:=100 ns;
  signal clk: std_logic:='0';
  signal rst,go_i: std_logic;
  signal x_i,y_i,d_o: std_logic_vector (7 downto 0);
  component gcd_toplevel
    port(clk,rst,go_i: in std_logic;
         x_i,y_i: in std_logic_vector (7 downto 0);
         d_o: out std_logic_vector (7 downto 0));
  end component ;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 70 ns;
    go_i <= '0' , '1' after 220 ns, '0' after 520 ns;
    x_i <= "00001100";
    y_i <= "00001000";
    dut: gcd_toplevel port map(clk,rst,go_i,x_i,y_i,d_o);
  end behav;