library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity fantomas_rc is
	port (
		a : in std_logic_vector(127 downto 0);
		i : in integer;
		o : out std_logic_vector(127 downto 0)
	);
end entity fantomas_rc;

architecture behav of fantomas_rc is
  -----------------------------------------------------------------------------
  -- type definitions
  -----------------------------------------------------------------------------
  subtype byteint is integer range 0 to 65335;
  type bytearray is array (0 to 11) of byteint;
  -----------------------------------------------------------------------------
  -- constants
  -----------------------------------------------------------------------------
  constant rc : bytearray := (
  49151, 28304, 53615, 16695, 65224, 12199, 36952, 54600, 27319, 48088, 1063,
  38015
  );

begin
  process (a, i)
    variable x : std_logic_vector(15 downto 0);
    variable t : std_logic_vector(15 downto 0);
  begin
    x := a(0) & a(8) & a(16) & a(24) & a(32) & a(40) & a(48) & a(56) & a(64) & a(72) & a(80) & a(88) & a(96) & a(104) & a(112) & a(120);
    t := x xor std_logic_vector(to_unsigned(rc(i), 16));
    o <= a(127 downto 121) & t(0) & a(119 downto 113) & t(1) & a(111 downto 105)
	 & t(2) & a(103 downto 97) & t(3) & a(95 downto 89) & t(4) & a(87 downto
	 81) & t(5) & a(79 downto 73) & t(6) & a(71 downto 65) & t(7) & a(63
	 downto 57) & t(8) & a(55 downto 49) & t(9) & a(47 downto 41) & t(10) &
	 a(39 downto 33) & t(11) & a(31 downto 25) & t(12) & a(23 downto 17) &
	 t(13) & a(15 downto 9) & t(14) & a(7 downto 1) & t(15);
  end process;
end architecture behav;
