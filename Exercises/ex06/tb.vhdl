-- Testbench for shiftreg4_async
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end entity;

architecture sim of tb is

    -- Component Declaration
    component shiftreg4_async
        port(
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            load    : in  STD_LOGIC;
            sin     : in  STD_LOGIC;
            d       : in  STD_LOGIC_VECTOR(3 downto 0);
            q       : out STD_LOGIC_VECTOR(3 downto 0);
            sout    : out STD_LOGIC
        );
    end component;

    -- Signals for testing
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal load    : STD_LOGIC := '0';
    signal sin     : STD_LOGIC := '0';
    signal d       : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal q       : STD_LOGIC_VECTOR(3 downto 0);
    signal sout    : STD_LOGIC;

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the DUT
    uut: shiftreg4_async
        port map (
            clk   => clk,
            reset => reset,
            load  => load,
            sin   => sin,
            d     => d,
            q     => q,
            sout  => sout
        );

    -- Clock generation
    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply asynchronous reset
        reset <= '1';
        wait for 7 ns;
        reset <= '0';
        wait for clk_period;

        -- Parallel load
        d <= "1010";
        load <= '1';
        wait for clk_period;
        load <= '0';

        -- Shift in serial bits
        sin <= '1';
        wait for clk_period;
        sin <= '0';
        wait for clk_period;
        sin <= '1';
        wait for clk_period;
        sin <= '1';
        wait for clk_period;

        -- Reset again in the middle
        reset <= '1';
        wait for 5 ns;
        reset <= '0';

        wait;
    end process;

end architecture;
