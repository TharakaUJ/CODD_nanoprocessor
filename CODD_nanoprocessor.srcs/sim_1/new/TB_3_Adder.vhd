----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 09:18:18
-- Design Name: 
-- Module Name: TB_3_Adder - Behavioral
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

entity TB_3_Adder is
--  Port ( );
end TB_3_Adder;

architecture Behavioral of TB_3_Adder is
Component Adder_3_Bit
    port(
        A     : in  STD_LOGIC_VECTOR (2 downto 0);
        B     : in  STD_LOGIC_VECTOR (2 downto 0);
        C_in  : in  STD_LOGIC;
        S     : out STD_LOGIC_VECTOR (2 downto 0);
        C_out : out STD_LOGIC
    );
end component;
signal A     : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL B     : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL C_in  : STD_LOGIC;
SIGNAL S     : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL C_out : STD_LOGIC;

begin

    uut: Adder_3_Bit
        port map (
            A => A,
            B => B,
            C_in => C_in,
            S => S,
            C_out => C_out
        );

    process
    begin
        -- Test vector 1: 3 + 0
        A <= "011"; -- decimal 3
        B <= "000"; -- decimal 0
        C_in <= '0';
        wait for 100 ns;

        -- Test vector 2: 3 + 4
        A <= "011"; -- decimal 3
        B <= "100"; -- decimal 4
        C_in <= '0';
        wait for 100 ns;

        -- Test vector 3: 0 + 0
        A <= "000";
        B <= "000";
        C_in <= '0';
        wait for 100 ns;

        -- Test vector 4: 5 + 2
        A <= "101"; -- decimal 5
        B <= "010"; -- decimal 2
        C_in <= '0';
        wait for 100 ns;

        -- Test vector 5: 7 + 0
        A <= "111"; -- decimal 7
        B <= "000"; -- decimal 0
        C_in <= '0';
        wait for 100 ns;

        -- Test vector 6: 7 + 7
        A <= "111"; -- decimal 7
        B <= "111"; -- decimal 7
        C_in <= '0';
        wait for 100 ns;

        wait; -- wait forever to end simulation
    end process;



end Behavioral;
