-- Ramtin Kosari - 40021441054102 - shiftreg4_async
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftreg4_async is
    port(
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        load    : in  STD_LOGIC;
        sin     : in  STD_LOGIC;
        d       : in  STD_LOGIC_VECTOR(3 downto 0);
        q       : out STD_LOGIC_VECTOR(3 downto 0);
        sout    : out STD_LOGIC
    );
end entity;

architecture synth of shiftreg4_async is
    signal q_reg : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                q_reg <= d;
            else
                q_reg <= q_reg(2 downto 0) & sin;
            end if;
        end if;
    end process;

    q <= q_reg;
    sout <= q_reg(3);
end architecture;
