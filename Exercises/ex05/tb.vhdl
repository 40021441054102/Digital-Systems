-- Ramtin Kosari - 40021441054102 - ex05
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end tb;

architecture sim of tb is
    -- Component Declaration
    component reg32_async_reset_n
        port(
            clk     : in  STD_LOGIC;
            reset_n : in  STD_LOGIC;
            d       : in  STD_LOGIC_VECTOR(31 downto 0);
            q       : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    -- Signals
    signal clk     : STD_LOGIC := '1';
    signal reset_n : STD_LOGIC := '1';
    signal d       : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal q       : STD_LOGIC_VECTOR(31 downto 0);
begin
    uut: reg32_async_reset_n
        port map (
            clk     => clk,
            reset_n => reset_n,
            d       => d,
            q       => q
        );
    -- Clock Process
    clk_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;
    -- Stimulus Process
    stim_proc: process
    begin
        -- Apply Reset
        reset_n <= '0';
        wait for 12 ns;
        reset_n <= '1';
        -- Write Data After Reset
        wait for 10 ns;
        d <= x"00000001";
        wait for 10 ns;
        d <= x"0000000A";
        wait for 10 ns;
        d <= x"FFFFFFFF";
        -- Apply Reset Again
        wait for 10 ns;
        reset_n <= '0';
        wait for 10 ns;
        reset_n <= '1';
        -- Write Another Value
        wait for 10 ns;
        d <= x"12345678";
        -- Finish Simulation
        wait for 50 ns;
        assert false report "Simulation Finished" severity note;
        wait;
    end process;
end architecture;
