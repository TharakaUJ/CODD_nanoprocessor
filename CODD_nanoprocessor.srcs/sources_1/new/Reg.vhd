----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 08:45:56 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

ENTITY Reg IS
    PORT (
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reset : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        En : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END Reg;

ARCHITECTURE Behavioral OF Reg IS

    COMPONENT D_FF
        PORT (
            D : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            En : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL Clk_With_Enabled : STD_LOGIC := '0';
BEGIN

    Clk_With_Enabled <= Clk AND En;

    gen_ff : FOR i IN 0 TO 3 GENERATE
        FF_inst : D_FF
        PORT MAP(
            D => D(i),
            Res => Reset,
            En => En,
            Clk => Clk_With_Enabled,
            Q => Q(i)
        );
    END GENERATE;

END Behavioral;