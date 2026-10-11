library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Toggle is
    Port ( 
        toggle_clk,toggle_rst,toggle_t: in std_logic;
        toggle_out: out std_logic
    );
end Toggle;

architecture Arch of Toggle is
signal switch: std_logic;
begin
    toggle_out <= switch;
    synch: process(toggle_clk,toggle_rst)
    begin
        if(toggle_rst='1') then
            switch <= '0';
        elsif rising_edge(toggle_clk) then
            if(toggle_t = '1') then
                switch <= not switch;
            end if;
       end if;
    end process synch;
end Arch;
