LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Slow_Clk IS
  PORT (
    Clk_in  : IN  STD_LOGIC;
    Clk_out : OUT STD_LOGIC
  );
END Slow_Clk;

ARCHITECTURE Behavioral OF Slow_Clk IS
  SIGNAL count      : UNSIGNED(2 DOWNTO 0) := (OTHERS => '0');
  SIGNAL clk_status : STD_LOGIC := '0';
BEGIN
  PROCESS (Clk_in)
  BEGIN
    IF rising_edge(Clk_in) THEN
      IF count = "100" THEN  -- 4 in binary, so 0..4 = 5 cycles
        count      <= (OTHERS => '0');
        clk_status <= NOT clk_status;
      ELSE
        count <= count + 1;
      END IF;
    END IF;
  END PROCESS;
  Clk_out <= clk_status;
END Behavioral;
