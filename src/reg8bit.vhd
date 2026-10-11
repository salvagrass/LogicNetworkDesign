library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg8bit is
    Port ( 
        reg_clk,reg_rst,reg_enable,reg_restart: in std_logic;
        reg_input: in std_logic_vector(7 downto 0);
        reg_output: out std_logic_vector(7 downto 0)
    );
end reg8bit;

architecture arch of reg8bit is
    signal stored: std_logic_vector(7 downto 0);
begin
    synch: process(reg_clk,reg_rst,reg_input)
    begin
        if(reg_rst='1') then
            stored <= "00000000";
        elsif rising_edge(reg_clk) then
            if(reg_restart='1') then
                stored <= "00000000";
            elsif(reg_enable='1' and reg_input/="00000000") then
                stored <= reg_input;
            end if;
        end if;
    end process synch;

    reg_output <= stored;
end arch;