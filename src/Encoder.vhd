library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Encoder is
    Port ( 
           encoder_in: in std_logic_vector(2 downto 0);
           encoder_out: out std_logic_vector(6 downto 0)    
    );
end Encoder;

architecture Arch of Encoder is

begin
    with encoder_in select encoder_out <=
        "001000-" when "000", -- MR/SI 
        "0-01010" when "001", -- WAIT ZERO
        "0-01011" when "010", -- WAIT NUMBER
        "011000-" when "011", -- MW
        "0-0010-" when "100", -- END
        "1-0000-" when "101", -- DONE
        "0-0000-" when "110", -- MR/SI
        "XXXXXXX" when others;
end Arch;
