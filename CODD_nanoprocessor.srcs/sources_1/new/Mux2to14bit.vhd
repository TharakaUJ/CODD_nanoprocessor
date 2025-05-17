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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux2to1_4bit is
    Port ( sel : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux2to1_4bit;

architecture gate_level of Mux2to1_4bit is

begin
    y(0) <= (a(0) and not sel) or (b(0) and sel);
    y(1) <= (a(1) and not sel) or (b(1) and sel);
    y(2) <= (a(2) and not sel) or (b(2) and sel);
    y(3) <= (a(3) and not sel) or (b(3) and sel);

end gate_level; 
