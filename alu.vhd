library ieee;
use ieee.std_logic_1164.all;

entity alu is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    opcode: in std_logic_vector (3 downto 0);
    cin: in std_logic;
    y: out std_logic_vector (7 downto 0)
);
end entity;

architecture behavioral of alu is

component logic_unit is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    opcode: in std_logic_vector (3 downto 0);
    y: out std_logic_vector (7 downto 0)
);
end component;

component arithmetic_unit is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    opcode: in std_logic_vector (3 downto 0);
    cin: in std_logic;
    y: out std_logic_vector (7 downto 0)
);
end component;

component mux2to1_8 is
port(
    i0: in std_logic_vector (7 downto 0);
    i1: in std_logic_vector (7 downto 0);
    sel: in std_logic;
    y: out std_logic_vector (7 downto 0)
);
end component;

signal w0, w1: std_logic_vector (7 downto 0);

begin
    lu0: logic_unit port map (a => a, b => b, opcode => opcode, y => w0);
    au0: arithmetic_unit port map (a => a, b => b, opcode => opcode, cin => cin, y => w1);
    m21_8_0: mux2to1_8 port map (i0 => w0, i1 => w1, sel => opcode(3), y => y);
end architecture;