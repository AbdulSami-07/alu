library ieee;
use ieee.std_logic_1164.all;

entity arithmetic_unit is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    opcode: in std_logic_vector (3 downto 0);
    cin: in std_logic;
    y: out std_logic_vector (7 downto 0)
);
end entity;

architecture gate_level of arithmetic_unit is

component fa8 is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    cin: in std_logic;
    sum: out std_logic_vector (7 downto 0);
    cout: out std_logic
);
end component;

component fs8 is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    bin: in std_logic;
    diff: out std_logic_vector (7 downto 0);
    bout: out std_logic
);
end component;

signal w0, w1, w2, w3: std_logic_vector (7 downto 0) := (others => '0');
signal t0: std_logic := '0';
signal s: std_logic_vector (16 downto 0) := w0 & w1 & t0;
begin

fa8_0: fa8 port map (a => w0, b => w1, cin => t0, sum => w2);
fs8_0: fs8 port map (a => w0, b => w1, bin => t0, diff => w3);
    
    with opcode select
        w0 <= a when "1010",
             b when "1011",
             a when "1100",
             b when "1101",
             a when "1110",
             a when "1111",
             x"00" when others;
     
     with opcode select
         w1 <= x"01" when "1010",
              x"01" when "1011",
              x"01" when "1100",
              x"01" when "1101",
              b when "1110",
              b when "1111",
              x"00" when others;

     with opcode select
         t0 <= '0' when "1010",
              '0' when "1011",
              '0' when "1100",
              '0' when "1101",
              '0' when "1110",
              cin when "1111",
              '0' when others;             
                         
    with opcode select
        y <= a when "1000",
             b when "1001",
             w2 when "1010",
             w2 when "1011",
             w3 when "1100",
             w3 when "1101",
             w2 when "1110",
             w2 when "1111",
             x"00" when others;
end architecture;