----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 03:34:44 PM
-- Design Name: 
-- Module Name: SIm_Program_ROM - Behavioral
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

entity SIm_Program_ROM is
--  Port ( );
end SIm_Program_ROM;

architecture Behavioral of SIm_Program_ROM is
    component Program_ROM
        port(D : in STD_LOGIC_VECTOR (2 downto 0);
             I : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    signal D : STD_LOGIC_VECTOR(2 downto 0);
    signal I : STD_LOGIC_VECTOR(11 downto 0);
   
begin
    UUT : Program_ROM
    port map(
         D => D,
         I => I
         );
     
    process 
    begin
            -- Index number : 230278M -> 111 000 001 110 000 110
            D <= "111";
            wait for 200ns;
            
            D <= "000";
            wait for 200ns;
                
            D <= "001";
            wait for 200ns;
                    
            D <= "110";
            wait;
    end process;    
end Behavioral;  