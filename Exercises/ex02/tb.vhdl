-- Ramtin Kosari - 40021441054102 - ex02
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb is
end tb;

architecture Behavioral of tb is
    -- Define Signals
    signal sel   : std_logic_vector(2 downto 0);
    signal din0  : std_logic_vector(15 downto 0);
    signal din1  : std_logic_vector(15 downto 0);
    signal din2  : std_logic_vector(15 downto 0);
    signal din3  : std_logic_vector(15 downto 0);
    signal din4  : std_logic_vector(15 downto 0);
    signal din5  : std_logic_vector(15 downto 0);
    signal din6  : std_logic_vector(15 downto 0);
    signal din7  : std_logic_vector(15 downto 0);
    signal dout  : std_logic_vector(15 downto 0);
    -- Instantiate the MUX
    component ex02
        Port (
            sel   : in  std_logic_vector(2 downto 0);
            din0  : in  std_logic_vector(15 downto 0);
            din1  : in  std_logic_vector(15 downto 0);
            din2  : in  std_logic_vector(15 downto 0);
            din3  : in  std_logic_vector(15 downto 0);
            din4  : in  std_logic_vector(15 downto 0);
            din5  : in  std_logic_vector(15 downto 0);
            din6  : in  std_logic_vector(15 downto 0);
            din7  : in  std_logic_vector(15 downto 0);
            dout  : out std_logic_vector(15 downto 0)
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

-- Testbench
begin
    -- Connect signals to component
    uut: ex02
        port map (
            sel   => sel,
            din0  => din0,
            din1  => din1,
            din2  => din2,
            din3  => din3,
            din4  => din4,
            din5  => din5,
            din6  => din6,
            din7  => din7,
            dout  => dout
        );
    process
    begin
        -- Initialize data inputs
        din0 <= x"AAAA"; -- 1010101010101010
        din1 <= x"FFFF";
        din2 <= x"5678";
        din3 <= x"9ABC";
        din4 <= x"DEF0";
        din5 <= x"1357";
        din6 <= x"FFFF";
        din7 <= x"FFFF";
        -- Test 1: Select input 0
        sel <= "000";
        wait for 10 ns;
        report "Test 1: sel = " & to_string(sel) & 
               " | dout = " & to_string(dout);
        -- Test 2: Select input 3
        sel <= "011";
        wait for 10 ns;
        report "Test 2: sel = " & to_string(sel) & 
               " | dout = " & to_string(dout);
        -- Test 3: Select input 7
        sel <= "111";
        wait for 10 ns;
        report "Test 3: sel = " & to_string(sel) & 
               " | dout = " & to_string(dout);
        -- Test 4: Select input 5
        sel <= "101";
        wait for 10 ns;
        report "Test 4: sel = " & to_string(sel) & 
               " | dout = " & to_string(dout);
        wait;
    end process;
end Behavioral;
