library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CredibilityCounter is
    Port ( 
        cred_clk,cred_rst,cred_enable,cred_start_over,cred_restart: in std_logic;
        cred_output: out std_logic_vector(7 downto 0)
    );
end CredibilityCounter;

architecture Arch of CredibilityCounter is
signal num: std_logic_vector(7 downto 0);
begin
    synch: process(cred_rst,cred_clk)
    begin
        if(cred_rst='1') then
            num <= "00000000";
        elsif rising_edge(cred_clk) then
            if(cred_restart='1') then
                num <= "00000000";
            elsif(cred_start_over='1' and cred_enable='1') then
                num <= "00011111";
            elsif(num/="00000000" and cred_enable='1') then
                num <= std_logic_vector(unsigned(num)-to_unsigned(1,8));
            end if;
        end if;
   end process synch;
    
    cred_output <= num;
end Arch;