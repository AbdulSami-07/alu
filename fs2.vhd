library ieee;
use ieee.std_logic_1164.all;

entity fs2 is
port(
    a: in std_logic_vector (1 downto 0);
    b: in std_logic_vector (1 downto 0);
    bin: in std_logic;
    diff: out std_logic_vector (1 downto 0);
    bout: out std_logic
);
end entity;

architecture gate_level of fs2 is

component fs is
port(
    a: in std_logic;
    b: in std_logic;
    bin: in std_logic;
    diff: out std_logic;
    bout: out std_logic
);
end component;

signal w: std_logic;-- (1 downto 0);

begin

fs0: fs port map (a => a(0), b => b(0), bin => bin, diff => diff(0), bout => w);
fs1: fs port map (a => a(1), b => b(1), bin => w, diff => diff(1), bout => bout);

end architecture;