-- Ramtin Kosari - 40021441054102 - ex04
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1_8bit is
    port (
        s  : in  std_logic;
        d0 : in  std_logic_vector(7 downto 0);
        d1 : in  std_logic_vector(7 downto 0);
        y  : out std_logic_vector(7 downto 0)
    );
end mux2_1_8bit;

architecture Behavioral of mux2_1_8bit is
begin
    process(s, d0, d1)
    begin
        if s = '0' then
            y <= d0;
        else
            y <= d1;
        end if;
    end process;
end Behavioral;
