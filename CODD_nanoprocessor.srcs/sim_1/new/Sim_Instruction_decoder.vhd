----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 08:49:48 PM
-- Design Name: 
-- Module Name: Sim_Instruction_decoder - Behavioral
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

entity Sim_Instruction_decoder is
--  Port ( );
end Sim_Instruction_decoder;

architecture Behavioral of Sim_Instruction_decoder is
    component Instruction_decoder
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_jmp_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Enable_Reg : out STD_LOGIC_VECTOR (2 downto 0);
           R_A_Select : out STD_LOGIC_VECTOR (2 downto 0);
           R_B_Select : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC;
           Add_Sub_Select : out STD_LOGIC;
           Jmp_Flag : out STD_LOGIC;
           Jmp_Address : out STD_LOGIC_VECTOR (2 downto 0);
           R_Bank_Enable : out STD_LOGIC;
           Imd_Val : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal I : STD_LOGIC_VECTOR(11 downto 0);
    signal Reg_jmp_Check, Imd_Val : STD_LOGIC_VECTOR(3 downto 0);
    signal Enable_Reg, R_A_Select, R_B_Select, Jmp_Address : STD_LOGIC_VECTOR(2 downto 0);
    signal Load_Select, Add_Sub_Select, Jmp_Flag, R_Bank_Enable: STD_LOGIC;

begin
    UUT : Instruction_decoder
    PORT MAP(
        I => I,
        Reg_jmp_Check => Reg_jmp_Check,
        Imd_Val => Imd_Val,
        Enable_Reg => Enable_Reg,
        R_A_Select => R_A_Select,
        R_B_Select => R_B_Select,
        jmp_Address => Jmp_Address,
        Load_Select => Load_Select,
        Add_Sub_Select => Add_Sub_Select,
        Jmp_Flag => Jmp_Flag,
        R_Bank_Enable => R_Bank_Enable
        );
    process
     
    begin 
        Reg_jmp_Check <= "0000";
        I <= "100100000001"; -- 1 -- MOVI R2, 1 -- 10 001 000 0001
        wait for 100ns;
        
        Reg_jmp_Check <= "0111";
        I <= "010100000000"; -- 2 -- NEG R2v -- 01 010 000 0000
        wait for 100ns;
            
        Reg_jmp_Check <= "0111";
        I <= "001110010000"; -- 3 -- ADD R7, R1 -- 00 111 001 0000
        wait for 100ns;
        
        Reg_jmp_Check <= "0000";
        I <= "110000000000"; -- 4 -- JZR R0, 3 -- 11 000 000 0000
        wait for 100ns;
              
    end process; 
    
    end Behavioral;