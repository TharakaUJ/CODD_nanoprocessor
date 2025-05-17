----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 11:07:25 AM
-- Design Name: 
-- Module Name: TB_mux_2to1_4bit - Behavioral
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

entity TB_mux_2to1_4bit is
--  Port ( );
end TB_mux_2to1_4bit;

architecture Behavioral of TB_mux_2to1_4bit is
component Mux2to1_4bit
    Port ( a: in STD_LOGIC_VECTOR (3 downto 0);
           b: in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
signal D0,D1,Y : std_logic_vector(3 downto 0);
signal S : std_logic;


begin

UUT : Mux2to1_4bit 
        port map(
        a => D0,
        b => D1,
        sel => S,
        y => Y
        );

process
begin 

    D0 <= "1110";  -- Index 230324D = 111000001110110100
    D1 <= "0000";
    S <= '0';
    wait for 100ns;
    
    S <= '1';
    wait for 100ns;
    
    D0 <= "1110";
    D1 <= "1101";
    S <= '0';
    wait for 100ns;
    
    S <= '1';
    wait;

end process;

end Behavioral;
