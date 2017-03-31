library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_fantomas_core is
  generic(
    PERIOD : time := 100 ns
  );
end entity tb_fantomas_core;

architecture behav of tb_fantomas_core is

  -- component of uut
  component fantomas_core
    port(
      clk : in std_logic;
      rst : in std_logic;
      key : in std_logic_vector(127 downto 0);
      pt  : in std_logic_vector(127 downto 0);

      ct  : out std_logic_vector(127 downto 0)
    );
  end component;

  -- input
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  signal test_bench_finish : boolean := false;
  signal pt : std_logic_vector(127 downto 0) := x"ffeeeeddbbaaccccccaaffeebbaabbee";
  signal key : std_logic_vector(127 downto 0) := x"cafebabedeadbeefb0a710adb01dface";

  -- output
  signal ct : std_logic_vector(127 downto 0);

begin
    -- instantiate the components
    uut: fantomas_core
      port map(
	clk => clk,
	rst => rst,
	key => key,
	pt => pt,
	ct => ct
      );

    -- Define the clock
    clock : process
    begin
      while (not test_bench_finish ) loop
	clk <= not clk;
	wait for PERIOD/2;
      end loop;
      wait;
    end process;

    -- do the thing
    stim_proc: process
      variable l : line;
    begin
      wait for PERIOD*3;
      for k in 0 to 11 loop
	wait for PERIOD*4;
	write(l, "round " & integer'image(k) & ": ");
	hwrite(l, ct);
	writeline(output, l);
	pt <= ct;
      end loop;
      test_bench_finish <= true;
      wait;
    end process;
end behav;
