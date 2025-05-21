----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 10:42:51 AM
-- Design Name: 
-- Module Name: Mux2to1_4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2to1_4bit is
    Port ( sel : in STD_LOGIC;
           a   : in STD_LOGIC_VECTOR(3 downto 0);
           b   : in STD_LOGIC_VECTOR(3 downto 0);
           y   : out STD_LOGIC_VECTOR(3 downto 0));
end Mux2to1_4bit;

architecture behavioral of Mux2to1_4bit is
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
