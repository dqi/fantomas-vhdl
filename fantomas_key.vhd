library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fantomas_key is
  port (
    a : in std_logic_vector(127 downto 0);
    k : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0)
  );
end entity fantomas_key;

architecture behav of fantomas_key is

-- Just xor the two
begin
  o <= a xor k;
end behav;
