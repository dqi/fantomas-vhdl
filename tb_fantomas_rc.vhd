library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_fantomas_rc is
end entity tb_fantomas_rc;

architecture behav of tb_fantomas_rc is

  -- component of uut
  component fantomas_rc
    port(
      a: in std_logic_vector(15 downto 0);
      i: in integer;
      o: out std_logic_vector(15 downto 0)
      );
  end component;

  -- input
  signal a : std_logic_vector(15 downto 0) := x"0000";
  signal i : integer := 0;

  -- output
  signal o : std_logic_vector(15 downto 0);

begin
  -- instantiate the uut
  uut: fantomas_rc
    port map(
      a => a,
      i => i,
      o => o
    );

    -- do the thing
    stim_proc: process
    begin
      for j in 0 to 11 loop
	wait for 1 fs;
	report "value o: " & integer'image(to_integer(unsigned(o)));
	if i < 11 then
	  i <= i + 1;
	end if;
      end loop;
      wait;
    end process;
end behav;
