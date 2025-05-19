-- Ramtin Kosari - 40021441054102 - ex05
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Define Entity
entity reg32_async_reset_n is
    port(
        clk     : in  STD_LOGIC;
        reset_n : in  STD_LOGIC;
        d       : in  STD_LOGIC_VECTOR(31 downto 0);
        q       : out STD_LOGIC_VECTOR(31 downto 0)
    );
end entity;

-- Define Architecture
architecture rtl of reg32_async_reset_n is
begin
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            q <= (others => '0');
        elsif falling_edge(clk) then
            q <= d;
        end if;
    end process;
end architecture;
