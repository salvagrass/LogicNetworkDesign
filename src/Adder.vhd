library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Adder is
    Port ( 
        add_in1: in std_logic_vector(15 downto 0);
        add_in2: in std_logic_vector(10 downto 0);
        add_out: out std_logic_vector(15 downto 0)
    );
end Adder;

architecture Arch of Adder is
begin
    add_out <= std_logic_vector(unsigned(add_in1)+unsigned(add_in2));
end Arch;
