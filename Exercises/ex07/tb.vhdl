-- Ramtin Kosari - 40021441054102 - Seven Segment Display
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb is
end tb;

architecture behavior of tb is
    component seven_segment_decoder is
        port(
            data     : in  STD_LOGIC_VECTOR(4 downto 0);
            segments : out STD_LOGIC_VECTOR(13 downto 0)
        );
    end component;
    signal data     : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal segments : STD_LOGIC_VECTOR(13 downto 0);
begin
    uut: seven_segment_decoder
        port map (
            data     => data,
            segments => segments
        );
    stim_proc: process
    begin
        -- Loop Through All Values from 0 to 20
        for i in 0 to 20 loop
            data <= std_logic_vector(to_unsigned(i, data'length));
            wait for 10 ns;
        end loop;
        -- Test Others
        data <= "10101";
        wait for 10 ns;
        wait;
    end process;
end behavior;
