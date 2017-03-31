library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_fantomas_state_machine is
  generic(
    PERIOD : time := 100 ns
  );
end entity tb_fantomas_state_machine;

architecture behav of tb_fantomas_state_machine is

  -- component of uut
  component fantomas_state_machine
    port(
      clk : in std_logic;
      rst : in std_logic;
      -- States we can output
      do_transform		: out std_logic;
      do_keyxor			: out std_logic;
      do_roundconstant 		: out std_logic;
      do_subbytes 		: out std_logic;
      do_llayer 		: out std_logic;
      do_done 			: out std_logic;
      -- The roundcounter
      roundcounter 		: out integer
    );
  end component;

  -- input
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  -- output
  signal do_transform		: std_logic;
  signal do_keyxor		: std_logic;
  signal do_roundconstant 	: std_logic;
  signal do_subbytes 		: std_logic;
  signal do_llayer 		: std_logic;
  signal do_done 		: std_logic;
  -- The roundcounter
  signal roundcounter 		: integer;

  signal test_bench_finish 	: boolean := false;

begin

  clock : process
  begin
    while (not test_bench_finish ) loop
      clk <= not clk;
      wait for PERIOD/2;
    end loop;
    wait;
  end process;

  -- instantiate the components
  uut: fantomas_state_machine
    port map(
      clk => clk,
      rst => rst,

      do_transform => do_transform,
      do_keyxor => do_keyxor,
      do_roundconstant => do_roundconstant,
      do_subbytes => do_subbytes,
      do_llayer => do_llayer,
      do_done => do_done,

      roundcounter => roundcounter
    );

    stim_proc : process(clk)
    begin
      if do_done = '1' then
	test_bench_finish <= true;
      end if;
    end process;
end behav;
