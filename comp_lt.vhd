library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp_lt is
  port(x,y: in std_logic_vector (7 downto 0);
       x_lt_y : out    std_logic);
end comp_lt ;

architecture rtl of comp_lt is
begin
  process(x,y)
  begin
    if x < y then
	  x_lt_y <= '1';
	else
	  x_lt_y <= '0';
	end if;
  end process;
end rtl;
