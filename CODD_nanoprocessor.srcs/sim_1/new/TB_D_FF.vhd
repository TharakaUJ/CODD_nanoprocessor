----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 09:35:33 PM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity TB_D_FF is
--  Port ( );
end TB_D_FF;

architecture Behavioral of TB_D_FF is
    -- Component under test (D_FF)
component D_FF
    Port (
        D   : in  STD_LOGIC;
        Res : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end component;

-- Signals to connect to D_FF
signal D_tb   : STD_LOGIC := '0';
signal Res_tb : STD_LOGIC := '0';
signal Clk_tb : STD_LOGIC := '0';
signal Q_tb   : STD_LOGIC;

begin

-- Instantiate the D_FF
uut: D_FF
    port map (
        D   => D_tb,
        Res => Res_tb,
        Clk => Clk_tb,
        Q   => Q_tb
    );

-- Clock generation: 10 ns period
clk_process : process
begin
    while now < 200 ns loop
        Clk_tb <= '0';
        wait for 5 ns;
        Clk_tb <= '1';
        wait for 5 ns;
    end loop;
    wait;
end process;

-- Stimulus process
stim_process : process
begin
    -- Initial state
    D_tb <= '0';
    Res_tb <= '1';  -- Apply reset
    wait for 10 ns;

    Res_tb <= '0';  -- Release reset
    D_tb <= '1';
    wait for 10 ns;

    D_tb <= '0';
    wait for 10 ns;

    D_tb <= '1';
    wait for 10 ns;

    Res_tb <= '1';  -- Assert reset again
    wait for 10 ns;

    Res_tb <= '0';  -- Release reset
    D_tb <= '1';
    wait for 20 ns;

    wait;
end process;

end Behavioral;
