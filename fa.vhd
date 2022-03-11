library ieee;
use ieee.std_logic_1164.all;

entity fa is
port(
    a: in std_logic;
    b: in std_logic;
    cin: in std_logic;
    sum: out std_logic;
    cout: out std_logic
);
end entity;

architecture gate_level of fa is
signal w: std_logic;
begin
    w <= a xor b;
    sum <= w xor cin;
    cout <= (w and cin) or (a and b);
end architecture;