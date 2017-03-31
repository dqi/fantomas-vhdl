library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity fantomas_core is
  port (
    clk : in std_logic;
    rst : in std_logic;
    pt  : in std_logic_vector(127 downto 0);
    key : in std_logic_vector(127 downto 0);

    ct  : out std_logic_vector(127 downto 0)
  );
end entity fantomas_core;

architecture behav of fantomas_core is

  -- Components
  component fantomas_state_machine
    port(
      clk : in std_logic;
      rst : in std_logic;
      -- States we can output
      do_start		: out std_logic;
      do_keyxor			: out std_logic;
      do_roundconstant 		: out std_logic;
      do_subbytes 		: out std_logic;
      do_llayer 		: out std_logic;
      do_done 			: out std_logic;
      -- The roundcounter
      roundcounter 		: out integer
    );
  end component;

  component fantomas_key
    port(
      a : in std_logic_vector(127 downto 0);
      k : in std_logic_vector(127 downto 0);
      o : out std_logic_vector(127 downto 0)
    );
  end component;

  component fantomas_subbytes
    port(
      a: in std_logic_vector(127 downto 0);
      o: out std_logic_vector(127 downto 0)
    );
  end component;

  component fantomas_llayer
    port(
      a: in std_logic_vector(127 downto 0);
      o: out std_logic_vector(127 downto 0)
    );
  end component;

  component fantomas_rc
    port(
      a : in std_logic_vector(127 downto 0);
      i : in integer;
      o : out std_logic_vector(127 downto 0)
    );
  end component;

  -- Signals
    -- For state machine
  signal do_start		: std_logic;
  signal do_keyxor		: std_logic;
  signal do_roundconstant 	: std_logic;
  signal do_subbytes 		: std_logic;
  signal do_llayer 		: std_logic;
  signal do_done 		: std_logic;
  signal roundcounter_s 	: integer;
  signal roundcounter_l 	: integer := 0;

  -- For keyxorring
  signal b_keyxor : std_logic_vector(127 downto 0);
  signal a_keyxor : std_logic_vector(127 downto 0);

  -- For subbyres
  signal b_sbox : std_logic_vector(127 downto 0);
  signal a_sbox : std_logic_vector(127 downto 0);

  -- For llayer
  signal b_llay : std_logic_vector(127 downto 0);
  signal a_llay : std_logic_vector(127 downto 0);

  -- For roundconstant
  signal b_rc : std_logic_vector(127 downto 0);
  signal a_rc : std_logic_vector(127 downto 0);

begin

  -- Instantiate state machine
  state_machine: fantomas_state_machine
    port map(
      clk => clk,
      rst => rst,

      do_start => do_start,
      do_keyxor => do_keyxor,
      do_roundconstant => do_roundconstant,
      do_subbytes => do_subbytes,
      do_llayer => do_llayer,
      do_done => do_done,

      roundcounter => roundcounter_s
    );

  -- Instantiate keyxor
  keyxor: fantomas_key
    port map(
      a => b_keyxor,
      k => key,
      o => a_keyxor
    );

  -- Instantiate subbytes
  subbytes: fantomas_subbytes
    port map(
      a => b_sbox,
      o => a_sbox
    );

  -- Instantiate llay
  llayer: fantomas_llayer
    port map(
      a => b_llay,
      o => a_llay
    );

  -- Instantiate rc
  rc: fantomas_rc
    port map(
      a => b_rc,
      i => roundcounter_l,
      o => a_rc
    );

    process (clk)
    begin
      if rising_edge (clk) then
	if do_start = '1' then
	  b_keyxor <= pt;
	end if;
	if do_keyxor = '1' then
	  b_keyxor <= a_llay;
	end if;
	if do_roundconstant = '1' then
	  roundcounter_l <= roundcounter_s;
	  b_rc <= a_keyxor;
	  -- To see round output
	  ct <= a_keyxor;
	end if;
	if do_subbytes = '1' then
	  b_sbox <= a_rc;
	end if;
	if do_llayer = '1' then
	  b_llay <= a_sbox;
	end if;
	if do_done = '1' then
	  ct <= a_keyxor;
	end if;
      end if;
    end process;

end behav;
