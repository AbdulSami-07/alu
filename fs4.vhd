library ieee;
use ieee.std_logic_1164.all;

entity fs4 is
port(
    a: in std_logic_vector (3 downto 0);
    b: in std_logic_vector (3 downto 0);
    bin: in std_logic;
    diff: out std_logic_vector (3 downto 0);
    bout: out std_logic
);
end entity;

architecture gate_level of fs4 is

component fs2 is
port(
    a: in std_logic_vector (1 downto 0);
    b: in std_logic_vector (1 downto 0);
    bin: in std_logic;
    diff: out std_logic_vector (1 downto 0);
    bout: out std_logic
);
end component;

signal w: std_logic;-- (1 downto 0);

begin

fs2_0: fs2 port map (a => a(1 downto 0), b => b(1 downto 0), bin => bin, diff => diff(1 downto 0), bout => w);
fs2_1: fs2 port map (a => a(3 downto 2), b => b(3 downto 2), bin => w, diff => diff(3 downto 2), bout => bout);

end architecture;