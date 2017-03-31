library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fantomas_llayer is
  port (
    a : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0)
  );
end entity fantomas_llayer;

architecture behav of fantomas_llayer is

  -- Input signals for the invividual l-boxes
  signal r0l : std_logic_vector(7 downto 0);
  signal r0r : std_logic_vector(7 downto 0);

  signal r1l : std_logic_vector(7 downto 0);
  signal r1r : std_logic_vector(7 downto 0);

  signal r2l : std_logic_vector(7 downto 0);
  signal r2r : std_logic_vector(7 downto 0);

  signal r3l : std_logic_vector(7 downto 0);
  signal r3r : std_logic_vector(7 downto 0);

  signal r4l : std_logic_vector(7 downto 0);
  signal r4r : std_logic_vector(7 downto 0);

  signal r5l : std_logic_vector(7 downto 0);
  signal r5r : std_logic_vector(7 downto 0);

  signal r6l : std_logic_vector(7 downto 0);
  signal r6r : std_logic_vector(7 downto 0);

  signal r7l : std_logic_vector(7 downto 0);
  signal r7r : std_logic_vector(7 downto 0);

  -- Output signals for the l-boxes
  signal r0o : std_logic_vector(15 downto 0);
  signal r1o : std_logic_vector(15 downto 0);
  signal r2o : std_logic_vector(15 downto 0);
  signal r3o : std_logic_vector(15 downto 0);
  signal r4o : std_logic_vector(15 downto 0);
  signal r5o : std_logic_vector(15 downto 0);
  signal r6o : std_logic_vector(15 downto 0);
  signal r7o : std_logic_vector(15 downto 0);

  -- lbox component
    component fantomas_lbox
    port(
      a1: in std_logic_vector(7 downto 0);
      a2: in std_logic_vector(7 downto 0);
      o: out std_logic_vector(15 downto 0)
    );
  end component;

begin
--   r0l <= a(7 downto 0);
--   r0r <= a(15 downto 8);

--   r1l <= a(23 downto 16);
--   r1r <= a(31 downto 24);

--   r2l <= a(39 downto 32);
--   r2r <= a(47 downto 40);

--   r3l <= a(55 downto 48);
--   r3r <= a(63 downto 56);

--   r4l <= a(71 downto 64);
--   r4r <= a(79 downto 72);

--   r5l <= a(87 downto 80);
--   r5r <= a(95 downto 88);

--   r6l <= a(103 downto 96);
--   r6r <= a(111 downto 104);

--   r7l <= a(119 downto 112);
--   r7r <= a(127 downto 120);

--   r0l <= a(56) & a(48) & a(40) & a(32) & a(24) & a(16) & a(8) & a(0);
--   r0r <= a(120) & a(112) & a(104) & a(96) & a(88) & a(80) & a(72) & a(64);

--   r1l <= a(57) & a(49) & a(41) & a(33) & a(25) & a(17) & a(9) & a(1);
--   r1r <= a(121) & a(113) & a(105) & a(97) & a(89) & a(81) & a(73) & a(65);

--   r2l <= a(58) & a(50) & a(42) & a(34) & a(26) & a(18) & a(10) & a(2);
--   r2r <= a(122) & a(114) & a(106) & a(98) & a(90) & a(82) & a(74) & a(66);

--   r3l <= a(59) & a(51) & a(43) & a(35) & a(27) & a(19) & a(11) & a(3);
--   r3r <= a(123) & a(115) & a(107) & a(99) & a(91) & a(83) & a(75) & a(67);

--   r4l <= a(60) & a(52) & a(44) & a(36) & a(28) & a(20) & a(12) & a(4);
--   r4r <= a(124) & a(116) & a(108) & a(100) & a(92) & a(84) & a(76) & a(68);

--   r5l <= a(61) & a(53) & a(45) & a(37) & a(29) & a(21) & a(13) & a(5);
--   r5r <= a(125) & a(117) & a(109) & a(101) & a(93) & a(85) & a(77) & a(69);

--   r6l <= a(62) & a(54) & a(46) & a(38) & a(30) & a(22) & a(14) & a(6);
--   r6r <= a(126) & a(118) & a(110) & a(102) & a(94) & a(86) & a(78) & a(70);

--   r7l <= a(63) & a(55) & a(47) & a(39) & a(31) & a(23) & a(15) & a(7);
--   r7r <= a(127) & a(119) & a(111) & a(103) & a(95) & a(87) & a(79) & a(71);

  r0l <= a(64) & a(72) & a(80) & a(88) & a(96) & a(104) & a(112) & a(120);
  r0r <= a(0) & a(8) & a(16) & a(24) & a(32) & a(40) & a(48) & a(56);

  r1l <= a(65) & a(73) & a(81) & a(89) & a(97) & a(105) & a(113) & a(121);
  r1r <= a(1) & a(9) & a(17) & a(25) & a(33) & a(41) & a(49) & a(57);

  r2l <= a(66) & a(74) & a(82) & a(90) & a(98) & a(106) & a(114) & a(122);
  r2r <= a(2) & a(10) & a(18) & a(26) & a(34) & a(42) & a(50) & a(58);

  r3l <= a(67) & a(75) & a(83) & a(91) & a(99) & a(107) & a(115) & a(123);
  r3r <= a(3) & a(11) & a(19) & a(27) & a(35) & a(43) & a(51) & a(59);

  r4l <= a(68) & a(76) & a(84) & a(92) & a(100) & a(108) & a(116) & a(124);
  r4r <= a(4) & a(12) & a(20) & a(28) & a(36) & a(44) & a(52) & a(60);

  r5l <= a(69) & a(77) & a(85) & a(93) & a(101) & a(109) & a(117) & a(125);
  r5r <= a(5) & a(13) & a(21) & a(29) & a(37) & a(45) & a(53) & a(61);

  r6l <= a(70) & a(78) & a(86) & a(94) & a(102) & a(110) & a(118) & a(126);
  r6r <= a(6) & a(14) & a(22) & a(30) & a(38) & a(46) & a(54) & a(62);

  r7l <= a(71) & a(79) & a(87) & a(95) & a(103) & a(111) & a(119) & a(127);
  r7r <= a(7) & a(15) & a(23) & a(31) & a(39) & a(47) & a(55) & a(63);

  -- Instantiate lbox component.
  lbox0: fantomas_lbox
    port map(
      a1 => r0l,
      a2 => r0r,
      o => r0o
    );

  -- Instantiate lbox component.
  lbox1: fantomas_lbox
    port map(
      a1 => r1l,
      a2 => r1r,
      o => r1o
    );

  -- Instantiate lbox component.
  lbox2: fantomas_lbox
    port map(
      a1 => r2l,
      a2 => r2r,
      o => r2o
    );

  -- Instantiate lbox component.
  lbox3: fantomas_lbox
    port map(
      a1 => r3l,
      a2 => r3r,
      o => r3o
    );

  -- Instantiate lbox component.
  lbox4: fantomas_lbox
    port map(
      a1 => r4l,
      a2 => r4r,
      o => r4o
    );

  -- Instantiate lbox component.
  lbox5: fantomas_lbox
    port map(
      a1 => r5l,
      a2 => r5r,
      o => r5o
    );

  -- Instantiate lbox component.
  lbox6: fantomas_lbox
    port map(
      a1 => r6l,
      a2 => r6r,
      o => r6o
    );

  -- Instantiate lbox component.
  lbox7: fantomas_lbox
    port map(
      a1 => r7l,
      a2 => r7r,
      o => r7o
    );

  o(120) <= r0o(0);
  o(112) <= r0o(1);
  o(104) <= r0o(2);
  o(96) <= r0o(3);
  o(88) <= r0o(4);
  o(80) <= r0o(5);
  o(72) <= r0o(6);
  o(64) <= r0o(7);
  o(56) <= r0o(8);
  o(48) <= r0o(9);
  o(40) <= r0o(10);
  o(32) <= r0o(11);
  o(24) <= r0o(12);
  o(16) <= r0o(13);
  o(8) <= r0o(14);
  o(0) <= r0o(15);

  o(121) <= r1o(0);
  o(113) <= r1o(1);
  o(105) <= r1o(2);
  o(97) <= r1o(3);
  o(89) <= r1o(4);
  o(81) <= r1o(5);
  o(73) <= r1o(6);
  o(65) <= r1o(7);
  o(57) <= r1o(8);
  o(49) <= r1o(9);
  o(41) <= r1o(10);
  o(33) <= r1o(11);
  o(25) <= r1o(12);
  o(17) <= r1o(13);
  o(9) <= r1o(14);
  o(1) <= r1o(15);

  o(122) <= r2o(0);
  o(114) <= r2o(1);
  o(106) <= r2o(2);
  o(98) <= r2o(3);
  o(90) <= r2o(4);
  o(82) <= r2o(5);
  o(74) <= r2o(6);
  o(66) <= r2o(7);
  o(58) <= r2o(8);
  o(50) <= r2o(9);
  o(42) <= r2o(10);
  o(34) <= r2o(11);
  o(26) <= r2o(12);
  o(18) <= r2o(13);
  o(10) <= r2o(14);
  o(2) <= r2o(15);

  o(123) <= r3o(0);
  o(115) <= r3o(1);
  o(107) <= r3o(2);
  o(99) <= r3o(3);
  o(91) <= r3o(4);
  o(83) <= r3o(5);
  o(75) <= r3o(6);
  o(67) <= r3o(7);
  o(59) <= r3o(8);
  o(51) <= r3o(9);
  o(43) <= r3o(10);
  o(35) <= r3o(11);
  o(27) <= r3o(12);
  o(19) <= r3o(13);
  o(11) <= r3o(14);
  o(3) <= r3o(15);

  o(124) <= r4o(0);
  o(116) <= r4o(1);
  o(108) <= r4o(2);
  o(100) <= r4o(3);
  o(92) <= r4o(4);
  o(84) <= r4o(5);
  o(76) <= r4o(6);
  o(68) <= r4o(7);
  o(60) <= r4o(8);
  o(52) <= r4o(9);
  o(44) <= r4o(10);
  o(36) <= r4o(11);
  o(28) <= r4o(12);
  o(20) <= r4o(13);
  o(12) <= r4o(14);
  o(4) <= r4o(15);

  o(125) <= r5o(0);
  o(117) <= r5o(1);
  o(109) <= r5o(2);
  o(101) <= r5o(3);
  o(93) <= r5o(4);
  o(85) <= r5o(5);
  o(77) <= r5o(6);
  o(69) <= r5o(7);
  o(61) <= r5o(8);
  o(53) <= r5o(9);
  o(45) <= r5o(10);
  o(37) <= r5o(11);
  o(29) <= r5o(12);
  o(21) <= r5o(13);
  o(13) <= r5o(14);
  o(5) <= r5o(15);

  o(126) <= r6o(0);
  o(118) <= r6o(1);
  o(110) <= r6o(2);
  o(102) <= r6o(3);
  o(94) <= r6o(4);
  o(86) <= r6o(5);
  o(78) <= r6o(6);
  o(70) <= r6o(7);
  o(62) <= r6o(8);
  o(54) <= r6o(9);
  o(46) <= r6o(10);
  o(38) <= r6o(11);
  o(30) <= r6o(12);
  o(22) <= r6o(13);
  o(14) <= r6o(14);
  o(6) <= r6o(15);

  o(127) <= r7o(0);
  o(119) <= r7o(1);
  o(111) <= r7o(2);
  o(103) <= r7o(3);
  o(95) <= r7o(4);
  o(87) <= r7o(5);
  o(79) <= r7o(6);
  o(71) <= r7o(7);
  o(63) <= r7o(8);
  o(55) <= r7o(9);
  o(47) <= r7o(10);
  o(39) <= r7o(11);
  o(31) <= r7o(12);
  o(23) <= r7o(13);
  o(15) <= r7o(14);
  o(7) <= r7o(15);

end behav;
