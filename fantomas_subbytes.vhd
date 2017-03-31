library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fantomas_subbytes is
  port (
    a : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0)
  );
end entity fantomas_subbytes;

architecture behav of fantomas_subbytes is

  -- sbox component
    component fantomas_sbox
    port(
      a: in std_logic_vector(7 downto 0);
      o: out std_logic_vector(7 downto 0)
    );
  end component;

  -- Input signals for the individual s-boxes.
  signal c0i : std_logic_vector(7 downto 0);
  signal c1i : std_logic_vector(7 downto 0);
  signal c2i : std_logic_vector(7 downto 0);
  signal c3i : std_logic_vector(7 downto 0);
  signal c4i : std_logic_vector(7 downto 0);
  signal c5i : std_logic_vector(7 downto 0);
  signal c6i : std_logic_vector(7 downto 0);
  signal c7i : std_logic_vector(7 downto 0);
  signal c8i : std_logic_vector(7 downto 0);
  signal c9i : std_logic_vector(7 downto 0);
  signal c10i : std_logic_vector(7 downto 0);
  signal c11i : std_logic_vector(7 downto 0);
  signal c12i : std_logic_vector(7 downto 0);
  signal c13i : std_logic_vector(7 downto 0);
  signal c14i : std_logic_vector(7 downto 0);
  signal c15i : std_logic_vector(7 downto 0);

  -- Output signals from the individual s-boxes.
  signal c0o : std_logic_vector(7 downto 0);
  signal c1o : std_logic_vector(7 downto 0);
  signal c2o : std_logic_vector(7 downto 0);
  signal c3o : std_logic_vector(7 downto 0);
  signal c4o : std_logic_vector(7 downto 0);
  signal c5o : std_logic_vector(7 downto 0);
  signal c6o : std_logic_vector(7 downto 0);
  signal c7o : std_logic_vector(7 downto 0);
  signal c8o : std_logic_vector(7 downto 0);
  signal c9o : std_logic_vector(7 downto 0);
  signal c10o : std_logic_vector(7 downto 0);
  signal c11o : std_logic_vector(7 downto 0);
  signal c12o : std_logic_vector(7 downto 0);
  signal c13o : std_logic_vector(7 downto 0);
  signal c14o : std_logic_vector(7 downto 0);
  signal c15o : std_logic_vector(7 downto 0);

begin

--   c0i <= a(112) & a(96) & a(80) & a(64) & a(48) & a(32) & a(16) & a(0);
--   c1i <= a(113) & a(97) & a(81) & a(65) & a(49) & a(33) & a(17) & a(1);
--   c2i <= a(114) & a(98) & a(82) & a(66) & a(50) & a(34) & a(18) & a(2);
--   c3i <= a(115) & a(99) & a(83) & a(67) & a(51) & a(35) & a(19) & a(3);
--   c4i <= a(116) & a(100) & a(84) & a(68) & a(52) & a(36) & a(20) & a(4);
--   c5i <= a(117) & a(101) & a(85) & a(69) & a(53) & a(37) & a(21) & a(5);
--   c6i <= a(118) & a(102) & a(86) & a(70) & a(54) & a(38) & a(22) & a(6);
--   c7i <= a(119) & a(103) & a(87) & a(71) & a(55) & a(39) & a(23) & a(7);
--   c8i <= a(120) & a(104) & a(88) & a(72) & a(56) & a(40) & a(24) & a(8);
--   c9i <= a(121) & a(105) & a(89) & a(73) & a(57) & a(41) & a(25) & a(9);
--   c10i <= a(122) & a(106) & a(90) & a(74) & a(58) & a(42) & a(26) & a(10);
--   c11i <= a(123) & a(107) & a(91) & a(75) & a(59) & a(43) & a(27) & a(11);
--   c12i <= a(124) & a(108) & a(92) & a(76) & a(60) & a(44) & a(28) & a(12);
--   c13i <= a(125) & a(109) & a(93) & a(77) & a(61) & a(45) & a(29) & a(13);
--   c14i <= a(126) & a(110) & a(94) & a(78) & a(62) & a(46) & a(30) & a(14);
--   c15i <= a(127) & a(111) & a(95) & a(79) & a(63) & a(47) & a(31) & a(15);

  c0i <= a(7 downto 0);
  c1i <= a(15 downto 8);
  c2i <= a(23 downto 16);
  c3i <= a(31 downto 24);
  c4i <= a(39 downto 32);
  c5i <= a(47 downto 40);
  c6i <= a(55 downto 48);
  c7i <= a(63 downto 56);
  c8i <= a(71 downto 64);
  c9i <= a(79 downto 72);
  c10i <= a(87 downto 80);
  c11i <= a(95 downto 88);
  c12i <= a(103 downto 96);
  c13i <= a(111 downto 104);
  c14i <= a(119 downto 112);
  c15i <= a(127 downto 120);

  -- Instantiate sbox component.
  sbox0: fantomas_sbox
    port map(
      a => c0i,
      o => c0o
    );

  -- Instantiate sbox component.
  sbox1: fantomas_sbox
    port map(
      a => c1i,
      o => c1o
    );

  -- Instantiate sbox component.
  sbox2: fantomas_sbox
    port map(
      a => c2i,
      o => c2o
    );

  -- Instantiate sbox component.
  sbox3: fantomas_sbox
    port map(
      a => c3i,
      o => c3o
    );

  -- Instantiate sbox component.
  sbox4: fantomas_sbox
    port map(
      a => c4i,
      o => c4o
    );

  -- Instantiate sbox component.
  sbox5: fantomas_sbox
    port map(
      a => c5i,
      o => c5o
    );

  -- Instantiate sbox component.
  sbox6: fantomas_sbox
    port map(
      a => c6i,
      o => c6o
    );

  -- Instantiate sbox component.
  sbox7: fantomas_sbox
    port map(
      a => c7i,
      o => c7o
    );

  -- Instantiate sbox component.
  sbox8: fantomas_sbox
    port map(
      a => c8i,
      o => c8o
    );

  -- Instantiate sbox component.
  sbox9: fantomas_sbox
    port map(
      a => c9i,
      o => c9o
    );

  -- Instantiate sbox component.
  sbox10: fantomas_sbox
    port map(
      a => c10i,
      o => c10o
    );

  -- Instantiate sbox component.
  sbox11: fantomas_sbox
    port map(
      a => c11i,
      o => c11o
    );

  -- Instantiate sbox component.
  sbox12: fantomas_sbox
    port map(
      a => c12i,
      o => c12o
    );

  -- Instantiate sbox component.
  sbox13: fantomas_sbox
    port map(
      a => c13i,
      o => c13o
    );

  -- Instantiate sbox component.
  sbox14: fantomas_sbox
    port map(
      a => c14i,
      o => c14o
    );

  -- Instantiate sbox component.
  sbox15: fantomas_sbox
    port map(
      a => c15i,
      o => c15o
    );

    o <= c15o & c14o & c13o & c12o & c11o & c10o & c9o & c8o & c7o & c6o & c5o &
	 c4o & c3o & c2o & c1o & c0o;
--   o(112) <= c0o(7);
--   o(96) <= c0o(6);
--   o(80) <= c0o(5);
--   o(64) <= c0o(4);
--   o(48) <= c0o(3);
--   o(32) <= c0o(2);
--   o(16) <= c0o(1);
--   o(0) <= c0o(0);

--   o(113) <= c1o(7);
--   o(97) <= c1o(6);
--   o(81) <= c1o(5);
--   o(65) <= c1o(4);
--   o(49) <= c1o(3);
--   o(33) <= c1o(2);
--   o(17) <= c1o(1);
--   o(1) <= c1o(0);

--   o(114) <= c2o(7);
--   o(98) <= c2o(6);
--   o(82) <= c2o(5);
--   o(66) <= c2o(4);
--   o(50) <= c2o(3);
--   o(34) <= c2o(2);
--   o(18) <= c2o(1);
--   o(2) <= c2o(0);

--   o(115) <= c3o(7);
--   o(99) <= c3o(6);
--   o(83) <= c3o(5);
--   o(67) <= c3o(4);
--   o(51) <= c3o(3);
--   o(35) <= c3o(2);
--   o(19) <= c3o(1);
--   o(3) <= c3o(0);

--   o(116) <= c4o(7);
--   o(100) <= c4o(6);
--   o(84) <= c4o(5);
--   o(68) <= c4o(4);
--   o(52) <= c4o(3);
--   o(36) <= c4o(2);
--   o(20) <= c4o(1);
--   o(4) <= c4o(0);

--   o(117) <= c5o(7);
--   o(101) <= c5o(6);
--   o(85) <= c5o(5);
--   o(69) <= c5o(4);
--   o(53) <= c5o(3);
--   o(37) <= c5o(2);
--   o(21) <= c5o(1);
--   o(5) <= c5o(0);

--   o(118) <= c6o(7);
--   o(102) <= c6o(6);
--   o(86) <= c6o(5);
--   o(70) <= c6o(4);
--   o(54) <= c6o(3);
--   o(38) <= c6o(2);
--   o(22) <= c6o(1);
--   o(6) <= c6o(0);

--   o(119) <= c7o(7);
--   o(103) <= c7o(6);
--   o(87) <= c7o(5);
--   o(71) <= c7o(4);
--   o(55) <= c7o(3);
--   o(39) <= c7o(2);
--   o(23) <= c7o(1);
--   o(7) <= c7o(0);

--   o(120) <= c8o(7);
--   o(104) <= c8o(6);
--   o(88) <= c8o(5);
--   o(72) <= c8o(4);
--   o(56) <= c8o(3);
--   o(40) <= c8o(2);
--   o(24) <= c8o(1);
--   o(8) <= c8o(0);

--   o(121) <= c9o(7);
--   o(105) <= c9o(6);
--   o(89) <= c9o(5);
--   o(73) <= c9o(4);
--   o(57) <= c9o(3);
--   o(41) <= c9o(2);
--   o(25) <= c9o(1);
--   o(9) <= c9o(0);

--   o(122) <= c10o(7);
--   o(106) <= c10o(6);
--   o(90) <= c10o(5);
--   o(74) <= c10o(4);
--   o(58) <= c10o(3);
--   o(42) <= c10o(2);
--   o(26) <= c10o(1);
--   o(10) <= c10o(0);

--   o(123) <= c11o(7);
--   o(107) <= c11o(6);
--   o(91) <= c11o(5);
--   o(75) <= c11o(4);
--   o(59) <= c11o(3);
--   o(43) <= c11o(2);
--   o(27) <= c11o(1);
--   o(11) <= c11o(0);

--   o(124) <= c12o(7);
--   o(108) <= c12o(6);
--   o(92) <= c12o(5);
--   o(76) <= c12o(4);
--   o(60) <= c12o(3);
--   o(44) <= c12o(2);
--   o(28) <= c12o(1);
--   o(12) <= c12o(0);

--   o(125) <= c13o(7);
--   o(109) <= c13o(6);
--   o(93) <= c13o(5);
--   o(77) <= c13o(4);
--   o(61) <= c13o(3);
--   o(45) <= c13o(2);
--   o(29) <= c13o(1);
--   o(13) <= c13o(0);

--   o(126) <= c14o(7);
--   o(110) <= c14o(6);
--   o(94) <= c14o(5);
--   o(78) <= c14o(4);
--   o(62) <= c14o(3);
--   o(46) <= c14o(2);
--   o(30) <= c14o(1);
--   o(14) <= c14o(0);

--   o(127) <= c15o(7);
--   o(111) <= c15o(6);
--   o(95) <= c15o(5);
--   o(79) <= c15o(4);
--   o(63) <= c15o(3);
--   o(47) <= c15o(2);
--   o(31) <= c15o(1);
--   o(15) <= c15o(0);

end behav;
