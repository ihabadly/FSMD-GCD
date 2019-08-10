library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity subtractor is
  port(x,y: in std_logic_vector (7 downto 0);
    z: out std_logic_vector (7 downto 0)
  );
end subtractor ;

architecture rtl of subtractor is
  signal z_int : unsigned(7 downto 0);
begin
  process(x,y)
  begin
    z_int <= unsigned(x) - unsigned(y);
  end process;
    z <= std_logic_vector(z_int);
end rtl;