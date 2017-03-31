library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_fantomas_sbox is
end entity tb_fantomas_sbox;

architecture behav of tb_fantomas_sbox is

  -- component of uut
  component fantomas_sbox
    port(
      a: in std_logic_vector(7 downto 0);
      o: out std_logic_vector(7 downto 0)
      );
  end component;

  -- input
  signal a : std_logic_vector(7 downto 0) := x"00";

  -- output
  signal o : std_logic_vector(7 downto 0);

begin
  -- instantiate the uut
  uut: fantomas_sbox
    port map(
      a => a,
      o => o
    );

    -- do the thing
    stim_proc: process
    begin
      for i in 0 to 255 loop
	wait for 1 fs;
	report "value: " & integer'image(to_integer(unsigned(o)));
	a <= a + 1;
      end loop;
      wait;
    end process;
end behav;
