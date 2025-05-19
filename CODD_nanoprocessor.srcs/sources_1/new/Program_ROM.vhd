----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 02:34:54 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
        I : out STD_LOGIC_VECTOR (11 downto 0));
    end Program_ROM;

architecture Behavioral of Program_ROM is
-- Program that displays numbers by decrementing 10 by 1
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal PROGRAM_ROM : rom_type := (
        "101110000010", -- 0 -- MOVI R7, 10
        "100100000001", -- 1 -- MOVI R2, 1
        "010100000000", -- 2 -- NEG R2
        "001110100000", -- 3 -- ADD R7, R2
        "111110000111", -- 4 -- JZR R7, 7
        "110000000011", -- 5 -- JZR R0, 3
        "111110000111", -- 6 -- JZR R1, 7 
        "110000000000"  -- 7 -- END

        -- "101110000010", -- 0 -- MOVI R7, 2
        -- "100100000001", -- 1 -- MOVI R2, 1
        -- "001110100000", -- 2 -- ADD R7, R2
        -- "001110100000", -- 2 -- ADD R7, R2
        -- "001110100000", -- 2 -- ADD R7, R2
        -- "001110100000", -- 2 -- ADD R7, R2
        -- "001110100000", -- 2 -- ADD R7, R2
        -- "110000000000"  -- 7 -- END
   ); 
     
begin
    I <= PROGRAM_ROM(to_integer(unsigned(D)));

end Behavioral;