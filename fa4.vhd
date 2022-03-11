library ieee;
use ieee.std_logic_1164.all;

entity fa4 is
port(
    a: in std_logic_vector (3 downto 0);
    b: in std_logic_vector (3 downto 0);
    cin: in std_logic;
    sum: out std_logic_vector (3 downto 0);
    cout: out std_logic
);
end entity;

architecture gate_level of fa4 is

component fa2 is
port(
    a: in std_logic_vector (1 downto 0);
    b: in std_logic_vector (1 downto 0);
    cin: in std_logic;
    sum: out std_logic_vector (1 downto 0);
    cout: out std_logic
);
end component;

signal w: std_logic;-- (1 downto 0);

begin

fa2_0: fa2 port map (a => a(1 downto 0), b => b(1 downto 0), cin => cin, sum => sum(1 downto 0), cout => w);
fa2_1: fa2 port map (a => a(3 downto 2), b => b(3 downto 2), cin => w, sum => sum(3 downto 2), cout => cout);

end architecture;