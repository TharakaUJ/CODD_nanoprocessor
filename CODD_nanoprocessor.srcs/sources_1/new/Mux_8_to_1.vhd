----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 02:27:47 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));    
    end component;
    signal EN : STD_LOGIC:='1';
    signal Y_Dec : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_3_to_8_0:Decoder_3_to_8
    port map(
        I=>Sel,
        EN=>EN,
        Y=>Y_Dec
    );
    
    Y<= EN and ( (D(0) and Y_Dec(0))
              or (D(1) and Y_Dec(1))
              or (D(2) and Y_Dec(2))
              or (D(3) and Y_Dec(3))
              or (D(4) and Y_Dec(4))
              or (D(5) and Y_Dec(5))
              or (D(6) and Y_Dec(6))
              or (D(7) and Y_Dec(7)) );
              
end Behavioral;

