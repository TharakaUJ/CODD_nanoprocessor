----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 10:51:32
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_Sub is
    Port (
        A        : in  STD_LOGIC_VECTOR (3 downto 0);
        B        : in  STD_LOGIC_VECTOR (3 downto 0);
        M        : in  STD_LOGIC; -- Mode: 0 = Add, 1 = Sub
        S        : out STD_LOGIC_VECTOR (3 downto 0);
        C_out    : out STD_LOGIC;
        Zero_Flag: out STD_LOGIC
    );
end Add_Sub;

architecture Behavioral of Add_Sub is

    -- Full Adder component declaration
    component FA
        Port (
            A      : in  STD_LOGIC;
            B      : in  STD_LOGIC;
            C_in   : in  STD_LOGIC;
            S      : out STD_LOGIC;
            C_out  : out STD_LOGIC
        );
    end component;

    signal FA_C : STD_LOGIC_VECTOR(3 downto 0); -- Carry chain
    signal S_Sig: STD_LOGIC_VECTOR(3 downto 0); -- Sum output
    signal B_new: STD_LOGIC_VECTOR(3 downto 0); -- Inverted B if M=1

begin

process(A, B, M)
begin
    if M = '0' then
        B_new <= B;         -- Just use B for addition
    else
        B_new <= not B;     -- Invert B for subtraction
    end if;
end process;


    -- Instantiate Full Adders
    FA0: FA port map (A => A(0), B => B_new(0), C_in => M,     S => S_Sig(0), C_out => FA_C(0));
    FA1: FA port map (A => A(1), B => B_new(1), C_in => FA_C(0), S => S_Sig(1), C_out => FA_C(1));
    FA2: FA port map (A => A(2), B => B_new(2), C_in => FA_C(1), S => S_Sig(2), C_out => FA_C(2));
    FA3: FA port map (A => A(3), B => B_new(3), C_in => FA_C(2), S => S_Sig(3), C_out => C_out);

    -- Output sum
    S <= S_Sig;

    -- Zero flag (1 when result is 0000)
    Zero_Flag <= NOT(S_Sig(0) OR S_Sig(1) OR S_Sig(2) OR S_Sig(3));

end Behavioral;