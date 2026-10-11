import random
from bisect import bisect_left

def binary_search(sequence,number):
  i = bisect_left(sequence,number)
  if(i<len(sequence) and sequence[i]==number):
    return 1
  else:
    return 0

def generate_sequence(n):
  random.seed(n)
  x = random.randint(1,1023)
  length = 2*x #CHANGE LENGTH HERE
  sequence = []
  for i in range(length):
    if(i%2==0):
      if(random.random()<0.65): #CHANGE PROBABILITY OF ZERO HERE
        sequence.append(0)
      else:
        sequence.append(random.randint(1,255))
    else:
      sequence.append(0)
  return sequence

def generate_solution(sequence):
  counter = 0
  backup = 0
  solution = []
  for i in range(len(sequence)):
    if(i%2==0):
      if(sequence[i]==0 and counter>0):
        counter -= 1
      elif(sequence[i]!=0):
        counter = 31
        backup = sequence[i]
      solution.append(backup)
    else:
      solution.append(counter)
  return solution

def toString(sequence):
  scenario = "("
  scenario = scenario + ", ".join("{:3d}".format(num) for num in sequence)
  scenario = scenario + ")"
  return scenario

def gen_tb(tb_name,number):
  seq_zero = []
  body = ""
  body += "library ieee;\nuse ieee.std_logic_1164.all;\nuse ieee.numeric_std.all;\nuse std.textio.all;\n\n"
  body += ("entity " + tb_name + " is\n" + "end " + tb_name + ";\n\n")
  body += ("architecture " + tb_name +"_arch "+ " of " + tb_name + " is\n")
  body += ("\tconstant CLOCK_PERIOD : time := 20 ns;\n\tsignal tb_clk : std_logic := '0';\n\tsignal tb_rst, tb_start, tb_done : std_logic;\n\tsignal tb_add : std_logic_vector(15 downto 0);\n\tsignal tb_k : std_logic_vector(9 downto 0);\n\n")
  body += ("\tsignal tb_o_mem_addr, exc_o_mem_addr, init_o_mem_addr : std_logic_vector(15 downto 0);\n\tsignal tb_o_mem_data, exc_o_mem_data, init_o_mem_data : std_logic_vector(7 downto 0);\n\tsignal tb_i_mem_data : std_logic_vector(7 downto 0);\n\tsignal tb_o_mem_we, tb_o_mem_en, exc_o_mem_we, exc_o_mem_en, init_o_mem_we, init_o_mem_en : std_logic;\n\n")
  body += ("\ttype ram_type is array (65535 downto 0) of std_logic_vector(7 downto 0);\n\tsignal RAM : ram_type := (OTHERS => \"00000000\");\n")
  
  # SCRITTURA SCENARI
  for i in range(1,number+1):
    sequence = generate_sequence(None)
    solution = generate_solution(sequence)
    if(len(sequence)==0):
      body += ("\n\t--SCENARIO NUMERO: "+str(i)+" VUOTO - MEMORIA NON CARICATA\n")
      seq_zero.append(i)
    else:
      body +=  ("\n\tconstant SCENARIO"+str(i)+"_LENGTH : integer := " + str(int(len(sequence)/2)) + ";\n")
      body += ("\ttype scenario"+str(i)+"_type is array(0 to " + str(len(sequence)-1) + ") of integer;\n")
      body += ("\tsignal scenario"+str(i)+"_input : scenario"+str(i)+"_type := " + toString(sequence) + ";\n")
      body += ("\tsignal scenario"+str(i)+"_full : scenario"+str(i)+"_type  := " + toString(solution) + ";\n")
      body += ("\tconstant SCENARIO"+ str(i)+"_ADDRESS: integer := " + str(random.randint(1000,10000))+ ";\n")
    
  #CONFIGURAZIONE DELLA MEMORIA E MEMORY SWAP
  body += ("\n\tsignal memory_control: std_logic := '0';\n\tshared variable mem_modified: integer := 0;\n")
  body += ("\tcomponent project_reti_logiche is\n\t\tport (\n\t\t\ti_clk : in std_logic;\n\t\t\ti_rst : in std_logic;\n\t\t\ti_start : in std_logic;\n\t\t\ti_add : in std_logic_vector(15 downto 0);\n\t\t\ti_k   : in std_logic_vector(9 downto 0);\n\n\t\t\to_done : out std_logic;\n\n\t\t\to_mem_addr : out std_logic_vector(15 downto 0);\n\t\t\ti_mem_data : in  std_logic_vector(7 downto 0);\n\t\t\to_mem_data : out std_logic_vector(7 downto 0);\n\t\t\to_mem_we   : out std_logic;\n\t\t\to_mem_en   : out std_logic\n\t\t);\n\tend component project_reti_logiche;")   
  body += ("\nbegin\n\tUUT : project_reti_logiche\n\tport map(\n\t\t\t\ti_clk   => tb_clk,\n\t\t\t\ti_rst   => tb_rst,\n\t\t\t\ti_start => tb_start,\n\t\t\t\ti_add   => tb_add,\n\t\t\t\ti_k     => tb_k,\n\t\t\t\t\n\t\t\t\to_done => tb_done,\n\t\t\t\t\n\t\t\t\to_mem_addr => exc_o_mem_addr,\n\t\t\t\ti_mem_data => tb_i_mem_data,\n\t\t\t\to_mem_data => exc_o_mem_data,\n\t\t\t\to_mem_we   => exc_o_mem_we,\n\t\t\t\to_mem_en   => exc_o_mem_en\n\t);\n\n\ttb_clk <= not tb_clk after CLOCK_PERIOD/2;")
  body += ("""\n\n    MEM : process (tb_clk)\n    begin\n        if tb_clk'event and tb_clk = '1' then\n            if tb_o_mem_en = '1' then\n                if tb_o_mem_we = '1' then\n\t                mem_modified := 1;\n                    RAM(to_integer(unsigned(tb_o_mem_addr))) <= tb_o_mem_data after 1 ns;\n                    tb_i_mem_data <= tb_o_mem_data after 1 ns;\n                else\n                    tb_i_mem_data <= RAM(to_integer(unsigned(tb_o_mem_addr))) after 1 ns;\n                end if;\n            end if;\n        end if;\n    end process;\n""") 
  body += ("""\n    memory_signal_swapper : process(memory_control, init_o_mem_addr, init_o_mem_data,\n                                    init_o_mem_en,  init_o_mem_we,   exc_o_mem_addr,\n                                    exc_o_mem_data, exc_o_mem_en, exc_o_mem_we)\n    begin\n        tb_o_mem_addr <= init_o_mem_addr;\n        tb_o_mem_data <= init_o_mem_data;\n        tb_o_mem_en   <= init_o_mem_en;\n        tb_o_mem_we   <= init_o_mem_we;\n\n        if memory_control = '1' then\n            tb_o_mem_addr <= exc_o_mem_addr;\n            tb_o_mem_data <= exc_o_mem_data;\n            tb_o_mem_en   <= exc_o_mem_en;\n            tb_o_mem_we   <= exc_o_mem_we;\n        end if;\n    end process;\n""")
  
  #CONFIGURAZIONE SCENARI
  body += ("""\n    create_scenario : process\n    begin\n        wait for 50 ns;\n\n        tb_start <= '0';\n        tb_add <= (others=>'0');\n        tb_k   <= (others=>'0');\n        tb_rst <= '1';\n        \n        wait for 50 ns;\n        \n        tb_rst <= '0';\n\n""")
  for i in range(1,number+1):      
    body += ("--CONFIGURAZIONE MEMORIA PER SCENARIO: " + str(i) + "\n") 
    
    if(binary_search(seq_zero,i)==0):
      body += ("\t\tmemory_control <= '0';\n")
      body += ("\t\twait until falling_edge(tb_clk);\n")
      body += ("""        for i in 0 to SCENARIO"""+str(i)+"""_LENGTH*2-1 loop\n            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO"""+str(i)+"""_ADDRESS+i, 16));\n            init_o_mem_data<= std_logic_vector(to_unsigned(scenario"""+str(i)+"""_input(i),8));\n            init_o_mem_en  <= '1';\n            init_o_mem_we  <= '1';\n            wait until rising_edge(tb_clk);   \n        end loop;\n""")
      body += ("""        wait until falling_edge(tb_clk);\n        memory_control <= '1';\n        tb_add <= std_logic_vector(to_unsigned(SCENARIO"""+str(i)+"""_ADDRESS, 16));\n        tb_k   <= std_logic_vector(to_unsigned(SCENARIO"""+str(i)+"""_LENGTH, 10));\n        tb_start <= '1';\n        while tb_done /= '1' loop                \n            wait until rising_edge(tb_clk);\n        end loop;\n        wait for 5 ns;\n        tb_start <= '0';\n\n\n""")
    else:
      body += ("""        mem_modified := 0;   \n        wait until rising_edge(tb_clk);\n        wait until rising_edge(tb_clk);\n        memory_control <= '1';\n        tb_add <= (others => '0');\n        tb_k <= (others => '0');\n        tb_start <= '1';\n        wait for 5ns;\n        while tb_done /= '1' loop\n            wait until rising_edge(tb_clk);\n        end loop;\n        wait for 5ns;\n        tb_start <= '0';\n\n\n""")
  body += ("\t\t wait;\n\t end process;\n")
  
  #ASSERT E VERIFICA
  body += ("""\n    test_routine : process\n    begin\n\n        wait until tb_rst = '1';\n        wait for 25 ns;\n        assert tb_done = '0' report "TEST FALLITO o_done !=0 during reset" severity failure;\n        wait until tb_rst = '0';\n\n        wait until falling_edge(tb_clk);\n        assert tb_done = '0' report "TEST FALLITO o_done !=0 after reset before start" severity failure;\n""")
  for i in range(1,number+1):
    if(binary_search(seq_zero,i)==0):
      body += ("""\n-- SCENARIO NUMERO: """+str(i)+""" \n        wait until rising_edge(tb_start);\n        \n        while tb_done /= '1' loop                \n            wait until rising_edge(tb_clk);\n        end loop;\n\n        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;\n\n        for i in 0 to SCENARIO"""+str(i)+"""_LENGTH*2-1 loop\n            assert RAM(SCENARIO"""+str(i)+"""_ADDRESS+i) = std_logic_vector(to_unsigned(scenario"""+str(i)+"""_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario"""+str(i)+"""_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO"""+str(i)+"""_ADDRESS + i)))) severity failure;\n        end loop;\n\n        wait until falling_edge(tb_start);\n        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;\n        wait until falling_edge(tb_done);\n""")
    else:
      body += ("""\n-- SCENARIO NUMERO: """+str(i)+""" \n         wait until rising_edge(tb_start);\n        \n        while tb_done /= '1' loop                \n            wait until rising_edge(tb_clk);\n            assert mem_modified=0 report "TEST FALLITO - MEM SCRITTA QUANDO LUNGHEZZA ZERO" severity failure;\n        end loop;\n        \n        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;\n        \n        wait until falling_edge(tb_start);\n        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;\n        wait until falling_edge(tb_done);\n""")
  body += ("""\n\t\tassert false report "Simulation Ended! TEST PASSATO (EXAMPLE)" severity failure;\n    end process;\nend """+tb_name+"""_arch;\n""")
  with open(tb_name+".vhd","w") as f:
    f.write(body)

# gen_tb("FileName",NumberOfSequences)
gen_tb("Test100",100)