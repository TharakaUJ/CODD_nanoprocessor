library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_3bit is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           b : in STD_LOGIC_VECTOR (2 downto 0);
           sel : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (2 downto 0));
end mux_2to1_3bit;

architecture gate_level of mux_2to1_3bit is
begin
    y(0) <= (a(0) and not sel) or (b(0) and sel);
    y(1) <= (a(1) and not sel) or (b(1) and sel);
    y(2) <= (a(2) and not sel) or (b(2) and sel);
end gate_level;