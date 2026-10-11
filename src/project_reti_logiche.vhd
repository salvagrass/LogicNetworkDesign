library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity project_reti_logiche is
     port (
                i_clk : in std_logic;
                i_rst : in std_logic;
                i_start : in std_logic;
                i_add : in std_logic_vector(15 downto 0);
                i_k   : in std_logic_vector(9 downto 0);
                
                o_done : out std_logic;
                
                o_mem_addr : out std_logic_vector(15 downto 0);
                i_mem_data : in  std_logic_vector(7 downto 0);
                o_mem_data : out std_logic_vector(7 downto 0);
                o_mem_we   : out std_logic;
                o_mem_en   : out std_logic
        );
end project_reti_logiche;

architecture Arch of project_reti_logiche is
-- COMPONENTI    
    component reg8bit is
        Port ( 
            reg_clk,reg_rst,reg_enable,reg_restart: in std_logic;
            reg_input: in std_logic_vector(7 downto 0);
            reg_output: out std_logic_vector(7 downto 0)
        );
    end component reg8bit;
    
    component WordCounter is
        Port (
            word_rst,word_clk,word_enable,word_restart: in std_logic;
            word_output: out std_logic_vector(10 downto 0)
        );
    end component WordCounter;

    component CredibilityCounter is
        Port ( 
            cred_clk,cred_rst,cred_enable,cred_start_over,cred_restart: in std_logic;
            cred_output: out std_logic_vector(7 downto 0)
        );
    end component CredibilityCounter;
     
    component Encoder is
        Port ( 
               encoder_in: in std_logic_vector(2 downto 0);
               encoder_out: out std_logic_vector(6 downto 0)    
        );
    end component Encoder;
    
    component Toggle is
    Port ( 
        toggle_clk,toggle_rst,toggle_t: in std_logic;
        toggle_out: out std_logic
    );
    end component Toggle;
    
    component Adder is
    Port ( 
        add_in1: in std_logic_vector(15 downto 0);
        add_in2: in std_logic_vector(10 downto 0);
        add_out: out std_logic_vector(15 downto 0)
    );
    end component Adder;

-- SEGNALI
type S is (MR,W,MW,FIN,DONE);
signal curr: S;
signal FSM_out: std_logic_vector(2 downto 0);
signal encoder_output: std_logic_vector(6 downto 0);
signal stored: std_logic_vector(7 downto 0);
signal counter: std_logic_vector(10 downto 0);
signal credibility: std_logic_vector(7 downto 0);
signal sel: std_logic;


begin
    -- PORT MAPPING
    
    o_done <= encoder_output(6);
    o_mem_we <= encoder_output(5);
    o_mem_en <= encoder_output(4);
  
    reg: reg8bit port map(
        reg_rst => i_rst,
        reg_clk => i_clk,
        reg_enable => encoder_output(3),
        reg_restart => encoder_output(6),
        reg_input => i_mem_data,
        reg_output => stored
    );
    
    word_counter: WordCounter port map(
       word_rst => i_rst,
       word_clk => i_clk,
       word_enable => encoder_output(2),
       word_restart => encoder_output(6),
       word_output => counter
    );
    
    credibility_counter: CredibilityCounter port map(
        cred_rst => i_rst,
        cred_clk => i_clk,
        cred_enable => encoder_output(1),
        cred_start_over => encoder_output(0),
        cred_restart => encoder_output(6),
        cred_output => credibility    
    );
    
    switch: toggle port map(
        toggle_rst => i_rst,
        toggle_clk => i_clk,
        toggle_t => encoder_output(2),
        toggle_out => sel
    );
    
    add: adder port map(
        add_in1 => i_add,
        add_in2 => counter,
        add_out => o_mem_addr
    );
    
    encoding: Encoder port map(
        encoder_in => FSM_out,
        encoder_out => encoder_output
    );
    
    
    --- MEALY FSM
    
    synch: process(i_rst,i_clk)
    begin
        if(i_rst='1') then
            curr <= MR;
        elsif (rising_edge(i_clk)) then
            if(curr=MR and i_start='1' and counter(10 downto 1)=i_k) then
                curr <= DONE;
            elsif(curr = MR and i_start='1' and sel = '0') then
                curr <= W;
            elsif(curr = MR and i_start='1' and sel='1') then
                curr <= MW;
            elsif(curr=W and i_start='1' and i_mem_data = "00000000") then
                curr <= MW;
            elsif(curr=W and i_start='1') then
                curr <= FIN;
            elsif(curr=MW and i_start='1') then
                curr <= FIN;
            elsif(curr=FIN and i_start='1') then
                curr <= MR;
            elsif(curr=DONE and i_start = '0') then
                curr <= MR;
           end if;
        end if;
    end process synch;
    
    output_funct: process(i_rst,curr,i_mem_data,counter,sel,i_k)
    begin
        if(curr=MR and sel='0' and i_k /= counter(10 downto 1)) then
            FSM_out <= "000";
        elsif(curr=MR and (sel='1' or i_k = counter(10 downto 1))) then
            FSM_out <= "110";
        elsif(curr=W) then
            if(i_mem_data = "00000000") then
             FSM_out <= "001";
            else
             FSM_out <= "010";
            end if;
        elsif(curr=MW) then
            FSM_out <= "011";
        elsif(curr=FIN) then   
            FSM_out <= "100";
        else
            FSM_out <= "101";
        end if;
    end process output_funct;
    
    with sel select o_mem_data <=
        stored when '0',
        credibility when '1',
        "XXXXXXXX" when others;
end Arch;
