-- Ramtin Kosari - 40021441054102 - ex04
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb is
end tb;

architecture Behavioral of tb is
    signal s            : std_logic;
    signal d0, d1, y    : std_logic_vector(15 downto 0);
    -- Instantiate the Circuit
    component mux2_1_16bit is
        port (
            s  : in  std_logic;
            d0 : in  std_logic_vector(15 downto 0);
            d1 : in  std_logic_vector(15 downto 0);
            y  : out std_logic_vector(15 downto 0)
        );
    end component;
    -- Method to Convert Vector to String
    function to_string(slv: std_logic_vector) return string is
        variable result : string(1 to slv'length);
    begin
        for i in slv'range loop
            result(i - slv'low + 1) := std_logic'image(slv(i))(2);
        end loop;
        return result;
    end function;
begin
    uut: mux2_1_16bit
        port map (
            s  => s,
            d0 => d0,
            d1 => d1,
            y  => y
        );
    process
    begin
        -- Test Case 1
        s <= '0'; d0 <= x"0000"; d1 <= x"FFFF"; wait for 10 ns;
        report "TC1: y = " & to_string(y);
        -- Test Case 2
        s <= '1'; wait for 10 ns;
        report "TC2: y = " & to_string(y);
        -- Test Case 3
        s <= '0'; d0 <= x"AAAA"; d1 <= x"5555"; wait for 10 ns;
        report "TC3: y = " & to_string(y);
        -- Test Case 4
        s <= '1'; wait for 10 ns;
        report "TC4: y = " & to_string(y);
        wait;
    end process;
end Behavioral;
