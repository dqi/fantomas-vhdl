library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_fantomas_llayer is
end entity tb_fantomas_llayer;

architecture behav of tb_fantomas_llayer is

  -- component of uut
  component fantomas_llayer
    port(
      a: in std_logic_vector(127 downto 0);
      o: out std_logic_vector(127 downto 0)
    );
  end component;

  -- input
  signal a : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";

  -- output
  signal o : std_logic_vector(127 downto 0);

begin
  -- instantiate the uut
  uut: fantomas_llayer
    port map(
      a => a,
      o => o
    );

    -- do the thing
    stim_proc: process
      variable l : line;
    begin
      for i in 0 to 100 loop
	wait for 1 fs;
	hwrite(l, o);
	writeline(output, l);
	a <= a + 1;
      end loop;
      wait;
    end process;
end behav;
