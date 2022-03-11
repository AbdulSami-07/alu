library ieee;
use ieee.std_logic_1164.all;

entity fa2 is
port(
    a: in std_logic_vector (1 downto 0);
    b: in std_logic_vector (1 downto 0);
    cin: in std_logic;
    sum: out std_logic_vector (1 downto 0);
    cout: out std_logic
);
end entity;

architecture gate_level of fa2 is

component fa is
port(
    a: in std_logic;
    b: in std_logic;
    cin: in std_logic;
    sum: out std_logic;
    cout: out std_logic
);
end component;

signal w: std_logic;-- (1 downto 0);

begin

fa0: fa port map (a => a(0), b => b(0), cin => cin, sum => sum(0), cout => w);
fa1: fa port map (a => a(1), b => b(1), cin => w, sum => sum(1), cout => cout);

end architecture;