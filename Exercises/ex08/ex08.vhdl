-- Ramtin Kosari - 40021441054102 - Traffic Light
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafficlight is
    port (
        clk, reset  : in STD_LOGIC;
        ta, tb      : in STD_LOGIC;
        timer       : in STD_LOGIC_VECTOR (1 downto 0);
        reset_timer : out STD_LOGIC;
        la, lb : out STD_LOGIC_VECTOR(1 downto 0)
    );
end trafficlight;

architecture sym of trafficlight is
    type statetype is (s0, s1, s2, s3);
    signal state, nextstate : statetype;
begin
    -- State Transition Process
    process (clk, reset)
    begin
        if reset = '1' then
            state <= s0;
            reset_timer <= '1';
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
    end process;
    -- Next State Logic Process
    process (all)
    begin
        reset_timer <= '0';
        case state is
            when s0 =>
                if ta = '1' and timer = "00" then
                    nextstate <= s1;
                else
                    nextstate <= s0;
                end if;
            when s1 =>
                nextstate <= s2;
                reset_timer <= '1';
            when s2 =>
                if tb = '1' and timer = "00" then
                    nextstate <= s3;
                else
                    nextstate <= s2;
                end if;
            when s3 =>
                nextstate <= s0;
                reset_timer <= '1';

            when others =>
                nextstate <= s0;
        end case;
    end process;
    -- Output Logic Process
    la <= "01" when state = s0 else
          "10" when state = s1 else
          "01" when state = s2 else
          "01";

    lb <= "01" when state = s0 else
          "01" when state = s1 else
          "10" when state = s2 else
          "01";
end sym;
