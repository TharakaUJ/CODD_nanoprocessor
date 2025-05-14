----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2025 10:58:32 AM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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

entity Instruction_decoder is
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
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is

begin
    Load_Select <= I(11);
    Add_Sub_Select <= I(10);
    
    Enable_Reg <= I(9 downto 7);
    R_A_Select <= I(9 downto 7);
    R_B_Select <= I(6 downto 4);
    
    Imd_Val <= I(3 downto 0);
    
    Jmp_Flag <= NOT (Reg_jmp_Check(0) OR Reg_jmp_Check(1) OR Reg_jmp_Check(2) OR Reg_jmp_Check(3)) AND I(10) AND I(11);
    Jmp_Address <= I(2 downto 0);
    
    R_Bank_Enable <= NOT(I(10) AND I(11));
  

end Behavioral;
