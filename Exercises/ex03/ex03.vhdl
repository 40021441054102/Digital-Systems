-- Ramtin Kosari - 40021441054102 - ex02
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Define Entity
entity ex03 is
    port (
        -- Inputs
        a, b, c     : in STD_LOGIC;
        -- Output
        y           : out STD_LOGIC
    );
end ex03;

-- Define Architecture
architecture Behavioral of ex03 is
    signal ab, bb, cb, n1, n2, n3: STD_LOGIC;
begin
    ab <= not a after 5 ns;
    bb <= not b after 5 ns;
    cb <= not c after 5 ns;
    n1 <= ab and bb and cb after 10 ns;
    n2 <= a and bb and cb after 10 ns;
    n3 <= a and bb and c after 10 ns;
    y  <= n1 or n2 or n3 after 20 ns;
end Behavioral;
