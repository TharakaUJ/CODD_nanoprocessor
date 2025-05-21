library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_3bit is
    Port ( a   : in  STD_LOGIC_VECTOR(2 downto 0);
           b   : in  STD_LOGIC_VECTOR(2 downto 0);
           sel : in  STD_LOGIC;
           y   : out STD_LOGIC_VECTOR(2 downto 0));
end mux_2to1_3bit;

architecture behavioral of mux_2to1_3bit is
begin
    process(a, b, sel)
    begin
        if sel = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end behavioral;
