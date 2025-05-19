-- Ramtin Kosari - 40021441054102 - ex04
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1_16bit is
    port (
        s  : in  std_logic;
        d0 : in  std_logic_vector(15 downto 0);
        d1 : in  std_logic_vector(15 downto 0);
        y  : out std_logic_vector(15 downto 0)
    );
end mux2_1_16bit;

architecture struct of mux2_1_16bit is
    component mux2_1_8bit is
        port (
            s  : in  std_logic;
            d0 : in  std_logic_vector(7 downto 0);
            d1 : in  std_logic_vector(7 downto 0);
            y  : out std_logic_vector(7 downto 0)
        );
    end component;

    -- No signals needed; we directly connect slices
begin
    -- Lower 8 bits
    lsb_mux: mux2_1_8bit
        port map (
            s  => s,
            d0 => d0(7 downto 0),
            d1 => d1(7 downto 0),
            y  => y(7 downto 0)
        );

    -- Upper 8 bits
    msb_mux: mux2_1_8bit
        port map (
            s  => s,
            d0 => d0(15 downto 8),
            d1 => d1(15 downto 8),
            y  => y(15 downto 8)
        );
end struct;