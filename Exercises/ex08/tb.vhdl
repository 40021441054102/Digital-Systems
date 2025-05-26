-- Ramtin Kosari - 40021441054102 - Traffic Light
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_trafficlight is
end tb_trafficlight;

architecture behavior of tb_trafficlight is
    component trafficlight
        port (
            clk         : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            ta          : in  STD_LOGIC;
            tb          : in  STD_LOGIC;
            timer       : in  STD_LOGIC_VECTOR(1 downto 0);
            reset_timer : out STD_LOGIC;
            la          : out STD_LOGIC_VECTOR(1 downto 0);
            lb          : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    signal clk         : STD_LOGIC := '0';
    signal reset       : STD_LOGIC := '0';
    signal ta          : STD_LOGIC := '0';
    signal tb          : STD_LOGIC := '0';
    signal timer       : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal reset_timer : STD_LOGIC;
    signal la          : STD_LOGIC_VECTOR(1 downto 0);
    signal lb          : STD_LOGIC_VECTOR(1 downto 0);
    constant clk_period : time := 10 ns;
begin
    uut: trafficlight
        port map (
            clk => clk,
            reset => reset,
            ta => ta,
            tb => tb,
            timer => timer,
            reset_timer => reset_timer,
            la => la,
            lb => lb
        );
    -- Clock Generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;
    -- Simulation Process
    stim_proc: process
    begin
        -- Initial Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        -- Test State s0 : ta = 0, tb = 0, timer = "00"
        ta <= '0'; tb <= '0'; timer <= "00";
        wait for 20 ns;
        -- Set ta = 1 to move from s0 to s1 when timer = "00"
        ta <= '1';
        wait for 20 ns;
        -- At s1, the next state is s2 with reset_timer = '1', timer doesn't matter
        ta <= '0'; tb <= '0';
        wait for 20 ns;
        -- In s2, tb must be 1 and timer = "00" to move to s3
        tb <= '1'; timer <= "00";
        wait for 20 ns;
        -- In s3, the next state is s0 with reset_timer = '1'
        tb <= '0'; timer <= "00";
        wait for 20 ns;
        -- Test no transition in s0 if timer /= "00" even if ta = 1
        ta <= '1'; timer <= "01";
        wait for 20 ns;
        -- Test transition again with timer = "00"
        timer <= "00";
        wait for 20 ns;
        wait;
    end process;
end behavior;
