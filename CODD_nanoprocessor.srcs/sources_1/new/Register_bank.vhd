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
END Register_bank;

ARCHITECTURE Behavioral OF Register_bank IS

    COMPONENT Reg
        PORT (
            D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reset : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            En : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));

    END COMPONENT;

    COMPONENT Decoder_3_to_8
        PORT (
            EN : IN STD_LOGIC;
            I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL decoder_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN

    Decoder_3_8_0 : Decoder_3_to_8
    PORT MAP(
        EN => register_bank_enable,
        I => register_enable,
        Y => decoder_output
    );

    data_out0 <= "0000";

    Register_1 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(1),
        D => data_in,
        Q => data_out1,
        Reset => reset
    );

    Register_2 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(2),
        D => data_in,
        Q => data_out2,
        Reset => reset
    );

    Register_3 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(3),
        D => data_in,
        Q => data_out3,
        Reset => reset
    );

    Register_4 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(4),
        D => data_in,
        Q => data_out4,
        Reset => reset
    );

    Register_5 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(5),
        D => data_in,
        Q => data_out5,
        Reset => reset
    );

    Register_6 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(6),
        D => data_in,
        Q => data_out6,
        Reset => reset
    );

    Register_7 : Reg
    PORT MAP(
        Clk => clk,
        En => decoder_output(7),
        D => data_in,
        Q => data_out7,
        Reset => reset
    );
END Behavioral;