library ieee;
use ieee.std_logic_1164.all;

entity fs8 is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    bin: in std_logic;
    diff: out std_logic_vector (7 downto 0);
    bout: out std_logic
);
end entity;

architecture gate_level of fs8 is

component fs4 is
port(
    a: in std_logic_vector (3 downto 0);
    b: in std_logic_vector (3 downto 0);
    bin: in std_logic;
    diff: out std_logic_vector (3 downto 0);
    bout: out std_logic
);
end component;

signal w: std_logic;-- (1 downto 0);

begin

fs4_0: fs4 port map (a => a(3 downto 0), b => b(3 downto 0), bin => bin, diff => diff(3 downto 0), bout => w);
fs4_1: fs4 port map (a => a(7 downto 4), b => b(7 downto 4), bin => w, diff => diff(7 downto 4), bout => bout);

end architecture;