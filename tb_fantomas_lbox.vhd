library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_fantomas_lbox is
end entity tb_fantomas_lbox;

architecture behav of tb_fantomas_lbox is

  -- component of uut
  component fantomas_lbox
    port(
      a1: in std_logic_vector(7 downto 0);
      a2: in std_logic_vector(7 downto 0);
      o: out std_logic_vector(15 downto 0)
      );
  end component;

  -- input
  signal a : std_logic_vector(7 downto 0) := x"00";

  -- output
  signal o : std_logic_vector(15 downto 0);

begin
  -- instantiate the uut
  uut: fantomas_lbox
    port map(
      a1 => a,
      a2 => a,
      o => o
    );

    -- do the thing
    stim_proc: process
    begin
      for i in 0 to 255 loop
	wait for 1 fs;
	report "value o: " & integer'image(to_integer(unsigned(o)));
	a <= a + 1;
      end loop;
      wait;
    end process;
end behav;
