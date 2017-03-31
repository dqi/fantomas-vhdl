library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity fantomas_state_machine is
  port (
    clk : in std_logic;
    rst : in std_logic;
    -- States we can output
    do_start		: out std_logic;
    do_keyxor		: out std_logic;
    do_roundconstant 	: out std_logic;
    do_subbytes 	: out std_logic;
    do_llayer 		: out std_logic;
    do_done 		: out std_logic;
    -- The roundcounter
    roundcounter 	: out integer
  );
end entity fantomas_state_machine;

architecture behav of fantomas_state_machine is

  type state is (
    boot, start, keyxor, roundconstant, subbytes, llayer, done
  );
  signal actual_state : state := boot;

begin
  -- General form: constant => sbox => lbox => key => output
  update_output : process (actual_state)
  begin
    case actual_state is
      when boot =>
	do_start <= '0';
	do_keyxor <= '0';
	do_roundconstant <= '0';
	do_subbytes <= '0';
	do_llayer <= '0';
	do_done <= '0';
      when start =>
	do_start <= '1';
	do_keyxor <= '0';
	do_roundconstant <= '0';
	do_subbytes <= '0';
	do_llayer <= '0';
	do_done <= '0';
      when keyxor =>
	do_start <= '0';
	do_keyxor <= '1';
	do_roundconstant <= '0';
	do_subbytes <= '0';
	do_llayer <= '0';
	do_done <= '0';
      when roundconstant =>
	do_start <= '0';
	do_keyxor <= '0';
	do_roundconstant <= '1';
	do_subbytes <= '0';
	do_llayer <= '0';
	do_done <= '0';
      when subbytes =>
	do_start <= '0';
	do_keyxor <= '0';
	do_roundconstant <= '0';
	do_subbytes <= '1';
	do_llayer <= '0';
	do_done <= '0';
      when llayer =>
	do_start <= '0';
	do_keyxor <= '0';
	do_roundconstant <= '0';
	do_subbytes <= '0';
	do_llayer <= '1';
	do_done <= '0';
      when done =>
	do_start <= '0';
	do_keyxor <= '0';
	do_roundconstant <= '0';
	do_subbytes <= '0';
	do_llayer <= '0';
	do_done <= '1';
    end case;
  end process;

  update_state : process (clk, rst)
    variable counter : integer := 0;
  begin
    if rst = '1' then
      actual_state <= boot;
    elsif rising_edge (clk) then
      roundcounter <= counter;
      case actual_state is
	when boot =>
	  actual_state <= start;
	when start =>
	  actual_state <= roundconstant;
	when roundconstant =>
	  actual_state <= subbytes;
	  counter := counter + 1;
	when subbytes =>
	  actual_state <= llayer;
	when llayer =>
	  actual_state <= keyxor;
	when keyxor =>
	  if counter < 12 then
	    actual_state <= roundconstant;
	  else
	    actual_state <= done;
	  end if;
	when done =>
	  actual_state <= done;
      end case;
    end if;
  end process;
end behav;
