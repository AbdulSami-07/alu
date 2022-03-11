library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8 is
port(
    i0: in std_logic_vector (7 downto 0);
    i1: in std_logic_vector (7 downto 0);
    sel: in std_logic;
    y: out std_logic_vector (7 downto 0)
);
end entity;

architecture behavioral of mux2to1_8 is
begin
    y <= i0 when sel = '0' else
         i1 when sel = '1' else
         x"00";
end architecture;