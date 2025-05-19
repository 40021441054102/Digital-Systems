-- Ramtin Kosari - 40021441054102 - ex03
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb is
end tb;

architecture Behavioral of tb is
    -- Define Signals
    signal a, b, c : std_logic;
    signal y       : std_logic;
    
    -- Instantiate the Circuit
    component ex03
        Port (
            a : in  std_logic;
            b : in  std_logic;
            c : in  std_logic;
            y : out std_logic
        );
    end component;
    -- Method to Convert Vector to String
    function to_string(s : std_logic) return string is
    begin
        return std_ulogic'image(s);
    end function;
begin
    -- Connect signals to component
    uut: ex03
        port map (
            a => a,
            b => b,
            c => c,
            y => y
        );

    -- Test Process
    process
    begin
        -- Test Case 1
        a <= '0';
        b <= '0';
        c <= '0';
        wait for 10 ns;
        
        -- Test Case 2
        a <= '0';
        b <= '0';
        c <= '1';
        wait for 10 ns;
        
        -- Test Case 3
        a <= '0';
        b <= '1';
        c <= '0';
        wait for 10 ns;
        
        -- Test Case 4
        a <= '0';
        b <= '1';
        c <= '1';
        wait for 10 ns;
        -- Test Case 5
        a <= '1';
        b <= '0';
        c <= '0';
        wait for 10 ns;
        -- Test Case 6
        a <= '1';
        b <= '0';
        c <= '1';
        wait for 10 ns;
        -- Test Case 7
        a <= '1';
        b <= '1';
        c <= '0';
        wait for 10 ns;
        -- Test Case 8
        a <= '1';
        b <= '1';
        c <= '1';
        wait for 10 ns;
        -- Report Results
        report "Test Case 1: a = " & to_string(a) & 
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 2: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 3: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 4: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 5: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 6: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 7: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        report "Test Case 8: a = " & to_string(a) &
               " | b = " & to_string(b) & 
               " | c = " & to_string(c) & 
               " | y = " & to_string(y);
        wait;
    end process;
end Behavioral;