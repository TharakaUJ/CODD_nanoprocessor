----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 09:44:30 PM
-- Design Name: 
-- Module Name: Register_bank - Behavioral
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

ENTITY Register_bank IS
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
END Register_bank;

ARCHITECTURE Behavioral OF Register_bank IS

COMPONENT Reg
    PORT (
        clk : IN STD_LOGIC;
        register_enable : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END COMPONENT;

COMPONENT Decoder_3_8
    PORT (
        EN : IN STD_LOGIC;
        I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END COMPONENT;

SIGNAL decoder_output : STD_LOGIC_VECTOR (7 DOWNTO 0);


BEGIN

    Decoder_3_8_0 : Decoder_3_8
        PORT MAP (
            EN => '1',
            I => register_enable,
            Y => decoder_output
        );

    Register_0 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(0),
            data_in => data_in,
            data_out => data_out0
        );

    Register_1 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(1),
            data_in => data_in,
            data_out => data_out1
        );

    Register_2 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(2),
            data_in => data_in,
            data_out => data_out2
        );

    Register_3 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(3),
            data_in => data_in,
            data_out => data_out3
        );

    Register_4 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(4),
            data_in => data_in,
            data_out => data_out4
        );

    Register_5 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(5),
            data_in => data_in,
            data_out => data_out5
        );

    Register_6 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(6),
            data_in => data_in,
            data_out => data_out6
        );

    Register_7 : Reg
        PORT MAP (
            clk => clk,
            register_enable => decoder_output(7),
            data_in => data_in,
            data_out => data_out7
        );


    

END Behavioral;