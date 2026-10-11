library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity TestLength1 is
end TestLength1;

architecture TestLength1_arch  of TestLength1 is
	constant CLOCK_PERIOD : time := 20 ns;
	signal tb_clk : std_logic := '0';
	signal tb_rst, tb_start, tb_done : std_logic;
	signal tb_add : std_logic_vector(15 downto 0);
	signal tb_k : std_logic_vector(9 downto 0);

	signal tb_o_mem_addr, exc_o_mem_addr, init_o_mem_addr : std_logic_vector(15 downto 0);
	signal tb_o_mem_data, exc_o_mem_data, init_o_mem_data : std_logic_vector(7 downto 0);
	signal tb_i_mem_data : std_logic_vector(7 downto 0);
	signal tb_o_mem_we, tb_o_mem_en, exc_o_mem_we, exc_o_mem_en, init_o_mem_we, init_o_mem_en : std_logic;

	type ram_type is array (65535 downto 0) of std_logic_vector(7 downto 0);
	signal RAM : ram_type := (OTHERS => "00000000");

	constant SCENARIO1_LENGTH : integer := 1;
	type scenario1_type is array(0 to 1) of integer;
	signal scenario1_input : scenario1_type := (  0,   0);
	signal scenario1_full : scenario1_type  := (  0,   0);
	constant SCENARIO1_ADDRESS: integer := 5113;

	constant SCENARIO2_LENGTH : integer := 1;
	type scenario2_type is array(0 to 1) of integer;
	signal scenario2_input : scenario2_type := ( 89,   0);
	signal scenario2_full : scenario2_type  := ( 89,  31);
	constant SCENARIO2_ADDRESS: integer := 2945;

	constant SCENARIO3_LENGTH : integer := 1;
	type scenario3_type is array(0 to 1) of integer;
	signal scenario3_input : scenario3_type := ( 67,   0);
	signal scenario3_full : scenario3_type  := ( 67,  31);
	constant SCENARIO3_ADDRESS: integer := 8047;

	constant SCENARIO4_LENGTH : integer := 1;
	type scenario4_type is array(0 to 1) of integer;
	signal scenario4_input : scenario4_type := (  0,   0);
	signal scenario4_full : scenario4_type  := (  0,   0);
	constant SCENARIO4_ADDRESS: integer := 4688;

	constant SCENARIO5_LENGTH : integer := 1;
	type scenario5_type is array(0 to 1) of integer;
	signal scenario5_input : scenario5_type := (  0,   0);
	signal scenario5_full : scenario5_type  := (  0,   0);
	constant SCENARIO5_ADDRESS: integer := 4408;

	constant SCENARIO6_LENGTH : integer := 1;
	type scenario6_type is array(0 to 1) of integer;
	signal scenario6_input : scenario6_type := (  0,   0);
	signal scenario6_full : scenario6_type  := (  0,   0);
	constant SCENARIO6_ADDRESS: integer := 6009;

	constant SCENARIO7_LENGTH : integer := 1;
	type scenario7_type is array(0 to 1) of integer;
	signal scenario7_input : scenario7_type := (143,   0);
	signal scenario7_full : scenario7_type  := (143,  31);
	constant SCENARIO7_ADDRESS: integer := 6004;

	constant SCENARIO8_LENGTH : integer := 1;
	type scenario8_type is array(0 to 1) of integer;
	signal scenario8_input : scenario8_type := (176,   0);
	signal scenario8_full : scenario8_type  := (176,  31);
	constant SCENARIO8_ADDRESS: integer := 7886;

	constant SCENARIO9_LENGTH : integer := 1;
	type scenario9_type is array(0 to 1) of integer;
	signal scenario9_input : scenario9_type := (  0,   0);
	signal scenario9_full : scenario9_type  := (  0,   0);
	constant SCENARIO9_ADDRESS: integer := 8389;

	constant SCENARIO10_LENGTH : integer := 1;
	type scenario10_type is array(0 to 1) of integer;
	signal scenario10_input : scenario10_type := (  0,   0);
	signal scenario10_full : scenario10_type  := (  0,   0);
	constant SCENARIO10_ADDRESS: integer := 8628;

	constant SCENARIO11_LENGTH : integer := 1;
	type scenario11_type is array(0 to 1) of integer;
	signal scenario11_input : scenario11_type := (  0,   0);
	signal scenario11_full : scenario11_type  := (  0,   0);
	constant SCENARIO11_ADDRESS: integer := 7032;

	constant SCENARIO12_LENGTH : integer := 1;
	type scenario12_type is array(0 to 1) of integer;
	signal scenario12_input : scenario12_type := (213,   0);
	signal scenario12_full : scenario12_type  := (213,  31);
	constant SCENARIO12_ADDRESS: integer := 8044;

	constant SCENARIO13_LENGTH : integer := 1;
	type scenario13_type is array(0 to 1) of integer;
	signal scenario13_input : scenario13_type := (  0,   0);
	signal scenario13_full : scenario13_type  := (  0,   0);
	constant SCENARIO13_ADDRESS: integer := 6370;

	constant SCENARIO14_LENGTH : integer := 1;
	type scenario14_type is array(0 to 1) of integer;
	signal scenario14_input : scenario14_type := ( 39,   0);
	signal scenario14_full : scenario14_type  := ( 39,  31);
	constant SCENARIO14_ADDRESS: integer := 2003;

	constant SCENARIO15_LENGTH : integer := 1;
	type scenario15_type is array(0 to 1) of integer;
	signal scenario15_input : scenario15_type := (  0,   0);
	signal scenario15_full : scenario15_type  := (  0,   0);
	constant SCENARIO15_ADDRESS: integer := 3265;

	constant SCENARIO16_LENGTH : integer := 1;
	type scenario16_type is array(0 to 1) of integer;
	signal scenario16_input : scenario16_type := (  0,   0);
	signal scenario16_full : scenario16_type  := (  0,   0);
	constant SCENARIO16_ADDRESS: integer := 9811;

	constant SCENARIO17_LENGTH : integer := 1;
	type scenario17_type is array(0 to 1) of integer;
	signal scenario17_input : scenario17_type := (  0,   0);
	signal scenario17_full : scenario17_type  := (  0,   0);
	constant SCENARIO17_ADDRESS: integer := 8627;

	constant SCENARIO18_LENGTH : integer := 1;
	type scenario18_type is array(0 to 1) of integer;
	signal scenario18_input : scenario18_type := (  0,   0);
	signal scenario18_full : scenario18_type  := (  0,   0);
	constant SCENARIO18_ADDRESS: integer := 1409;

	constant SCENARIO19_LENGTH : integer := 1;
	type scenario19_type is array(0 to 1) of integer;
	signal scenario19_input : scenario19_type := (  0,   0);
	signal scenario19_full : scenario19_type  := (  0,   0);
	constant SCENARIO19_ADDRESS: integer := 6867;

	constant SCENARIO20_LENGTH : integer := 1;
	type scenario20_type is array(0 to 1) of integer;
	signal scenario20_input : scenario20_type := (  0,   0);
	signal scenario20_full : scenario20_type  := (  0,   0);
	constant SCENARIO20_ADDRESS: integer := 8619;

	constant SCENARIO21_LENGTH : integer := 1;
	type scenario21_type is array(0 to 1) of integer;
	signal scenario21_input : scenario21_type := (115,   0);
	signal scenario21_full : scenario21_type  := (115,  31);
	constant SCENARIO21_ADDRESS: integer := 2798;

	constant SCENARIO22_LENGTH : integer := 1;
	type scenario22_type is array(0 to 1) of integer;
	signal scenario22_input : scenario22_type := (  0,   0);
	signal scenario22_full : scenario22_type  := (  0,   0);
	constant SCENARIO22_ADDRESS: integer := 1699;

	constant SCENARIO23_LENGTH : integer := 1;
	type scenario23_type is array(0 to 1) of integer;
	signal scenario23_input : scenario23_type := (  0,   0);
	signal scenario23_full : scenario23_type  := (  0,   0);
	constant SCENARIO23_ADDRESS: integer := 9872;

	constant SCENARIO24_LENGTH : integer := 1;
	type scenario24_type is array(0 to 1) of integer;
	signal scenario24_input : scenario24_type := (231,   0);
	signal scenario24_full : scenario24_type  := (231,  31);
	constant SCENARIO24_ADDRESS: integer := 6006;

	constant SCENARIO25_LENGTH : integer := 1;
	type scenario25_type is array(0 to 1) of integer;
	signal scenario25_input : scenario25_type := (  0,   0);
	signal scenario25_full : scenario25_type  := (  0,   0);
	constant SCENARIO25_ADDRESS: integer := 9391;

	constant SCENARIO26_LENGTH : integer := 1;
	type scenario26_type is array(0 to 1) of integer;
	signal scenario26_input : scenario26_type := (  0,   0);
	signal scenario26_full : scenario26_type  := (  0,   0);
	constant SCENARIO26_ADDRESS: integer := 4255;

	constant SCENARIO27_LENGTH : integer := 1;
	type scenario27_type is array(0 to 1) of integer;
	signal scenario27_input : scenario27_type := (  0,   0);
	signal scenario27_full : scenario27_type  := (  0,   0);
	constant SCENARIO27_ADDRESS: integer := 9924;

	constant SCENARIO28_LENGTH : integer := 1;
	type scenario28_type is array(0 to 1) of integer;
	signal scenario28_input : scenario28_type := (132,   0);
	signal scenario28_full : scenario28_type  := (132,  31);
	constant SCENARIO28_ADDRESS: integer := 8563;

	constant SCENARIO29_LENGTH : integer := 1;
	type scenario29_type is array(0 to 1) of integer;
	signal scenario29_input : scenario29_type := ( 64,   0);
	signal scenario29_full : scenario29_type  := ( 64,  31);
	constant SCENARIO29_ADDRESS: integer := 8052;

	constant SCENARIO30_LENGTH : integer := 1;
	type scenario30_type is array(0 to 1) of integer;
	signal scenario30_input : scenario30_type := (  0,   0);
	signal scenario30_full : scenario30_type  := (  0,   0);
	constant SCENARIO30_ADDRESS: integer := 2417;

	constant SCENARIO31_LENGTH : integer := 1;
	type scenario31_type is array(0 to 1) of integer;
	signal scenario31_input : scenario31_type := ( 42,   0);
	signal scenario31_full : scenario31_type  := ( 42,  31);
	constant SCENARIO31_ADDRESS: integer := 6127;

	constant SCENARIO32_LENGTH : integer := 1;
	type scenario32_type is array(0 to 1) of integer;
	signal scenario32_input : scenario32_type := ( 50,   0);
	signal scenario32_full : scenario32_type  := ( 50,  31);
	constant SCENARIO32_ADDRESS: integer := 9553;

	constant SCENARIO33_LENGTH : integer := 1;
	type scenario33_type is array(0 to 1) of integer;
	signal scenario33_input : scenario33_type := (  0,   0);
	signal scenario33_full : scenario33_type  := (  0,   0);
	constant SCENARIO33_ADDRESS: integer := 8723;

	constant SCENARIO34_LENGTH : integer := 1;
	type scenario34_type is array(0 to 1) of integer;
	signal scenario34_input : scenario34_type := (238,   0);
	signal scenario34_full : scenario34_type  := (238,  31);
	constant SCENARIO34_ADDRESS: integer := 2783;

	constant SCENARIO35_LENGTH : integer := 1;
	type scenario35_type is array(0 to 1) of integer;
	signal scenario35_input : scenario35_type := ( 36,   0);
	signal scenario35_full : scenario35_type  := ( 36,  31);
	constant SCENARIO35_ADDRESS: integer := 7979;

	constant SCENARIO36_LENGTH : integer := 1;
	type scenario36_type is array(0 to 1) of integer;
	signal scenario36_input : scenario36_type := (  0,   0);
	signal scenario36_full : scenario36_type  := (  0,   0);
	constant SCENARIO36_ADDRESS: integer := 1520;

	constant SCENARIO37_LENGTH : integer := 1;
	type scenario37_type is array(0 to 1) of integer;
	signal scenario37_input : scenario37_type := (  0,   0);
	signal scenario37_full : scenario37_type  := (  0,   0);
	constant SCENARIO37_ADDRESS: integer := 2216;

	constant SCENARIO38_LENGTH : integer := 1;
	type scenario38_type is array(0 to 1) of integer;
	signal scenario38_input : scenario38_type := (182,   0);
	signal scenario38_full : scenario38_type  := (182,  31);
	constant SCENARIO38_ADDRESS: integer := 8915;

	constant SCENARIO39_LENGTH : integer := 1;
	type scenario39_type is array(0 to 1) of integer;
	signal scenario39_input : scenario39_type := (  0,   0);
	signal scenario39_full : scenario39_type  := (  0,   0);
	constant SCENARIO39_ADDRESS: integer := 5727;

	constant SCENARIO40_LENGTH : integer := 1;
	type scenario40_type is array(0 to 1) of integer;
	signal scenario40_input : scenario40_type := (  0,   0);
	signal scenario40_full : scenario40_type  := (  0,   0);
	constant SCENARIO40_ADDRESS: integer := 5415;

	constant SCENARIO41_LENGTH : integer := 1;
	type scenario41_type is array(0 to 1) of integer;
	signal scenario41_input : scenario41_type := (  0,   0);
	signal scenario41_full : scenario41_type  := (  0,   0);
	constant SCENARIO41_ADDRESS: integer := 9036;

	constant SCENARIO42_LENGTH : integer := 1;
	type scenario42_type is array(0 to 1) of integer;
	signal scenario42_input : scenario42_type := (  0,   0);
	signal scenario42_full : scenario42_type  := (  0,   0);
	constant SCENARIO42_ADDRESS: integer := 4526;

	constant SCENARIO43_LENGTH : integer := 1;
	type scenario43_type is array(0 to 1) of integer;
	signal scenario43_input : scenario43_type := (  0,   0);
	signal scenario43_full : scenario43_type  := (  0,   0);
	constant SCENARIO43_ADDRESS: integer := 6165;

	constant SCENARIO44_LENGTH : integer := 1;
	type scenario44_type is array(0 to 1) of integer;
	signal scenario44_input : scenario44_type := (  0,   0);
	signal scenario44_full : scenario44_type  := (  0,   0);
	constant SCENARIO44_ADDRESS: integer := 2739;

	constant SCENARIO45_LENGTH : integer := 1;
	type scenario45_type is array(0 to 1) of integer;
	signal scenario45_input : scenario45_type := ( 59,   0);
	signal scenario45_full : scenario45_type  := ( 59,  31);
	constant SCENARIO45_ADDRESS: integer := 4164;

	constant SCENARIO46_LENGTH : integer := 1;
	type scenario46_type is array(0 to 1) of integer;
	signal scenario46_input : scenario46_type := (  0,   0);
	signal scenario46_full : scenario46_type  := (  0,   0);
	constant SCENARIO46_ADDRESS: integer := 3171;

	constant SCENARIO47_LENGTH : integer := 1;
	type scenario47_type is array(0 to 1) of integer;
	signal scenario47_input : scenario47_type := (102,   0);
	signal scenario47_full : scenario47_type  := (102,  31);
	constant SCENARIO47_ADDRESS: integer := 2868;

	constant SCENARIO48_LENGTH : integer := 1;
	type scenario48_type is array(0 to 1) of integer;
	signal scenario48_input : scenario48_type := (  0,   0);
	signal scenario48_full : scenario48_type  := (  0,   0);
	constant SCENARIO48_ADDRESS: integer := 2944;

	constant SCENARIO49_LENGTH : integer := 1;
	type scenario49_type is array(0 to 1) of integer;
	signal scenario49_input : scenario49_type := (  0,   0);
	signal scenario49_full : scenario49_type  := (  0,   0);
	constant SCENARIO49_ADDRESS: integer := 9115;

	constant SCENARIO50_LENGTH : integer := 1;
	type scenario50_type is array(0 to 1) of integer;
	signal scenario50_input : scenario50_type := (  0,   0);
	signal scenario50_full : scenario50_type  := (  0,   0);
	constant SCENARIO50_ADDRESS: integer := 4507;

	constant SCENARIO51_LENGTH : integer := 1;
	type scenario51_type is array(0 to 1) of integer;
	signal scenario51_input : scenario51_type := ( 92,   0);
	signal scenario51_full : scenario51_type  := ( 92,  31);
	constant SCENARIO51_ADDRESS: integer := 6267;

	constant SCENARIO52_LENGTH : integer := 1;
	type scenario52_type is array(0 to 1) of integer;
	signal scenario52_input : scenario52_type := (  0,   0);
	signal scenario52_full : scenario52_type  := (  0,   0);
	constant SCENARIO52_ADDRESS: integer := 5487;

	constant SCENARIO53_LENGTH : integer := 1;
	type scenario53_type is array(0 to 1) of integer;
	signal scenario53_input : scenario53_type := (198,   0);
	signal scenario53_full : scenario53_type  := (198,  31);
	constant SCENARIO53_ADDRESS: integer := 7868;

	constant SCENARIO54_LENGTH : integer := 1;
	type scenario54_type is array(0 to 1) of integer;
	signal scenario54_input : scenario54_type := ( 65,   0);
	signal scenario54_full : scenario54_type  := ( 65,  31);
	constant SCENARIO54_ADDRESS: integer := 5263;

	constant SCENARIO55_LENGTH : integer := 1;
	type scenario55_type is array(0 to 1) of integer;
	signal scenario55_input : scenario55_type := ( 53,   0);
	signal scenario55_full : scenario55_type  := ( 53,  31);
	constant SCENARIO55_ADDRESS: integer := 6440;

	constant SCENARIO56_LENGTH : integer := 1;
	type scenario56_type is array(0 to 1) of integer;
	signal scenario56_input : scenario56_type := (163,   0);
	signal scenario56_full : scenario56_type  := (163,  31);
	constant SCENARIO56_ADDRESS: integer := 5857;

	constant SCENARIO57_LENGTH : integer := 1;
	type scenario57_type is array(0 to 1) of integer;
	signal scenario57_input : scenario57_type := (206,   0);
	signal scenario57_full : scenario57_type  := (206,  31);
	constant SCENARIO57_ADDRESS: integer := 3873;

	constant SCENARIO58_LENGTH : integer := 1;
	type scenario58_type is array(0 to 1) of integer;
	signal scenario58_input : scenario58_type := (  0,   0);
	signal scenario58_full : scenario58_type  := (  0,   0);
	constant SCENARIO58_ADDRESS: integer := 5955;

	constant SCENARIO59_LENGTH : integer := 1;
	type scenario59_type is array(0 to 1) of integer;
	signal scenario59_input : scenario59_type := (164,   0);
	signal scenario59_full : scenario59_type  := (164,  31);
	constant SCENARIO59_ADDRESS: integer := 8543;

	constant SCENARIO60_LENGTH : integer := 1;
	type scenario60_type is array(0 to 1) of integer;
	signal scenario60_input : scenario60_type := (  0,   0);
	signal scenario60_full : scenario60_type  := (  0,   0);
	constant SCENARIO60_ADDRESS: integer := 8999;

	constant SCENARIO61_LENGTH : integer := 1;
	type scenario61_type is array(0 to 1) of integer;
	signal scenario61_input : scenario61_type := ( 58,   0);
	signal scenario61_full : scenario61_type  := ( 58,  31);
	constant SCENARIO61_ADDRESS: integer := 5502;

	constant SCENARIO62_LENGTH : integer := 1;
	type scenario62_type is array(0 to 1) of integer;
	signal scenario62_input : scenario62_type := (  0,   0);
	signal scenario62_full : scenario62_type  := (  0,   0);
	constant SCENARIO62_ADDRESS: integer := 4371;

	constant SCENARIO63_LENGTH : integer := 1;
	type scenario63_type is array(0 to 1) of integer;
	signal scenario63_input : scenario63_type := (  0,   0);
	signal scenario63_full : scenario63_type  := (  0,   0);
	constant SCENARIO63_ADDRESS: integer := 3803;

	constant SCENARIO64_LENGTH : integer := 1;
	type scenario64_type is array(0 to 1) of integer;
	signal scenario64_input : scenario64_type := (134,   0);
	signal scenario64_full : scenario64_type  := (134,  31);
	constant SCENARIO64_ADDRESS: integer := 3280;

	constant SCENARIO65_LENGTH : integer := 1;
	type scenario65_type is array(0 to 1) of integer;
	signal scenario65_input : scenario65_type := (  0,   0);
	signal scenario65_full : scenario65_type  := (  0,   0);
	constant SCENARIO65_ADDRESS: integer := 6567;

	constant SCENARIO66_LENGTH : integer := 1;
	type scenario66_type is array(0 to 1) of integer;
	signal scenario66_input : scenario66_type := (  0,   0);
	signal scenario66_full : scenario66_type  := (  0,   0);
	constant SCENARIO66_ADDRESS: integer := 8542;

	constant SCENARIO67_LENGTH : integer := 1;
	type scenario67_type is array(0 to 1) of integer;
	signal scenario67_input : scenario67_type := (211,   0);
	signal scenario67_full : scenario67_type  := (211,  31);
	constant SCENARIO67_ADDRESS: integer := 7470;

	constant SCENARIO68_LENGTH : integer := 1;
	type scenario68_type is array(0 to 1) of integer;
	signal scenario68_input : scenario68_type := (  0,   0);
	signal scenario68_full : scenario68_type  := (  0,   0);
	constant SCENARIO68_ADDRESS: integer := 5120;

	constant SCENARIO69_LENGTH : integer := 1;
	type scenario69_type is array(0 to 1) of integer;
	signal scenario69_input : scenario69_type := (  4,   0);
	signal scenario69_full : scenario69_type  := (  4,  31);
	constant SCENARIO69_ADDRESS: integer := 1647;

	constant SCENARIO70_LENGTH : integer := 1;
	type scenario70_type is array(0 to 1) of integer;
	signal scenario70_input : scenario70_type := ( 82,   0);
	signal scenario70_full : scenario70_type  := ( 82,  31);
	constant SCENARIO70_ADDRESS: integer := 1562;

	constant SCENARIO71_LENGTH : integer := 1;
	type scenario71_type is array(0 to 1) of integer;
	signal scenario71_input : scenario71_type := ( 66,   0);
	signal scenario71_full : scenario71_type  := ( 66,  31);
	constant SCENARIO71_ADDRESS: integer := 1701;

	constant SCENARIO72_LENGTH : integer := 1;
	type scenario72_type is array(0 to 1) of integer;
	signal scenario72_input : scenario72_type := (  0,   0);
	signal scenario72_full : scenario72_type  := (  0,   0);
	constant SCENARIO72_ADDRESS: integer := 1308;

	constant SCENARIO73_LENGTH : integer := 1;
	type scenario73_type is array(0 to 1) of integer;
	signal scenario73_input : scenario73_type := ( 46,   0);
	signal scenario73_full : scenario73_type  := ( 46,  31);
	constant SCENARIO73_ADDRESS: integer := 3626;

	constant SCENARIO74_LENGTH : integer := 1;
	type scenario74_type is array(0 to 1) of integer;
	signal scenario74_input : scenario74_type := (119,   0);
	signal scenario74_full : scenario74_type  := (119,  31);
	constant SCENARIO74_ADDRESS: integer := 3671;

	constant SCENARIO75_LENGTH : integer := 1;
	type scenario75_type is array(0 to 1) of integer;
	signal scenario75_input : scenario75_type := (  0,   0);
	signal scenario75_full : scenario75_type  := (  0,   0);
	constant SCENARIO75_ADDRESS: integer := 7622;

	constant SCENARIO76_LENGTH : integer := 1;
	type scenario76_type is array(0 to 1) of integer;
	signal scenario76_input : scenario76_type := (117,   0);
	signal scenario76_full : scenario76_type  := (117,  31);
	constant SCENARIO76_ADDRESS: integer := 1406;

	constant SCENARIO77_LENGTH : integer := 1;
	type scenario77_type is array(0 to 1) of integer;
	signal scenario77_input : scenario77_type := ( 23,   0);
	signal scenario77_full : scenario77_type  := ( 23,  31);
	constant SCENARIO77_ADDRESS: integer := 5957;

	constant SCENARIO78_LENGTH : integer := 1;
	type scenario78_type is array(0 to 1) of integer;
	signal scenario78_input : scenario78_type := (194,   0);
	signal scenario78_full : scenario78_type  := (194,  31);
	constant SCENARIO78_ADDRESS: integer := 4993;

	constant SCENARIO79_LENGTH : integer := 1;
	type scenario79_type is array(0 to 1) of integer;
	signal scenario79_input : scenario79_type := ( 29,   0);
	signal scenario79_full : scenario79_type  := ( 29,  31);
	constant SCENARIO79_ADDRESS: integer := 4043;

	constant SCENARIO80_LENGTH : integer := 1;
	type scenario80_type is array(0 to 1) of integer;
	signal scenario80_input : scenario80_type := (145,   0);
	signal scenario80_full : scenario80_type  := (145,  31);
	constant SCENARIO80_ADDRESS: integer := 1925;

	constant SCENARIO81_LENGTH : integer := 1;
	type scenario81_type is array(0 to 1) of integer;
	signal scenario81_input : scenario81_type := (  0,   0);
	signal scenario81_full : scenario81_type  := (  0,   0);
	constant SCENARIO81_ADDRESS: integer := 5944;

	constant SCENARIO82_LENGTH : integer := 1;
	type scenario82_type is array(0 to 1) of integer;
	signal scenario82_input : scenario82_type := (  0,   0);
	signal scenario82_full : scenario82_type  := (  0,   0);
	constant SCENARIO82_ADDRESS: integer := 7965;

	constant SCENARIO83_LENGTH : integer := 1;
	type scenario83_type is array(0 to 1) of integer;
	signal scenario83_input : scenario83_type := (122,   0);
	signal scenario83_full : scenario83_type  := (122,  31);
	constant SCENARIO83_ADDRESS: integer := 3164;

	constant SCENARIO84_LENGTH : integer := 1;
	type scenario84_type is array(0 to 1) of integer;
	signal scenario84_input : scenario84_type := (  0,   0);
	signal scenario84_full : scenario84_type  := (  0,   0);
	constant SCENARIO84_ADDRESS: integer := 8222;

	constant SCENARIO85_LENGTH : integer := 1;
	type scenario85_type is array(0 to 1) of integer;
	signal scenario85_input : scenario85_type := (  0,   0);
	signal scenario85_full : scenario85_type  := (  0,   0);
	constant SCENARIO85_ADDRESS: integer := 6416;

	constant SCENARIO86_LENGTH : integer := 1;
	type scenario86_type is array(0 to 1) of integer;
	signal scenario86_input : scenario86_type := (  0,   0);
	signal scenario86_full : scenario86_type  := (  0,   0);
	constant SCENARIO86_ADDRESS: integer := 2601;

	constant SCENARIO87_LENGTH : integer := 1;
	type scenario87_type is array(0 to 1) of integer;
	signal scenario87_input : scenario87_type := (  0,   0);
	signal scenario87_full : scenario87_type  := (  0,   0);
	constant SCENARIO87_ADDRESS: integer := 9020;

	constant SCENARIO88_LENGTH : integer := 1;
	type scenario88_type is array(0 to 1) of integer;
	signal scenario88_input : scenario88_type := (231,   0);
	signal scenario88_full : scenario88_type  := (231,  31);
	constant SCENARIO88_ADDRESS: integer := 5642;

	constant SCENARIO89_LENGTH : integer := 1;
	type scenario89_type is array(0 to 1) of integer;
	signal scenario89_input : scenario89_type := (  0,   0);
	signal scenario89_full : scenario89_type  := (  0,   0);
	constant SCENARIO89_ADDRESS: integer := 7052;

	constant SCENARIO90_LENGTH : integer := 1;
	type scenario90_type is array(0 to 1) of integer;
	signal scenario90_input : scenario90_type := (  0,   0);
	signal scenario90_full : scenario90_type  := (  0,   0);
	constant SCENARIO90_ADDRESS: integer := 5377;

	constant SCENARIO91_LENGTH : integer := 1;
	type scenario91_type is array(0 to 1) of integer;
	signal scenario91_input : scenario91_type := (201,   0);
	signal scenario91_full : scenario91_type  := (201,  31);
	constant SCENARIO91_ADDRESS: integer := 9516;

	constant SCENARIO92_LENGTH : integer := 1;
	type scenario92_type is array(0 to 1) of integer;
	signal scenario92_input : scenario92_type := (  0,   0);
	signal scenario92_full : scenario92_type  := (  0,   0);
	constant SCENARIO92_ADDRESS: integer := 3913;

	constant SCENARIO93_LENGTH : integer := 1;
	type scenario93_type is array(0 to 1) of integer;
	signal scenario93_input : scenario93_type := (  0,   0);
	signal scenario93_full : scenario93_type  := (  0,   0);
	constant SCENARIO93_ADDRESS: integer := 4055;

	constant SCENARIO94_LENGTH : integer := 1;
	type scenario94_type is array(0 to 1) of integer;
	signal scenario94_input : scenario94_type := (  0,   0);
	signal scenario94_full : scenario94_type  := (  0,   0);
	constant SCENARIO94_ADDRESS: integer := 8003;

	constant SCENARIO95_LENGTH : integer := 1;
	type scenario95_type is array(0 to 1) of integer;
	signal scenario95_input : scenario95_type := (  0,   0);
	signal scenario95_full : scenario95_type  := (  0,   0);
	constant SCENARIO95_ADDRESS: integer := 9248;

	constant SCENARIO96_LENGTH : integer := 1;
	type scenario96_type is array(0 to 1) of integer;
	signal scenario96_input : scenario96_type := (  0,   0);
	signal scenario96_full : scenario96_type  := (  0,   0);
	constant SCENARIO96_ADDRESS: integer := 5110;

	constant SCENARIO97_LENGTH : integer := 1;
	type scenario97_type is array(0 to 1) of integer;
	signal scenario97_input : scenario97_type := (119,   0);
	signal scenario97_full : scenario97_type  := (119,  31);
	constant SCENARIO97_ADDRESS: integer := 3333;

	constant SCENARIO98_LENGTH : integer := 1;
	type scenario98_type is array(0 to 1) of integer;
	signal scenario98_input : scenario98_type := (  0,   0);
	signal scenario98_full : scenario98_type  := (  0,   0);
	constant SCENARIO98_ADDRESS: integer := 8315;

	constant SCENARIO99_LENGTH : integer := 1;
	type scenario99_type is array(0 to 1) of integer;
	signal scenario99_input : scenario99_type := (  0,   0);
	signal scenario99_full : scenario99_type  := (  0,   0);
	constant SCENARIO99_ADDRESS: integer := 3831;

	constant SCENARIO100_LENGTH : integer := 1;
	type scenario100_type is array(0 to 1) of integer;
	signal scenario100_input : scenario100_type := (  0,   0);
	signal scenario100_full : scenario100_type  := (  0,   0);
	constant SCENARIO100_ADDRESS: integer := 7043;

	signal memory_control: std_logic := '0';
	shared variable mem_modified: integer := 0;
	component project_reti_logiche is
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
	end component project_reti_logiche;
begin
	UUT : project_reti_logiche
	port map(
				i_clk   => tb_clk,
				i_rst   => tb_rst,
				i_start => tb_start,
				i_add   => tb_add,
				i_k     => tb_k,
				
				o_done => tb_done,
				
				o_mem_addr => exc_o_mem_addr,
				i_mem_data => tb_i_mem_data,
				o_mem_data => exc_o_mem_data,
				o_mem_we   => exc_o_mem_we,
				o_mem_en   => exc_o_mem_en
	);

	tb_clk <= not tb_clk after CLOCK_PERIOD/2;

    MEM : process (tb_clk)
    begin
        if tb_clk'event and tb_clk = '1' then
            if tb_o_mem_en = '1' then
                if tb_o_mem_we = '1' then
	                mem_modified := 1;
                    RAM(to_integer(unsigned(tb_o_mem_addr))) <= tb_o_mem_data after 1 ns;
                    tb_i_mem_data <= tb_o_mem_data after 1 ns;
                else
                    tb_i_mem_data <= RAM(to_integer(unsigned(tb_o_mem_addr))) after 1 ns;
                end if;
            end if;
        end if;
    end process;

    memory_signal_swapper : process(memory_control, init_o_mem_addr, init_o_mem_data,
                                    init_o_mem_en,  init_o_mem_we,   exc_o_mem_addr,
                                    exc_o_mem_data, exc_o_mem_en, exc_o_mem_we)
    begin
        tb_o_mem_addr <= init_o_mem_addr;
        tb_o_mem_data <= init_o_mem_data;
        tb_o_mem_en   <= init_o_mem_en;
        tb_o_mem_we   <= init_o_mem_we;

        if memory_control = '1' then
            tb_o_mem_addr <= exc_o_mem_addr;
            tb_o_mem_data <= exc_o_mem_data;
            tb_o_mem_en   <= exc_o_mem_en;
            tb_o_mem_we   <= exc_o_mem_we;
        end if;
    end process;

    create_scenario : process
    begin
        wait for 50 ns;

        tb_start <= '0';
        tb_add <= (others=>'0');
        tb_k   <= (others=>'0');
        tb_rst <= '1';
        
        wait for 50 ns;
        
        tb_rst <= '0';

--CONFIGURAZIONE MEMORIA PER SCENARIO: 1
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO1_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO1_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario1_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO1_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO1_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 2
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO2_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO2_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario2_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO2_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO2_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 3
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO3_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO3_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario3_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO3_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO3_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 4
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO4_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO4_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario4_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO4_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO4_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 5
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO5_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO5_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario5_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO5_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO5_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 6
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO6_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO6_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario6_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO6_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO6_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 7
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO7_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO7_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario7_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO7_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO7_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 8
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO8_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO8_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario8_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO8_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO8_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 9
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO9_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO9_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario9_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO9_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO9_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 10
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO10_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO10_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario10_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO10_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO10_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 11
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO11_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO11_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario11_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO11_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO11_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 12
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO12_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO12_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario12_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO12_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO12_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 13
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO13_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO13_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario13_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO13_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO13_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 14
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO14_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO14_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario14_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO14_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO14_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 15
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO15_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO15_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario15_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO15_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO15_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 16
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO16_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO16_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario16_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO16_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO16_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 17
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO17_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO17_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario17_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO17_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO17_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 18
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO18_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO18_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario18_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO18_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO18_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 19
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO19_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO19_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario19_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO19_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO19_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 20
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO20_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO20_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario20_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO20_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO20_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 21
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO21_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO21_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario21_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO21_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO21_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 22
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO22_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO22_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario22_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO22_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO22_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 23
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO23_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO23_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario23_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO23_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO23_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 24
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO24_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO24_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario24_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO24_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO24_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 25
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO25_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO25_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario25_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO25_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO25_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 26
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO26_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO26_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario26_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO26_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO26_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 27
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO27_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO27_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario27_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO27_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO27_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 28
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO28_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO28_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario28_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO28_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO28_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 29
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO29_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO29_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario29_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO29_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO29_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 30
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO30_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO30_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario30_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO30_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO30_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 31
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO31_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO31_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario31_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO31_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO31_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 32
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO32_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO32_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario32_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO32_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO32_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 33
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO33_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO33_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario33_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO33_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO33_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 34
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO34_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO34_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario34_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO34_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO34_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 35
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO35_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO35_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario35_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO35_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO35_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 36
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO36_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO36_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario36_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO36_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO36_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 37
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO37_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO37_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario37_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO37_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO37_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 38
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO38_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO38_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario38_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO38_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO38_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 39
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO39_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO39_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario39_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO39_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO39_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 40
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO40_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO40_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario40_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO40_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO40_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 41
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO41_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO41_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario41_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO41_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO41_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 42
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO42_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO42_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario42_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO42_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO42_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 43
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO43_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO43_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario43_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO43_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO43_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 44
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO44_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO44_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario44_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO44_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO44_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 45
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO45_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO45_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario45_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO45_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO45_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 46
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO46_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO46_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario46_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO46_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO46_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 47
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO47_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO47_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario47_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO47_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO47_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 48
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO48_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO48_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario48_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO48_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO48_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 49
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO49_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO49_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario49_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO49_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO49_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 50
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO50_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO50_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario50_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO50_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO50_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 51
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO51_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO51_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario51_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO51_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO51_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 52
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO52_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO52_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario52_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO52_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO52_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 53
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO53_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO53_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario53_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO53_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO53_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 54
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO54_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO54_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario54_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO54_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO54_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 55
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO55_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO55_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario55_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO55_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO55_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 56
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO56_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO56_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario56_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO56_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO56_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 57
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO57_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO57_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario57_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO57_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO57_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 58
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO58_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO58_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario58_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO58_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO58_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 59
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO59_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO59_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario59_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO59_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO59_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 60
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO60_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO60_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario60_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO60_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO60_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 61
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO61_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO61_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario61_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO61_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO61_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 62
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO62_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO62_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario62_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO62_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO62_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 63
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO63_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO63_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario63_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO63_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO63_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 64
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO64_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO64_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario64_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO64_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO64_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 65
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO65_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO65_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario65_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO65_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO65_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 66
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO66_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO66_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario66_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO66_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO66_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 67
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO67_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO67_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario67_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO67_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO67_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 68
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO68_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO68_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario68_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO68_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO68_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 69
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO69_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO69_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario69_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO69_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO69_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 70
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO70_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO70_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario70_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO70_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO70_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 71
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO71_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO71_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario71_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO71_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO71_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 72
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO72_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO72_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario72_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO72_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO72_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 73
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO73_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO73_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario73_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO73_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO73_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 74
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO74_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO74_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario74_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO74_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO74_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 75
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO75_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO75_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario75_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO75_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO75_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 76
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO76_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO76_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario76_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO76_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO76_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 77
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO77_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO77_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario77_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO77_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO77_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 78
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO78_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO78_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario78_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO78_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO78_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 79
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO79_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO79_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario79_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO79_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO79_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 80
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO80_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO80_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario80_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO80_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO80_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 81
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO81_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO81_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario81_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO81_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO81_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 82
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO82_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO82_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario82_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO82_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO82_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 83
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO83_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO83_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario83_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO83_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO83_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 84
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO84_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO84_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario84_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO84_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO84_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 85
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO85_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO85_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario85_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO85_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO85_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 86
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO86_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO86_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario86_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO86_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO86_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 87
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO87_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO87_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario87_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO87_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO87_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 88
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO88_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO88_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario88_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO88_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO88_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 89
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO89_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO89_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario89_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO89_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO89_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 90
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO90_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO90_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario90_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO90_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO90_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 91
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO91_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO91_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario91_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO91_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO91_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 92
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO92_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO92_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario92_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO92_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO92_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 93
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO93_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO93_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario93_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO93_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO93_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 94
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO94_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO94_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario94_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO94_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO94_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 95
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO95_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO95_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario95_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO95_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO95_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 96
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO96_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO96_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario96_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO96_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO96_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 97
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO97_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO97_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario97_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO97_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO97_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 98
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO98_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO98_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario98_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO98_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO98_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 99
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO99_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO99_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario99_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO99_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO99_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


--CONFIGURAZIONE MEMORIA PER SCENARIO: 100
		memory_control <= '0';
		wait until falling_edge(tb_clk);
        for i in 0 to SCENARIO100_LENGTH*2-1 loop
            init_o_mem_addr<= std_logic_vector(to_unsigned(SCENARIO100_ADDRESS+i, 16));
            init_o_mem_data<= std_logic_vector(to_unsigned(scenario100_input(i),8));
            init_o_mem_en  <= '1';
            init_o_mem_we  <= '1';
            wait until rising_edge(tb_clk);   
        end loop;
        wait until falling_edge(tb_clk);
        memory_control <= '1';
        tb_add <= std_logic_vector(to_unsigned(SCENARIO100_ADDRESS, 16));
        tb_k   <= std_logic_vector(to_unsigned(SCENARIO100_LENGTH, 10));
        tb_start <= '1';
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;
        wait for 5 ns;
        tb_start <= '0';


		 wait;
	 end process;

    test_routine : process
    begin

        wait until tb_rst = '1';
        wait for 25 ns;
        assert tb_done = '0' report "TEST FALLITO o_done !=0 during reset" severity failure;
        wait until tb_rst = '0';

        wait until falling_edge(tb_clk);
        assert tb_done = '0' report "TEST FALLITO o_done !=0 after reset before start" severity failure;

-- SCENARIO NUMERO: 1 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO1_LENGTH*2-1 loop
            assert RAM(SCENARIO1_ADDRESS+i) = std_logic_vector(to_unsigned(scenario1_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario1_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO1_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 2 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO2_LENGTH*2-1 loop
            assert RAM(SCENARIO2_ADDRESS+i) = std_logic_vector(to_unsigned(scenario2_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario2_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO2_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 3 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO3_LENGTH*2-1 loop
            assert RAM(SCENARIO3_ADDRESS+i) = std_logic_vector(to_unsigned(scenario3_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario3_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO3_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 4 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO4_LENGTH*2-1 loop
            assert RAM(SCENARIO4_ADDRESS+i) = std_logic_vector(to_unsigned(scenario4_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario4_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO4_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 5 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO5_LENGTH*2-1 loop
            assert RAM(SCENARIO5_ADDRESS+i) = std_logic_vector(to_unsigned(scenario5_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario5_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO5_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 6 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO6_LENGTH*2-1 loop
            assert RAM(SCENARIO6_ADDRESS+i) = std_logic_vector(to_unsigned(scenario6_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario6_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO6_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 7 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO7_LENGTH*2-1 loop
            assert RAM(SCENARIO7_ADDRESS+i) = std_logic_vector(to_unsigned(scenario7_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario7_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO7_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 8 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO8_LENGTH*2-1 loop
            assert RAM(SCENARIO8_ADDRESS+i) = std_logic_vector(to_unsigned(scenario8_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario8_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO8_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 9 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO9_LENGTH*2-1 loop
            assert RAM(SCENARIO9_ADDRESS+i) = std_logic_vector(to_unsigned(scenario9_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario9_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO9_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 10 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO10_LENGTH*2-1 loop
            assert RAM(SCENARIO10_ADDRESS+i) = std_logic_vector(to_unsigned(scenario10_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario10_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO10_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 11 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO11_LENGTH*2-1 loop
            assert RAM(SCENARIO11_ADDRESS+i) = std_logic_vector(to_unsigned(scenario11_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario11_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO11_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 12 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO12_LENGTH*2-1 loop
            assert RAM(SCENARIO12_ADDRESS+i) = std_logic_vector(to_unsigned(scenario12_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario12_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO12_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 13 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO13_LENGTH*2-1 loop
            assert RAM(SCENARIO13_ADDRESS+i) = std_logic_vector(to_unsigned(scenario13_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario13_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO13_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 14 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO14_LENGTH*2-1 loop
            assert RAM(SCENARIO14_ADDRESS+i) = std_logic_vector(to_unsigned(scenario14_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario14_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO14_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 15 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO15_LENGTH*2-1 loop
            assert RAM(SCENARIO15_ADDRESS+i) = std_logic_vector(to_unsigned(scenario15_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario15_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO15_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 16 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO16_LENGTH*2-1 loop
            assert RAM(SCENARIO16_ADDRESS+i) = std_logic_vector(to_unsigned(scenario16_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario16_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO16_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 17 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO17_LENGTH*2-1 loop
            assert RAM(SCENARIO17_ADDRESS+i) = std_logic_vector(to_unsigned(scenario17_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario17_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO17_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 18 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO18_LENGTH*2-1 loop
            assert RAM(SCENARIO18_ADDRESS+i) = std_logic_vector(to_unsigned(scenario18_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario18_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO18_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 19 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO19_LENGTH*2-1 loop
            assert RAM(SCENARIO19_ADDRESS+i) = std_logic_vector(to_unsigned(scenario19_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario19_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO19_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 20 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO20_LENGTH*2-1 loop
            assert RAM(SCENARIO20_ADDRESS+i) = std_logic_vector(to_unsigned(scenario20_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario20_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO20_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 21 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO21_LENGTH*2-1 loop
            assert RAM(SCENARIO21_ADDRESS+i) = std_logic_vector(to_unsigned(scenario21_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario21_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO21_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 22 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO22_LENGTH*2-1 loop
            assert RAM(SCENARIO22_ADDRESS+i) = std_logic_vector(to_unsigned(scenario22_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario22_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO22_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 23 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO23_LENGTH*2-1 loop
            assert RAM(SCENARIO23_ADDRESS+i) = std_logic_vector(to_unsigned(scenario23_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario23_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO23_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 24 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO24_LENGTH*2-1 loop
            assert RAM(SCENARIO24_ADDRESS+i) = std_logic_vector(to_unsigned(scenario24_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario24_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO24_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 25 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO25_LENGTH*2-1 loop
            assert RAM(SCENARIO25_ADDRESS+i) = std_logic_vector(to_unsigned(scenario25_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario25_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO25_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 26 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO26_LENGTH*2-1 loop
            assert RAM(SCENARIO26_ADDRESS+i) = std_logic_vector(to_unsigned(scenario26_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario26_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO26_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 27 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO27_LENGTH*2-1 loop
            assert RAM(SCENARIO27_ADDRESS+i) = std_logic_vector(to_unsigned(scenario27_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario27_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO27_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 28 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO28_LENGTH*2-1 loop
            assert RAM(SCENARIO28_ADDRESS+i) = std_logic_vector(to_unsigned(scenario28_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario28_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO28_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 29 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO29_LENGTH*2-1 loop
            assert RAM(SCENARIO29_ADDRESS+i) = std_logic_vector(to_unsigned(scenario29_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario29_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO29_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 30 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO30_LENGTH*2-1 loop
            assert RAM(SCENARIO30_ADDRESS+i) = std_logic_vector(to_unsigned(scenario30_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario30_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO30_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 31 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO31_LENGTH*2-1 loop
            assert RAM(SCENARIO31_ADDRESS+i) = std_logic_vector(to_unsigned(scenario31_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario31_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO31_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 32 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO32_LENGTH*2-1 loop
            assert RAM(SCENARIO32_ADDRESS+i) = std_logic_vector(to_unsigned(scenario32_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario32_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO32_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 33 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO33_LENGTH*2-1 loop
            assert RAM(SCENARIO33_ADDRESS+i) = std_logic_vector(to_unsigned(scenario33_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario33_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO33_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 34 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO34_LENGTH*2-1 loop
            assert RAM(SCENARIO34_ADDRESS+i) = std_logic_vector(to_unsigned(scenario34_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario34_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO34_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 35 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO35_LENGTH*2-1 loop
            assert RAM(SCENARIO35_ADDRESS+i) = std_logic_vector(to_unsigned(scenario35_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario35_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO35_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 36 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO36_LENGTH*2-1 loop
            assert RAM(SCENARIO36_ADDRESS+i) = std_logic_vector(to_unsigned(scenario36_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario36_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO36_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 37 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO37_LENGTH*2-1 loop
            assert RAM(SCENARIO37_ADDRESS+i) = std_logic_vector(to_unsigned(scenario37_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario37_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO37_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 38 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO38_LENGTH*2-1 loop
            assert RAM(SCENARIO38_ADDRESS+i) = std_logic_vector(to_unsigned(scenario38_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario38_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO38_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 39 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO39_LENGTH*2-1 loop
            assert RAM(SCENARIO39_ADDRESS+i) = std_logic_vector(to_unsigned(scenario39_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario39_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO39_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 40 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO40_LENGTH*2-1 loop
            assert RAM(SCENARIO40_ADDRESS+i) = std_logic_vector(to_unsigned(scenario40_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario40_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO40_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 41 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO41_LENGTH*2-1 loop
            assert RAM(SCENARIO41_ADDRESS+i) = std_logic_vector(to_unsigned(scenario41_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario41_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO41_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 42 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO42_LENGTH*2-1 loop
            assert RAM(SCENARIO42_ADDRESS+i) = std_logic_vector(to_unsigned(scenario42_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario42_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO42_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 43 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO43_LENGTH*2-1 loop
            assert RAM(SCENARIO43_ADDRESS+i) = std_logic_vector(to_unsigned(scenario43_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario43_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO43_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 44 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO44_LENGTH*2-1 loop
            assert RAM(SCENARIO44_ADDRESS+i) = std_logic_vector(to_unsigned(scenario44_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario44_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO44_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 45 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO45_LENGTH*2-1 loop
            assert RAM(SCENARIO45_ADDRESS+i) = std_logic_vector(to_unsigned(scenario45_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario45_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO45_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 46 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO46_LENGTH*2-1 loop
            assert RAM(SCENARIO46_ADDRESS+i) = std_logic_vector(to_unsigned(scenario46_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario46_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO46_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 47 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO47_LENGTH*2-1 loop
            assert RAM(SCENARIO47_ADDRESS+i) = std_logic_vector(to_unsigned(scenario47_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario47_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO47_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 48 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO48_LENGTH*2-1 loop
            assert RAM(SCENARIO48_ADDRESS+i) = std_logic_vector(to_unsigned(scenario48_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario48_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO48_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 49 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO49_LENGTH*2-1 loop
            assert RAM(SCENARIO49_ADDRESS+i) = std_logic_vector(to_unsigned(scenario49_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario49_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO49_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 50 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO50_LENGTH*2-1 loop
            assert RAM(SCENARIO50_ADDRESS+i) = std_logic_vector(to_unsigned(scenario50_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario50_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO50_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 51 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO51_LENGTH*2-1 loop
            assert RAM(SCENARIO51_ADDRESS+i) = std_logic_vector(to_unsigned(scenario51_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario51_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO51_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 52 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO52_LENGTH*2-1 loop
            assert RAM(SCENARIO52_ADDRESS+i) = std_logic_vector(to_unsigned(scenario52_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario52_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO52_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 53 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO53_LENGTH*2-1 loop
            assert RAM(SCENARIO53_ADDRESS+i) = std_logic_vector(to_unsigned(scenario53_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario53_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO53_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 54 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO54_LENGTH*2-1 loop
            assert RAM(SCENARIO54_ADDRESS+i) = std_logic_vector(to_unsigned(scenario54_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario54_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO54_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 55 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO55_LENGTH*2-1 loop
            assert RAM(SCENARIO55_ADDRESS+i) = std_logic_vector(to_unsigned(scenario55_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario55_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO55_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 56 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO56_LENGTH*2-1 loop
            assert RAM(SCENARIO56_ADDRESS+i) = std_logic_vector(to_unsigned(scenario56_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario56_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO56_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 57 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO57_LENGTH*2-1 loop
            assert RAM(SCENARIO57_ADDRESS+i) = std_logic_vector(to_unsigned(scenario57_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario57_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO57_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 58 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO58_LENGTH*2-1 loop
            assert RAM(SCENARIO58_ADDRESS+i) = std_logic_vector(to_unsigned(scenario58_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario58_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO58_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 59 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO59_LENGTH*2-1 loop
            assert RAM(SCENARIO59_ADDRESS+i) = std_logic_vector(to_unsigned(scenario59_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario59_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO59_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 60 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO60_LENGTH*2-1 loop
            assert RAM(SCENARIO60_ADDRESS+i) = std_logic_vector(to_unsigned(scenario60_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario60_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO60_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 61 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO61_LENGTH*2-1 loop
            assert RAM(SCENARIO61_ADDRESS+i) = std_logic_vector(to_unsigned(scenario61_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario61_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO61_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 62 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO62_LENGTH*2-1 loop
            assert RAM(SCENARIO62_ADDRESS+i) = std_logic_vector(to_unsigned(scenario62_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario62_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO62_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 63 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO63_LENGTH*2-1 loop
            assert RAM(SCENARIO63_ADDRESS+i) = std_logic_vector(to_unsigned(scenario63_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario63_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO63_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 64 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO64_LENGTH*2-1 loop
            assert RAM(SCENARIO64_ADDRESS+i) = std_logic_vector(to_unsigned(scenario64_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario64_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO64_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 65 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO65_LENGTH*2-1 loop
            assert RAM(SCENARIO65_ADDRESS+i) = std_logic_vector(to_unsigned(scenario65_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario65_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO65_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 66 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO66_LENGTH*2-1 loop
            assert RAM(SCENARIO66_ADDRESS+i) = std_logic_vector(to_unsigned(scenario66_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario66_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO66_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 67 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO67_LENGTH*2-1 loop
            assert RAM(SCENARIO67_ADDRESS+i) = std_logic_vector(to_unsigned(scenario67_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario67_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO67_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 68 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO68_LENGTH*2-1 loop
            assert RAM(SCENARIO68_ADDRESS+i) = std_logic_vector(to_unsigned(scenario68_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario68_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO68_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 69 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO69_LENGTH*2-1 loop
            assert RAM(SCENARIO69_ADDRESS+i) = std_logic_vector(to_unsigned(scenario69_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario69_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO69_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 70 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO70_LENGTH*2-1 loop
            assert RAM(SCENARIO70_ADDRESS+i) = std_logic_vector(to_unsigned(scenario70_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario70_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO70_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 71 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO71_LENGTH*2-1 loop
            assert RAM(SCENARIO71_ADDRESS+i) = std_logic_vector(to_unsigned(scenario71_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario71_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO71_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 72 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO72_LENGTH*2-1 loop
            assert RAM(SCENARIO72_ADDRESS+i) = std_logic_vector(to_unsigned(scenario72_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario72_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO72_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 73 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO73_LENGTH*2-1 loop
            assert RAM(SCENARIO73_ADDRESS+i) = std_logic_vector(to_unsigned(scenario73_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario73_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO73_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 74 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO74_LENGTH*2-1 loop
            assert RAM(SCENARIO74_ADDRESS+i) = std_logic_vector(to_unsigned(scenario74_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario74_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO74_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 75 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO75_LENGTH*2-1 loop
            assert RAM(SCENARIO75_ADDRESS+i) = std_logic_vector(to_unsigned(scenario75_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario75_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO75_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 76 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO76_LENGTH*2-1 loop
            assert RAM(SCENARIO76_ADDRESS+i) = std_logic_vector(to_unsigned(scenario76_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario76_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO76_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 77 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO77_LENGTH*2-1 loop
            assert RAM(SCENARIO77_ADDRESS+i) = std_logic_vector(to_unsigned(scenario77_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario77_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO77_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 78 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO78_LENGTH*2-1 loop
            assert RAM(SCENARIO78_ADDRESS+i) = std_logic_vector(to_unsigned(scenario78_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario78_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO78_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 79 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO79_LENGTH*2-1 loop
            assert RAM(SCENARIO79_ADDRESS+i) = std_logic_vector(to_unsigned(scenario79_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario79_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO79_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 80 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO80_LENGTH*2-1 loop
            assert RAM(SCENARIO80_ADDRESS+i) = std_logic_vector(to_unsigned(scenario80_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario80_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO80_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 81 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO81_LENGTH*2-1 loop
            assert RAM(SCENARIO81_ADDRESS+i) = std_logic_vector(to_unsigned(scenario81_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario81_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO81_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 82 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO82_LENGTH*2-1 loop
            assert RAM(SCENARIO82_ADDRESS+i) = std_logic_vector(to_unsigned(scenario82_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario82_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO82_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 83 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO83_LENGTH*2-1 loop
            assert RAM(SCENARIO83_ADDRESS+i) = std_logic_vector(to_unsigned(scenario83_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario83_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO83_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 84 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO84_LENGTH*2-1 loop
            assert RAM(SCENARIO84_ADDRESS+i) = std_logic_vector(to_unsigned(scenario84_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario84_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO84_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 85 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO85_LENGTH*2-1 loop
            assert RAM(SCENARIO85_ADDRESS+i) = std_logic_vector(to_unsigned(scenario85_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario85_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO85_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 86 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO86_LENGTH*2-1 loop
            assert RAM(SCENARIO86_ADDRESS+i) = std_logic_vector(to_unsigned(scenario86_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario86_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO86_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 87 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO87_LENGTH*2-1 loop
            assert RAM(SCENARIO87_ADDRESS+i) = std_logic_vector(to_unsigned(scenario87_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario87_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO87_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 88 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO88_LENGTH*2-1 loop
            assert RAM(SCENARIO88_ADDRESS+i) = std_logic_vector(to_unsigned(scenario88_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario88_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO88_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 89 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO89_LENGTH*2-1 loop
            assert RAM(SCENARIO89_ADDRESS+i) = std_logic_vector(to_unsigned(scenario89_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario89_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO89_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 90 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO90_LENGTH*2-1 loop
            assert RAM(SCENARIO90_ADDRESS+i) = std_logic_vector(to_unsigned(scenario90_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario90_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO90_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 91 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO91_LENGTH*2-1 loop
            assert RAM(SCENARIO91_ADDRESS+i) = std_logic_vector(to_unsigned(scenario91_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario91_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO91_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 92 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO92_LENGTH*2-1 loop
            assert RAM(SCENARIO92_ADDRESS+i) = std_logic_vector(to_unsigned(scenario92_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario92_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO92_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 93 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO93_LENGTH*2-1 loop
            assert RAM(SCENARIO93_ADDRESS+i) = std_logic_vector(to_unsigned(scenario93_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario93_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO93_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 94 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO94_LENGTH*2-1 loop
            assert RAM(SCENARIO94_ADDRESS+i) = std_logic_vector(to_unsigned(scenario94_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario94_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO94_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 95 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO95_LENGTH*2-1 loop
            assert RAM(SCENARIO95_ADDRESS+i) = std_logic_vector(to_unsigned(scenario95_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario95_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO95_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 96 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO96_LENGTH*2-1 loop
            assert RAM(SCENARIO96_ADDRESS+i) = std_logic_vector(to_unsigned(scenario96_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario96_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO96_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 97 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO97_LENGTH*2-1 loop
            assert RAM(SCENARIO97_ADDRESS+i) = std_logic_vector(to_unsigned(scenario97_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario97_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO97_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 98 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO98_LENGTH*2-1 loop
            assert RAM(SCENARIO98_ADDRESS+i) = std_logic_vector(to_unsigned(scenario98_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario98_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO98_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 99 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO99_LENGTH*2-1 loop
            assert RAM(SCENARIO99_ADDRESS+i) = std_logic_vector(to_unsigned(scenario99_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario99_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO99_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

-- SCENARIO NUMERO: 100 
        wait until rising_edge(tb_start);
        
        while tb_done /= '1' loop                
            wait until rising_edge(tb_clk);
        end loop;

        assert tb_o_mem_en = '0' or tb_o_mem_we = '0' report "TEST FALLITO o_mem_en !=0 memory should not be written after done." severity failure;

        for i in 0 to SCENARIO100_LENGTH*2-1 loop
            assert RAM(SCENARIO100_ADDRESS+i) = std_logic_vector(to_unsigned(scenario100_full(i),8)) report "TEST FALLITO @ OFFSET=" & integer'image(i) & " expected= " & integer'image(scenario100_full(i)) & " actual=" & integer'image(to_integer(unsigned(RAM(SCENARIO100_ADDRESS + i)))) severity failure;
        end loop;

        wait until falling_edge(tb_start);
        assert tb_done = '1' report "TEST FALLITO o_done !=0 after reset before start" severity failure;
        wait until falling_edge(tb_done);

		assert false report "Simulation Ended! TEST PASSATO (EXAMPLE)" severity failure;
    end process;
end TestLength1_arch;
