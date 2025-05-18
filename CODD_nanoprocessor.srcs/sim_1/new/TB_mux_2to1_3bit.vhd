----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 11:17:03 PM
-- Design Name: 
-- Module Name: TB_mux_2to1_3bit - Behavioral
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

entity TB_mux_2to1_3bit is
--  Port ( );
end TB_mux_2to1_3bit;

architecture Behavioral of TB_mux_2to1_3bit is
component mux_2to1_3bit
    Port ( a: in STD_LOGIC_VECTOR (2 downto 0);
           b: in STD_LOGIC_VECTOR (2 downto 0);
           sel : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (2 downto 0)
);
end component;
signal D0,D1,Y : std_logic_vector(2 downto 0);
signal S : std_logic;


begin

UUT : mux_2to1_3bit 
        port map(
        a => D0,
        b => D1,
        sel => S,
        y => Y
        );

process
begin 

    D0 <= "111";  -- Index 230324D = 111000001110110100
    D1 <= "000";
    S <= '0';
    wait for 100ns;
    
    S <= '1';
    wait for 100ns;
    
    D0 <= "001";
    D1 <= "110";
    S <= '0';
    wait for 100ns;
    
    S <= '1';
    wait for 100ns;
    
    D0 <= "001";
    D1 <= "110";
    S <= '0';
    wait for 100ns;
       
    S <= '1';
    wait for 100ns;
     
    D0 <= "110";
    D1 <= "100";
    S <= '0';
    wait for 100ns;
        
    S <= '1';
    wait;
    

end process;

end Behavioral;