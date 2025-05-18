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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sim_Register_bank is
--  Port ( );
end Sim_Register_bank;

architecture Behavioral of Sim_Register_bank is
    component Register_bank
        PORT (
            clk : IN STD_LOGIC;
            register_enable : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
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
    end component;

    signal clk : STD_LOGIC;
    signal register_enable : STD_LOGIC_VECTOR (2 DOWNTO 0);
    signal data_in : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out6 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal data_out7 : STD_LOGIC_VECTOR (3 DOWNTO 0);



begin

    UUT : Register_bank
    port map(
        clk => clk,
        register_enable => register_enable,
        data_in => data_in,
        data_out0 => data_out0,
        data_out1 => data_out1,
        data_out2 => data_out2,
        data_out3 => data_out3,
        data_out4 => data_out4,
        data_out5 => data_out5,
        data_out6 => data_out6,
        data_out7 => data_out7
    );

    process
    begin
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process;

    process
    -- index: 230278M -> 111 000 001 110 000 110

    begin
        register_enable <= "111"; -- reg 7
        data_in <= "0000";        -- val 0
        wait for 100 ns;

        register_enable <= "000"; -- reg 0
        data_in <= "0001";        -- val 1
        wait for 100 ns;

        register_enable <= "001"; -- reg 1
        data_in <= "0010";        -- val 2
        wait for 100 ns;

        register_enable <= "110"; -- reg 6
        data_in <= "0011";        -- val 3
        wait for 100 ns;

        register_enable <= "000"; -- reg 0
        data_in <= "0100";        -- val 4
        wait for 100 ns;

        register_enable <= "110"; -- reg 6
        data_in <= "0101";        -- val 5
        wait;
    end process;



end Behavioral;
