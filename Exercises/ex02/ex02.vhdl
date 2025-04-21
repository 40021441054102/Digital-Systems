-- Ramtin Kosari - 40021441054102 - ex02
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Define Entity
entity ex02 is
    Port (
        -- Select
        sel   : in  std_logic_vector(2 downto 0);
        -- Data
        din0  : in  std_logic_vector(15 downto 0);
        din1  : in  std_logic_vector(15 downto 0);
        din2  : in  std_logic_vector(15 downto 0);
        din3  : in  std_logic_vector(15 downto 0);
        din4  : in  std_logic_vector(15 downto 0);
        din5  : in  std_logic_vector(15 downto 0);
        din6  : in  std_logic_vector(15 downto 0);
        din7  : in  std_logic_vector(15 downto 0);
        -- Output
        dout  : out std_logic_vector(15 downto 0)
    );
end ex02;

-- Define Architecture
architecture Behavioral of ex02 is
begin
    process(sel, din0, din1, din2, din3, din4, din5, din6, din7)
    begin
        case sel is
            when "000" => dout <= din0;
            when "001" => dout <= din1;
            when "010" => dout <= din2;
            when "011" => dout <= din3;
            when "100" => dout <= din4;
            when "101" => dout <= din5;
            when "110" => dout <= din6;
            when "111" => dout <= din7;
            when others => dout <= (others => '0');
        end case;
    end process;
end Behavioral;







