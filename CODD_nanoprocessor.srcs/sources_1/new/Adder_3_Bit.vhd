----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 08:02:05
-- Design Name: 
-- Module Name: Adder_3_Bit - Behavioral
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


entity Adder_3_Bit is
    Port (
        A     : in  STD_LOGIC_VECTOR (2 downto 0);
        B     : in  STD_LOGIC_VECTOR (2 downto 0);
        C_in  : in  STD_LOGIC;
        S     : out STD_LOGIC_VECTOR (2 downto 0);
        C_out : out STD_LOGIC
    );
end Adder_3_Bit;

architecture Behavioral of Adder_3_Bit is

    component FA
        Port (
            A      : in  STD_LOGIC;
            B      : in  STD_LOGIC;
            C_in   : in  STD_LOGIC;
            S      : out STD_LOGIC;
            C_out  : out STD_LOGIC
        );
    end component;

    signal C0, C1 : STD_LOGIC;

begin

    -- First Full Adder
    FA0 : FA
        port map (
            A     => A(0),
            B     => B(0),
            C_in  => '0',
            S     => S(0),
            C_out => C0
        );

    -- Second Full Adder
    FA1 : FA
        port map (
            A     => A(1),
            B     => B(1),
            C_in  => C0,
            S     => S(1),
            C_out => C1
        );

    -- Third Full Adder
    FA2 : FA
        port map (
            A     => A(2),
            B     => B(2),
            C_in  => C1,
            S     => S(2),
            C_out => C_out
        );

end Behavioral;