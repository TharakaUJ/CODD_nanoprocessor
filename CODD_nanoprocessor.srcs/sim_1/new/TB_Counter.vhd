----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 04:46:45 PM
-- Design Name: 
-- Module Name: TB_Counter - Behavioral
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

entity TB_Counter is
--  Port ( );
end TB_Counter;

architecture Behavioral of TB_Counter is

component Counter 
Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
 END COMPONENT;
          
              -- Testbench signals
              SIGNAL D   : std_logic_vector(2 downto 0) := (others => '0');
              SIGNAL Res : std_logic := '0';
              SIGNAL Clk : std_logic := '0';
              SIGNAL Q   : std_logic_vector(2 downto 0);
          
BEGIN
 -- Instantiate the Unit Under Test (UUT)
uut: Counter PORT MAP (
                  D   => D,
                  Res => Res,
                  Clk => Clk,
                  Q   => Q
              );
          
              -- Clock generation: 10 ns period
clk_process :process
    begin
    while true loop
         Clk <= '0';
         wait for 5 ns;
         Clk <= '1';
         wait for 5 ns;
    end loop;
end process;
                    --230514K(INDEX)
                    --230146H
          
              -- Stimulus process
stim_proc: process
    begin
                  -- Reset the circuit
        Res <= '1';
        wait for 10 ns;
        Res <= '0';
          
                  -- Apply first input
        D <= "101"; --5
        wait for 10 ns;
          
                  -- Apply second input
        D <= "001"; --1
        wait for 10 ns;
          
                  -- Apply third input
        D <= "100"; --4
        wait for 10 ns;
          
                  -- Apply reset again
        Res <= '1';
        wait for 10 ns;
        Res <= '0';
          
                  -- Final input
        D <= "110"; --6
        wait for 10 ns;
          
    wait;
end process;
          
end Behavioral;
