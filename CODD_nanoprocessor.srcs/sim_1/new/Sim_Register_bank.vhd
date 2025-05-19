----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 11:06:06 PM
-- Design Name: 
-- Module Name: Sim_Register_bank - Behavioral
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

ENTITY Sim_Register_bank IS
    --  Port ( );
END Sim_Register_bank;

ARCHITECTURE Behavioral OF Sim_Register_bank IS
    COMPONENT Register_bank
        PORT (
            clk : IN STD_LOGIC;
            register_enable : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            register_bank_enable : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out2 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out3 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out4 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out5 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out6 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_out7 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL register_enable : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL data_in : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out6 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL data_out7 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL register_bank_enable : STD_LOGIC;
    SIGNAL reset : STD_LOGIC := '0';

BEGIN

    UUT : Register_bank
    PORT MAP(
        clk => clk,
        register_enable => register_enable,
        register_bank_enable => register_bank_enable,
        data_in => data_in,
        data_out0 => data_out0,
        data_out1 => data_out1,
        data_out2 => data_out2,
        data_out3 => data_out3,
        data_out4 => data_out4,
        data_out5 => data_out5,
        data_out6 => data_out6,
        data_out7 => data_out7,
        reset => reset
    );

    PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 50 ns;
        clk <= '1';
        WAIT FOR 50 ns;
    END PROCESS;

    PROCESS
        -- index: 230278M -> 111 000 001 110 000 110

    BEGIN

        register_bank_enable <= '1';
        register_enable <= "111"; -- reg 7
        data_in <= "0000"; -- val 0
        WAIT FOR 100 ns;

        register_enable <= "000"; -- reg 0
        data_in <= "0001"; -- val 1
        WAIT FOR 100 ns;

        register_enable <= "001"; -- reg 1
        data_in <= "0010"; -- val 2
        WAIT FOR 100 ns;

        register_enable <= "110"; -- reg 6
        data_in <= "0011"; -- val 3
        WAIT FOR 100 ns;

        register_enable <= "000"; -- reg 0
        data_in <= "0100"; -- val 4
        WAIT FOR 100 ns;

        register_bank_enable <= '0'; -- regiser bank disabled
        register_enable <= "110"; -- reg 6
        data_in <= "0101"; -- val 5

        register_bank_enable <= '1'; -- regiser bank enabled
        reset <= '1'; -- reset 
        WAIT FOR 100 ns;
        reset <= '0'; -- reset
        WAIT FOR 100 ns;
        register_enable <= "110"; -- reg 6
        data_in <= "0101"; -- val 5
        WAIT;
    END PROCESS;

END Behavioral;