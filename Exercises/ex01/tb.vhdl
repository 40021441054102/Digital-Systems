-- Ramtin Kosari - 40021441054102 - ex01
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end tb;

-- Define Methods
architecture Behavioral of tb is
    signal a : STD_LOGIC_VECTOR(15 downto 0);
    signal y1, y2, y3, y4 : STD_LOGIC;
    -- Use Component
    component ex01
        Port (
            a  : in  STD_LOGIC_VECTOR(15 downto 0);
            y1 : out STD_LOGIC;
            y2 : out STD_LOGIC;
            y3 : out STD_LOGIC;
            y4 : out STD_LOGIC
        );
    end component;
    -- Method to Convert Vector to String
    function to_string(slv : STD_LOGIC_VECTOR) return string is
        variable result : string(1 to slv'length);
    begin
        for i in slv'range loop
            result(i - slv'low + 1) := std_ulogic'image(slv(i))(2);
        end loop;
        return result;
    end function;
    -- Convert Bit to String
    function to_string(bit : STD_LOGIC) return string is
    begin
        return std_ulogic'image(bit);
    end function;

-- Testbench
begin
    uut: ex01 port map(a => a, y1 => y1, y2 => y2, y3 => y3, y4 => y4);
    process
    begin
        -- Test 1
        a <= (others => '0');
        wait for 10 ns;
        report "Test 1: a = " & to_string(a)    &
               " | y1 = " & to_string(y1)       &
               " | y2 = " & to_string(y2)       &
               " | y3 = " & to_string(y3)       &
               " | y4 = " & to_string(y4);
        -- Test 2
        a <= (others => '0');
        a(0) <= '1'; a(1) <= '0';
        a(5) <= '1'; a(6) <= '0'; a(7) <= '0';
        a(10) <= '1';
        a(14) <= '1'; a(15) <= '1';
        wait for 10 ns;
        report "Test 2: a = " & to_string(a)    &
               " | y1 = " & to_string(y1)       &
               " | y2 = " & to_string(y2)       &
               " | y3 = " & to_string(y3)       &
               " | y4 = " & to_string(y4);

        -- Test 3
        a <= (others => '0');
        wait for 10 ns;
        report "Test 3: a = " & to_string(a)    &
               " | y1 = " & to_string(y1)       &
               " | y2 = " & to_string(y2)       &
               " | y3 = " & to_string(y3)       &
               " | y4 = " & to_string(y4);

        wait;
    end process;
end Behavioral;
