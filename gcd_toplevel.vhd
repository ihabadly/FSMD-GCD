library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity gcd_toplevel is
  port(clk,rst,go_i: in std_logic;
       x_i,y_i: in std_logic_vector (7 downto 0);
       d_o: out std_logic_vector (7 downto 0));
end gcd_toplevel;

architecture struct of gcd_toplevel is
  signal d_ld, x_ld, x_lt_y, x_neq_y, x_sel, y_ld, y_sel: std_logic;
  component gcd_controller
  port (clk,rst,go_i,x_lt_y,x_neq_y: in std_logic ;
    x_sel,x_ld,y_sel,y_ld,d_ld: out std_logic);
  end component;
  component gcd_datapath
  port (clk,rst,x_sel,x_ld,y_sel,y_ld,d_ld: in std_logic;
    x_i,y_i: in std_logic_vector (7 downto 0);
    x_lt_y,x_neq_y: out std_logic; 
    d_o: out std_logic_vector (7 downto 0));
  end component;
begin
  u0 : gcd_controller port map (clk,rst,go_i,x_lt_y,x_neq_y,x_sel,x_ld,y_sel,y_ld,d_ld);
  u1 : gcd_datapath port map (clk,rst,x_sel,x_ld,y_sel,y_ld,d_ld,x_i,y_i,x_lt_y,x_neq_y,d_o); 
end struct;
