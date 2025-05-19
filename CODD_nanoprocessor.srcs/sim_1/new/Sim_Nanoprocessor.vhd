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
            reg_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            reg_out7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            pc : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            printClock : OUT STD_LOGIC;
            printInstruction : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            printJumpFlag : OUT STD_LOGIC;
            printprogram_count_plus1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            printJmpAddress : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            printLoadSelect : OUT STD_LOGIC;
            printadd_sub_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            printadd_sub_input_A : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            printadd_sub_input_B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            printAdd_Sub_Select : OUT STD_LOGIC;
            printdata_in_reg_bank : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            printEnable_Reg : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            printR_A_Select : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            printR_B_Select : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk_in : STD_LOGIC;
    SIGNAL reset : STD_LOGIC;
    SIGNAL overflow : STD_LOGIC;
    SIGNAL zero : STD_LOGIC;
    SIGNAL data_out0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL pc : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL printClock : STD_LOGIC;
    SIGNAL printInstruction : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL printJumpFlag : STD_LOGIC;
    SIGNAL printprogram_count_plus1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL printJmpAddress : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL printLoadSelect : STD_LOGIC;
    SIGNAL printadd_sub_output : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL printadd_sub_input_A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL printadd_sub_input_B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL printAdd_Sub_Select : STD_LOGIC;
    SIGNAL printdata_in_reg_bank : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL printEnable_Reg : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL printR_A_Select : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL printR_B_Select : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    UUT : Nanoprocessor
    PORT MAP(
        clk_in => clk_in,
        reset => reset,
        overflow => overflow,
        zero => zero,
        reg_out0 => data_out0,
        reg_out1 => data_out1,
        reg_out2 => data_out2,
        reg_out3 => data_out3,
        reg_out4 => data_out4,
        reg_out5 => data_out5,
        reg_out6 => data_out6,
        reg_out7 => data_out7,
        pc => pc,
        printClock => printClock,
        printInstruction => printInstruction,
        printJumpFlag => printJumpFlag,
        printprogram_count_plus1 => printprogram_count_plus1,
        printJmpAddress => printJmpAddress,
        printLoadSelect => printLoadSelect,
        printadd_sub_output => printadd_sub_output,
        printadd_sub_input_A => printadd_sub_input_A,
        printadd_sub_input_B => printadd_sub_input_B,
        printAdd_Sub_Select => printAdd_Sub_Select,
        printdata_in_reg_bank => printdata_in_reg_bank,
        printEnable_Reg => printEnable_Reg,
        printR_A_Select => printR_A_Select,
        printR_B_Select => printR_B_Select
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