library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity gcd_datapath is
port (clk,rst,x_sel,x_ld,y_sel,y_ld,d_ld: in std_logic;
      x_i,y_i: in std_logic_vector (7 downto 0);
      x_lt_y,x_neq_y: out std_logic; 
      d_o: out std_logic_vector (7 downto 0));
end gcd_datapath ;

architecture struct of gcd_datapath is
  signal x,x_int,x_sub,y,y_int,y_sub : std_logic_vector(7 downto 0);
  component comp_lt
  port (x,y: in std_logic_vector (7 downto 0);
        x_lt_y : out std_logic);
  end component;
  component comp_neq
  port (x,y: in std_logic_vector (7 downto 0);
        x_neq_y: out std_logic);
  end component;
  component mux2_1_8bit
  port (a,b : in std_logic_vector (7 downto 0);
        s : in std_logic ;
        y : out std_logic_vector (7 downto 0));
  end component;
  component reg_par_8bit
  port (clk,rst,load: in std_logic;
        d: in std_logic_vector (7 downto 0);
        q: out std_logic_vector (7 downto 0));
  end component;
  component subtractor
  port (x,y: in std_logic_vector (7 downto 0);
        z: out std_logic_vector (7 downto 0));
  end component;
begin
  u0 : comp_lt port map (x,y,x_lt_y);
  u1 : comp_neq port map (x,y,x_neq_y);
  u2 : mux2_1_8bit port map (x_i,x_sub,x_sel,x_int);
  u3 : mux2_1_8bit port map (y_i,y_sub,y_sel,y_int);
  u4 : reg_par_8bit port map (clk,rst,x_ld,x_int,x);
  u5 : reg_par_8bit port map (clk,rst,y_ld,y_int,y);
  u6 : reg_par_8bit port map (clk,rst,d_ld,y,d_o);
  u7 : subtractor port map (x,y,x_sub);
  u8 : subtractor port map (y,x,y_sub);
end struct;
