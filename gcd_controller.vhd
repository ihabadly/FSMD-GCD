library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity gcd_controller is
port (clk,rst,go_i,x_lt_y,x_neq_y: in std_logic ;
      x_sel,x_ld,y_sel,y_ld,d_ld: out std_logic);
end gcd_controller ;

architecture rtl of gcd_controller is
  type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12);
  signal current_state : state_type ;
  signal next_state : state_type ;
begin
  process(clk,rst)
  begin
    if (rst = '1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;

  process (current_state,go_i,x_lt_y,x_neq_y)
  begin
    case current_state is
    when s0 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s1;
    when s1 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      if (go_i = '1') then
        next_state <= s3;
      else
        next_state <= s2;
      end if;
      when s2 =>
        d_ld <= '0';
        x_ld <= '0';
        x_sel <= '0';
        y_ld <= '0';
        y_sel <= '0';
        next_state <= s1;
    when s3 =>
      d_ld <= '0';
      x_ld <= '1';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s4;
    when s4 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '1';
      y_sel <= '0';
      next_state <= s5;
    when s5 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      if (x_neq_y = '0') then
        next_state <= s11;
      else
        next_state <= s6;
      end if;
    when s6 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      if (x_lt_y = '1') then
        next_state <= s7;
      else
        next_state <= s8;
      end if;      
    when s7 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '1';
      y_sel <= '1';
      next_state <= s9;      
    when s8 =>
      d_ld <= '0';
      x_ld <= '1';
      x_sel <= '1';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s9;
    when s9 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s10;  
    when s10 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s5;          
    when s11 =>
      d_ld <= '1';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s12;
    when s12 =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s0;      
    when others =>
      d_ld <= '0';
      x_ld <= '0';
      x_sel <= '0';
      y_ld <= '0';
      y_sel <= '0';
      next_state <= s0;
    end case;
  end process;
end rtl;
