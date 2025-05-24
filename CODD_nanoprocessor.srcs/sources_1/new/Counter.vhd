LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Counter IS
    PORT (
        D   : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
        Res : IN  STD_LOGIC;
        Clk : IN  STD_LOGIC;
        Q   : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
    );
END Counter;

ARCHITECTURE Behavioral OF Counter IS
    SIGNAL Q_reg : STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN

    PROCESS (Clk, Res)
    BEGIN
        IF Res = '1' THEN
            Q_reg <= (OTHERS => '0');
        ELSIF rising_edge(Clk) THEN
            Q_reg <= D;
        END IF;
    END PROCESS;

    Q <= Q_reg;

END Behavioral;
