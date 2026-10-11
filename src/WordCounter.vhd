library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity WordCounter is
    Port (
        word_rst,word_clk,word_enable,word_restart: in std_logic;
        word_output: out std_logic_vector(10 downto 0)
    );
end WordCounter;

architecture Arch of WordCounter is
signal num: std_logic_vector(10 downto 0);
begin
    synch: process(word_rst,word_clk)
    begin
        if(word_rst='1') then
            num <= (others => '0');
        elsif rising_edge(word_clk) then
            if(word_enable='1') then
                num <= std_logic_vector(unsigned(num)+to_unsigned(1,11));
            elsif(word_restart='1') then
                num <= (others => '0');
            end if;
        end if;
    end process synch;
    word_output <= num;
end Arch;