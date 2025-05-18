----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 02:17:17 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

ENTITY Nanoprocessor IS
    PORT (
        reset : IN STD_LOGIC;
        overflow : OUT STD_LOGIC;
        zero : OUT STD_LOGIC;
        clk : IN STD_LOGIC
    );
END Nanoprocessor;

ARCHITECTURE Behavioral OF Nanoprocessor IS

    COMPONENT Slow_Clk IS
        PORT (
            Clk_out : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT Program_ROM IS
        PORT (
            D : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            I : OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
    END COMPONENT;

    COMPONENT Instruction_decoder IS
        PORT (
            I : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
            Reg_jmp_Check : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Enable_Reg : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            R_A_Select : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            R_B_Select : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            Load_Select : OUT STD_LOGIC;
            Add_Sub_Select : OUT STD_LOGIC;
            Jmp_Flag : OUT STD_LOGIC;
            Jmp_Address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            R_Bank_Enable : OUT STD_LOGIC;
            Imd_Val : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    COMPONENT Add_Sub IS
        PORT (
            A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            M : IN STD_LOGIC; -- Mode: 0 = Add, 1 = Sub
            S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            C_out : OUT STD_LOGIC;
            Zero_Flag : OUT STD_LOGIC
        );

    END COMPONENT;

    COMPONENT Adder_3_Bit IS
        PORT (
            A : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            C_out : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT Counter IS
        PORT (
            D : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Res : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    COMPONENT MUX_2to1_3bit IS
        PORT (
            a : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            b : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            sel : IN STD_LOGIC;
            y : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    COMPONENT 

    SIGNAL clk, : STD_LOGIC;
    SIGNAL program_count, program_counter_in, program_count_plus1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL jump_flag : STD_LOGIC;

    SIGNAL instruction : STD_LOGIC_VECTOR (11 DOWNTO 0);
    SIGNAL Enable_Reg : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL R_A_Select : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL R_B_Select : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL Load_Select : STD_LOGIC;
    SIGNAL Add_Sub_Select : STD_LOGIC;
    SIGNAL Jmp_Flag : STD_LOGIC;
    SIGNAL Jmp_Address : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL R_Bank_Enable : STD_LOGIC;
    SIGNAL Imd_Val : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL Jmp_Address : STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

    slow_clock : Slow_Clk
    PORT MAP(
        clk_out => clk,
    );

    program_rom : Program_ROM
    PORT MAP(
        D => program_count,
        I => instruction
    );

    adder_3_bit : Adder_3_Bit
    PORT MAP(
        A => program_count,
        B => '1',
        C_in => '0',
        S => program_count_plus1,
        C_out => overflow
    );

    mux_2to1_3bit : MUX_2to1_3bit
    PORT MAP(
        a => program_count_plus1,
        b => Jmp_Address,
        sel => Jmp_Flag,
        y => program_counter_in
    );

    program_counter : Counter
    PORT MAP(
        D => program_counter_in,
        Res => reset,
        Clk => clk,
        Q => program_count
    );

    instruction_decoder : Instruction_decoder
    PORT MAP(
        I => instruction,
        Reg_jmp_Check = >, -- connect this to output of 1 first mux from reg bank
        Enable_Reg => Enable_Reg,
        R_A_Select => R_A_Select,
        R_B_Select => R_B_Select,
        Load_Select => Load_Select,
        Add_Sub_Select => Add_Sub_Select,
        Jmp_Flag => Jmp_Flag,
        Jmp_Address => Jmp_Address,
        R_Bank_Enable => R_Bank_Enable,
        Imd_Val => Imd_Val
    );

    add_sub : Add_Sub
    PORT MAP(
        A => ,
        B => ,
        M => ,
        S => ,
        C_out => overflow,
        Zero_Flag => zero
    );

END Behavioral;