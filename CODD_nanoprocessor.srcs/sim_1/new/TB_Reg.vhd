----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 08:39:25 PM
-- Design Name: 
-- Module Name: TB_Reg - Behavioral
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

entity TB_Reg is
--  Port ( );
end TB_Reg;

architecture Behavioral of TB_Reg is
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Reset: in STD_LOGIC;
           Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal D : STD_LOGIC_VECTOR (3 downto 0):= "0000";
    signal Clk : STD_LOGIC:= '0';
    signal Q : STD_LOGIC_VECTOR (3 downto 0);
    signal Reset: STD_LOGIC;
    signal En: STD_LOGIC:= '0';

begin
    UUT: Reg port map(
        D => D,
        Reset => Reset,
        En => En,
        Clk => Clk,
        Q => Q
    );
    
    CLK <= not CLK after 50ns;

        --INDEX (230514K)
        --INDEX (230146H) TO BINARY --> 11 1000 0000 0011 1010
    
    process begin
            Reset <= '0';
            En <= '1';
            D <= "1110"; -- 14 FROM 514K
                    
            wait for 100ns;
            En <= '1';
            D <= "1010"; -- FROM 230146h binary last 4 bits
            
            wait for 100ns;
            En <= '1';
            D <= "0011"; --binary 230146H
            
            wait for 100ns;
            Reset <= '1';
            En <= '1';
            D <= "1000"; --binary 230146H
            wait;
                
    end process;

end Behavioral;
