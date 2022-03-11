library ieee;
use ieee.std_logic_1164.all;

entity logic_unit is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    opcode: in std_logic_vector (3 downto 0);
    y: out std_logic_vector (7 downto 0)
);
end entity;

architecture gate_level of logic_unit is
begin
    with opcode  select
    y <= (not a) when "0000",
         (not b) when "0001",
         (a and b) when "0010",
         (a or b) when "0011",
         (a nand b) when "0100",
         (a nor b) when "0101",
         (a xor b) when "0110",
         (a xnor b) when "0111",
         (others => '0') when others;
         
end architecture;