library ieee;
use ieee.std_logic_1164.all;

entity fs is
port(
    a: in std_logic;
    b: in std_logic;
    bin: in std_logic;
    diff: out std_logic;
    bout: out std_logic
);
end entity;

architecture gate_level of fs is
signal w: std_logic;
begin
    w <= a xor b;
    diff <= w xor bin;
    bout <= ((not w) and bin) or ((not a) and b);
end architecture;