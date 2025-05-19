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
        clk_in : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        overflow : OUT STD_LOGIC;
        zero : OUT STD_LOGIC;
        Cathode_7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

        -- reg_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- reg_out7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- pc : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        -- printClock : OUT STD_LOGIC;
        -- printInstruction : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        -- printJumpFlag : OUT STD_LOGIC;
        -- printprogram_count_plus1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        -- printJmpAddress : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        -- printLoadSelect : OUT STD_LOGIC;
        -- printadd_sub_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- printadd_sub_input_A : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- printadd_sub_input_B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- printAdd_Sub_Select : OUT STD_LOGIC;
        -- printdata_in_reg_bank : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- printEnable_Reg : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        -- printR_A_Select : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        -- printR_B_Select : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END Nanoprocessor;

ARCHITECTURE Behavioral OF Nanoprocessor IS

    COMPONENT Slow_Clk IS
        PORT (
            Clk_in : IN STD_LOGIC;
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

    COMPONENT Register_bank IS
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

    COMPONENT MUX_8to1_4bit IS
        PORT (
            r0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r5 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r6 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            r7 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    COMPONENT Mux2to1_4bit IS
        PORT (
            sel : IN STD_LOGIC;
            a : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT LUT_16_7 IS
        PORT (
            address : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            data : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL program_count : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL program_counter_in : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL program_count_plus1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL pcoverflow : STD_LOGIC;

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

    SIGNAL data_in_reg_bank : STD_LOGIC_VECTOR (3 DOWNTO 0);

    SIGNAL data_out0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL data_out7 : STD_LOGIC_VECTOR(3 DOWNTO 0);

    SIGNAL add_sub_input_A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL add_sub_input_B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL add_sub_output : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

    slow_clock : Slow_Clk
    PORT MAP(
        Clk_in => clk_in,
        Clk_out => clk
    );

    program_rom_0 : Program_ROM
    PORT MAP(
        D => program_count,
        I => instruction
    );

    adder_3_bit_0 : Adder_3_Bit
    PORT MAP(
        A => program_count,
        B => "001",
        C_in => '0',
        S => program_count_plus1,
        C_out => pcoverflow
    );

    mux_2to1_3bit_0 : MUX_2to1_3bit
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

    instruction_decoder_0 : Instruction_decoder
    PORT MAP(
        I => instruction,
        Reg_jmp_Check => add_sub_input_A,
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

    reg_bank_in_mux : Mux2to1_4bit
    PORT MAP(
        a => add_sub_output,
        b => Imd_Val,
        sel => Load_Select,
        y => data_in_reg_bank
    );

    reg_bank : Register_bank
    PORT MAP(
        clk => clk,
        register_enable => Enable_Reg,
        register_bank_enable => R_Bank_Enable,
        reset => reset,
        data_in => data_in_reg_bank,
        data_out0 => data_out0,
        data_out1 => data_out1,
        data_out2 => data_out2,
        data_out3 => data_out3,
        data_out4 => data_out4,
        data_out5 => data_out5,
        data_out6 => data_out6,
        data_out7 => data_out7
    );

    input_mux_A : MUX_8to1_4bit
    PORT MAP(
        r0 => data_out0,
        r1 => data_out1,
        r2 => data_out2,
        r3 => data_out3,
        r4 => data_out4,
        r5 => data_out5,
        r6 => data_out6,
        r7 => data_out7,
        sel => R_A_Select,
        y => add_sub_input_A
    );

    input_mux_B : MUX_8to1_4bit
    PORT MAP(
        r0 => data_out0,
        r1 => data_out1,
        r2 => data_out2,
        r3 => data_out3,
        r4 => data_out4,
        r5 => data_out5,
        r6 => data_out6,
        r7 => data_out7,
        sel => R_B_Select,
        y => add_sub_input_B
    );

    add_sub_0 : Add_Sub
    PORT MAP(
        A => add_sub_input_B,
        B => add_sub_input_A,
        M => Add_Sub_Select,
        S => add_sub_output,
        C_out => overflow,
        Zero_Flag => zero
    );

    lut_16_7_0 : LUT_16_7
    PORT MAP(
        address => data_out7,
        data => Cathode_7Seg
    );
    -- Uncomment the following lines to enable output signals for debugging

    -- reg_out0 <= data_out0;
    -- reg_out1 <= data_out1;
    -- reg_out2 <= data_out2;
    -- reg_out3 <= data_out3;
    -- reg_out4 <= data_out4;
    -- reg_out5 <= data_out5;
    -- reg_out6 <= data_out6;
    -- reg_out7 <= data_out7;
    -- pc <= program_count;
    -- printClock <= clk;
    -- printInstruction <= instruction;
    -- printJumpFlag <= Jmp_Flag;
    -- printprogram_count_plus1 <= program_count_plus1;
    -- printJmpAddress <= Jmp_Address;
    -- printLoadSelect <= Load_Select;
    -- printadd_sub_output <= add_sub_output;
    -- printadd_sub_input_A <= add_sub_input_A;
    -- printadd_sub_input_B <= add_sub_input_B;
    -- printAdd_Sub_Select <= Add_Sub_Select;
    -- printdata_in_reg_bank <= data_in_reg_bank;
    -- printEnable_Reg <= Enable_Reg;
    -- printR_A_Select <= R_A_Select;
    -- printR_B_Select <= R_B_Select;
END Behavioral;