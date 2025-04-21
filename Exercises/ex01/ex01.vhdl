-- Ramtin Kosari - 40021441054102 - ex01
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define Entity
entity ex01 is
    Port (
        a  : in  STD_LOGIC_VECTOR(15 downto 0);
        y1 : out STD_LOGIC;
        y2 : out STD_LOGIC;
        y3 : out STD_LOGIC;
        y4 : out STD_LOGIC
    );
end ex01;

-- Define Architecture
architecture Behavioral of ex01 is
begin
    y1 <= a(14) and a(15);
    y2 <= a(5) or a(6) or a(7);
    y3 <= a(0) xor a(1);
    y4 <= not a(10);
end Behavioral;
