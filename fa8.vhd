library ieee;
use ieee.std_logic_1164.all;

entity fa8 is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    cin: in std_logic;
    sum: out std_logic_vector (7 downto 0);
    cout: out std_logic
);
end entity;

architecture gate_level of fa8 is

component fa4 is
port(
    a: in std_logic_vector (3 downto 0);
    b: in std_logic_vector (3 downto 0);
    cin: in std_logic;
    sum: out std_logic_vector (3 downto 0);
    cout: out std_logic
);
end component;

signal w: std_logic;-- (1 downto 0);

begin

fa4_0: fa4 port map (a => a(3 downto 0), b => b(3 downto 0), cin => cin, sum => sum(3 downto 0), cout => w);
fa4_1: fa4 port map (a => a(7 downto 4), b => b(7 downto 4), cin => w, sum => sum(7 downto 4), cout => cout);

end architecture;