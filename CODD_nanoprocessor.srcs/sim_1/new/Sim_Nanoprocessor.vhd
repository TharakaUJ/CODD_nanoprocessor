----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 04:15:02 PM
-- Design Name: 
-- Module Name: Sim_Nanoprocessor - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Sim_Nanoprocessor IS
    --  Port ( );
END Sim_Nanoprocessor;

ARCHITECTURE Behavioral OF Sim_Nanoprocessor IS
    COMPONENT Nanoprocessor
        PORT (
            clk_in : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            overflow : OUT STD_LOGIC;
            zero : OUT STD_LOGIC;
            Cathode_7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk_in : STD_LOGIC;
    SIGNAL reset : STD_LOGIC;
    SIGNAL overflow : STD_LOGIC;
    SIGNAL zero : STD_LOGIC;
    SIGNAL Cathode_7Seg : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN

    UUT : Nanoprocessor
    PORT MAP(
        clk_in => clk_in,
        reset => reset,
        overflow => overflow,
        zero => zero,
        Cathode_7Seg => Cathode_7Seg
    );

    PROCESS
    BEGIN
        clk_in <= '1';
        WAIT FOR 5ns;
        clk_in <= '0';
        WAIT FOR 5ns;

    END PROCESS;

    PROCESS
    BEGIN
        Reset <= '1';
        WAIT FOR 200ns;

        Reset <= '0';
        WAIT;
    END PROCESS;

END Behavioral;