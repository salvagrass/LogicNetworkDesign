library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity ExecWithReset is
end ExecWithReset;

architecture ExecWithReset_arch  of ExecWithReset is
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

	constant SCENARIO1_LENGTH : integer := 150;
	type scenario1_type is array(0 to 299) of integer;
	signal scenario1_input : scenario1_type := (195,   0, 112,   0,   0,   0,   0,   0,   0,   0,  57,   0,   0,   0,   0,   0,   0,   0,   0,   0,   8,   0,   0,   0, 193,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 186,   0, 220,   0,   0,   0,   0,   0, 148,   0,   0,   0,   0,   0, 167,   0,  25,   0, 145,   0, 210,   0, 125,   0,   0,   0, 161,   0,   0,   0,   0,   0,   0,   0,   0,   0, 204,   0,   0,   0,   0,   0, 132,   0,   0,   0,   0,   0,   6,   0, 168,   0,  47,   0,  78,   0,   0,   0,  34,   0, 173,   0,   0,   0, 132,   0,   0,   0, 254,   0,   0,   0, 120,   0, 129,   0,   0,   0,   0,   0,  19,   0, 118,   0,   0,   0,   0,   0, 106,   0, 247,   0, 127,   0,   0,   0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,  80,   0,   0,   0,   0,   0,   0,   0, 224,   0,   0,   0,   0,   0,   0,   0, 170,   0, 217,   0, 114,   0,   0,   0, 150,   0,   0,   0,   0,   0,   0,   0,  87,   0,   0,   0, 215,   0, 202,   0,  59,   0, 178,   0,   0,   0, 234,   0,   0,   0,   0,   0,   0,   0,  96,   0,   0,   0,   0,   0,   0,   0,   0,   0, 201,   0, 244,   0,   0,   0,   0,   0,   0,   0, 106,   0,   0,   0,   0,   0,   0,   0,   0,   0, 162,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  22,   0, 249,   0,   0,   0, 176,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 140,   0, 196,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 113,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0);
	signal scenario1_full : scenario1_type  := (195,  31, 112,  31, 112,  30, 112,  29, 112,  28,  57,  31,  57,  30,  57,  29,  57,  28,  57,  27,   8,  31,   8,  30, 193,  31, 193,  30, 193,  29, 193,  28, 193,  27, 193,  26, 186,  31, 220,  31, 220,  30, 220,  29, 148,  31, 148,  30, 148,  29, 167,  31,  25,  31, 145,  31, 210,  31, 125,  31, 125,  30, 161,  31, 161,  30, 161,  29, 161,  28, 161,  27, 204,  31, 204,  30, 204,  29, 132,  31, 132,  30, 132,  29,   6,  31, 168,  31,  47,  31,  78,  31,  78,  30,  34,  31, 173,  31, 173,  30, 132,  31, 132,  30, 254,  31, 254,  30, 120,  31, 129,  31, 129,  30, 129,  29,  19,  31, 118,  31, 118,  30, 118,  29, 106,  31, 247,  31, 127,  31, 127,  30, 127,  29, 127,  28, 127,  27, 128,  31, 128,  30,  80,  31,  80,  30,  80,  29,  80,  28, 224,  31, 224,  30, 224,  29, 224,  28, 170,  31, 217,  31, 114,  31, 114,  30, 150,  31, 150,  30, 150,  29, 150,  28,  87,  31,  87,  30, 215,  31, 202,  31,  59,  31, 178,  31, 178,  30, 234,  31, 234,  30, 234,  29, 234,  28,  96,  31,  96,  30,  96,  29,  96,  28,  96,  27, 201,  31, 244,  31, 244,  30, 244,  29, 244,  28, 106,  31, 106,  30, 106,  29, 106,  28, 106,  27, 162,  31, 162,  30, 162,  29, 162,  28, 162,  27, 162,  26, 162,  25, 162,  24,  22,  31, 249,  31, 249,  30, 176,  31, 176,  30, 176,  29, 176,  28, 176,  27, 176,  26, 176,  25, 176,  24, 176,  23, 176,  22, 176,  21, 176,  20, 140,  31, 196,  31, 196,  30, 196,  29, 196,  28, 196,  27, 196,  26, 113,  31, 113,  30, 113,  29, 113,  28, 113,  27, 113,  26, 113,  25);
	constant SCENARIO1_ADDRESS: integer := 8327;

	constant SCENARIO2_LENGTH : integer := 301;
	type scenario2_type is array(0 to 601) of integer;
	signal scenario2_input : scenario2_type := (173,   0, 175,   0, 153,   0,   0,   0, 148,   0,   0,   0,   0,   0, 139,   0,  98,   0,   0,   0,   0,   0,   0,   0,   0,   0,  58,   0,   0,   0,   0,   0,  10,   0,   0,   0,   0,   0, 212,   0, 205,   0,   0,   0,   0,   0,  78,   0,  41,   0,  11,   0,  21,   0,   0,   0,   0,   0,   5,   0,   0,   0,   0,   0, 251,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 142,   0,   0,   0,   0,   0,   0,   0, 239,   0,   0,   0, 117,   0, 178,   0,   0,   0,   0,   0,   0,   0, 118,   0,   0,   0,   0,   0,   0,   0, 166,   0,   0,   0,  44,   0,   0,   0,  52,   0,   0,   0, 244,   0,   0,   0,   0,   0,   0,   0, 242,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  26,   0,   0,   0,   0,   0,   0,   0,  74,   0,   0,   0,   0,   0,   0,   0,  41,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  98,   0,   0,   0,  91,   0,   0,   0,  94,   0,   0,   0,   0,   0, 111,   0, 176,   0,  23,   0,   0,   0,   0,   0,   0,   0, 162,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 231,   0, 205,   0,  47,   0,  76,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  26,   0, 144,   0,   0,   0,  47,   0,   0,   0,   0,   0,   0,   0, 189,   0,   0,   0, 233,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  37,   0,   0,   0,   0,   0,   0,   0,   0,   0,  60,   0,  58,   0,   0,   0,   0,   0, 149,   0,   0,   0,   0,   0,   0,   0,  79,   0,   0,   0,   0,   0,   0,   0,   0,   0, 237,   0,   0,   0,   0,   0,  58,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 244,   0,   0,   0,   0,   0, 216,   0,   0,   0,  73,   0, 193,   0, 248,   0,   0,   0, 203,   0,   0,   0, 163,   0, 208,   0,  21,   0,   0,   0, 244,   0,   0,   0, 244,   0, 219,   0,   0,   0,   0,   0,  17,   0,   0,   0,   0,   0,   0,   0, 126,   0,   0,   0, 169,   0,   0,   0,   0,   0,   0,   0,  46,   0, 138,   0,   0,   0,   0,   0,   0,   0, 143,   0,   0,   0,   0,   0, 197,   0, 250,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 151,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  22,   0,   0,   0, 113,   0,  49,   0,   0,   0, 168,   0,   0,   0,   0,   0, 188,   0,   0,   0,   0,   0, 115,   0,   0,   0,   0,   0,  12,   0,   0,   0,   0,   0,   0,   0,   0,   0, 191,   0, 251,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  21,   0,   0,   0, 141,   0,   0,   0, 237,   0, 198,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 187,   0,   0,   0,   0,   0,   0,   0, 196,   0,   0,   0, 130,   0,   0,   0,   0,   0,   0,   0,  92,   0,   0,   0,  81,   0, 111,   0,  38,   0, 147,   0,   0,   0,   0,   0,   0,   0, 136,   0,   0,   0, 233,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  83,   0,   0,   0,   0,   0, 135,   0, 175,   0,  41,   0,   0,   0, 243,   0,   0,   0,   0,   0, 224,   0,   0,   0,   0,   0);
	signal scenario2_full : scenario2_type  := (173,  31, 175,  31, 153,  31, 153,  30, 148,  31, 148,  30, 148,  29, 139,  31,  98,  31,  98,  30,  98,  29,  98,  28,  98,  27,  58,  31,  58,  30,  58,  29,  10,  31,  10,  30,  10,  29, 212,  31, 205,  31, 205,  30, 205,  29,  78,  31,  41,  31,  11,  31,  21,  31,  21,  30,  21,  29,   5,  31,   5,  30,   5,  29, 251,  31, 251,  30, 251,  29, 251,  28, 251,  27, 251,  26, 251,  25, 251,  24, 142,  31, 142,  30, 142,  29, 142,  28, 239,  31, 239,  30, 117,  31, 178,  31, 178,  30, 178,  29, 178,  28, 118,  31, 118,  30, 118,  29, 118,  28, 166,  31, 166,  30,  44,  31,  44,  30,  52,  31,  52,  30, 244,  31, 244,  30, 244,  29, 244,  28, 242,  31, 242,  30, 242,  29, 242,  28, 242,  27, 242,  26, 242,  25, 242,  24, 242,  23,  26,  31,  26,  30,  26,  29,  26,  28,  74,  31,  74,  30,  74,  29,  74,  28,  41,  31,  41,  30,  41,  29,  41,  28,  41,  27,  41,  26,  41,  25,  41,  24,  41,  23,  41,  22,  98,  31,  98,  30,  91,  31,  91,  30,  94,  31,  94,  30,  94,  29, 111,  31, 176,  31,  23,  31,  23,  30,  23,  29,  23,  28, 162,  31, 162,  30, 162,  29, 162,  28, 162,  27, 162,  26, 231,  31, 205,  31,  47,  31,  76,  31,  76,  30,  76,  29,  76,  28,  76,  27,  76,  26,  76,  25,  76,  24,  76,  23,  76,  22,  26,  31, 144,  31, 144,  30,  47,  31,  47,  30,  47,  29,  47,  28, 189,  31, 189,  30, 233,  31, 233,  30, 233,  29, 233,  28, 233,  27, 233,  26,  37,  31,  37,  30,  37,  29,  37,  28,  37,  27,  60,  31,  58,  31,  58,  30,  58,  29, 149,  31, 149,  30, 149,  29, 149,  28,  79,  31,  79,  30,  79,  29,  79,  28,  79,  27, 237,  31, 237,  30, 237,  29,  58,  31,  58,  30,  58,  29,  58,  28,  58,  27,  58,  26, 244,  31, 244,  30, 244,  29, 216,  31, 216,  30,  73,  31, 193,  31, 248,  31, 248,  30, 203,  31, 203,  30, 163,  31, 208,  31,  21,  31,  21,  30, 244,  31, 244,  30, 244,  31, 219,  31, 219,  30, 219,  29,  17,  31,  17,  30,  17,  29,  17,  28, 126,  31, 126,  30, 169,  31, 169,  30, 169,  29, 169,  28,  46,  31, 138,  31, 138,  30, 138,  29, 138,  28, 143,  31, 143,  30, 143,  29, 197,  31, 250,  31, 250,  30, 250,  29, 250,  28, 250,  27, 250,  26, 250,  25, 151,  31, 151,  30, 151,  29, 151,  28, 151,  27, 151,  26, 151,  25, 151,  24,  22,  31,  22,  30, 113,  31,  49,  31,  49,  30, 168,  31, 168,  30, 168,  29, 188,  31, 188,  30, 188,  29, 115,  31, 115,  30, 115,  29,  12,  31,  12,  30,  12,  29,  12,  28,  12,  27, 191,  31, 251,  31, 251,  30, 251,  29, 251,  28, 251,  27, 251,  26, 251,  25,  21,  31,  21,  30, 141,  31, 141,  30, 237,  31, 198,  31, 198,  30, 198,  29, 198,  28, 198,  27, 198,  26, 198,  25, 187,  31, 187,  30, 187,  29, 187,  28, 196,  31, 196,  30, 130,  31, 130,  30, 130,  29, 130,  28,  92,  31,  92,  30,  81,  31, 111,  31,  38,  31, 147,  31, 147,  30, 147,  29, 147,  28, 136,  31, 136,  30, 233,  31, 233,  30, 233,  29, 233,  28, 233,  27, 233,  26, 233,  25,  83,  31,  83,  30,  83,  29, 135,  31, 175,  31,  41,  31,  41,  30, 243,  31, 243,  30, 243,  29, 224,  31, 224,  30, 224,  29);
	constant SCENARIO2_ADDRESS: integer := 7167;

	constant SCENARIO3_LENGTH : integer := 216;
	type scenario3_type is array(0 to 431) of integer;
	signal scenario3_input : scenario3_type := (  0,   0,   0,   0, 180,   0,   0,   0,   0,   0, 213,   0,  19,   0,   0,   0, 141,   0, 166,   0,   0,   0,  45,   0, 122,   0,   0,   0,   0,   0,  48,   0,   0,   0, 159,   0, 194,   0, 136,   0, 123,   0,   0,   0,   0,   0,   0,   0,   0,   0, 121,   0, 122,   0,   0,   0, 115,   0, 178,   0,   0,   0,   0,   0,   0,   0, 107,   0,  29,   0,   0,   0,   0,   0,   0,   0, 193,   0,   6,   0,   0,   0,   0,   0,   0,   0,  54,   0,   0,   0, 254,   0,   0,   0, 113,   0,   0,   0,   0,   0, 183,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 168,   0,   0,   0,   0,   0, 197,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 103,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 243,   0,   0,   0,  26,   0, 146,   0, 197,   0, 230,   0,   0,   0,   0,   0,   0,   0, 252,   0, 120,   0,   0,   0,  74,   0, 217,   0,  90,   0,   0,   0,   0,   0,   0,   0,   0,   0,  98,   0,   0,   0,   0,   0,   0,   0, 193,   0,   0,   0,   0,   0,  64,   0,  38,   0,   0,   0,   0,   0,  67,   0,   0,   0,   0,   0, 106,   0, 117,   0, 187,   0,   0,   0, 189,   0,   0,   0,  30,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 133,   0,   0,   0,   0,   0, 116,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  25,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 107,   0, 230,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 197,   0, 165,   0, 119,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 239,   0,   0,   0,   0,   0, 138,   0,   0,   0, 191,   0,   0,   0,   0,   0,   0,   0,   0,   0, 105,   0,   0,   0,   0,   0, 170,   0,   0,   0,  19,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 170,   0,  30,   0,   0,   0,  50,   0,   0,   0,   0,   0,  37,   0,   0,   0,   0,   0,   0,   0, 149,   0,   0,   0,   0,   0,   0,   0, 141,   0, 189,   0,   0,   0,  64,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 185,   0,   0,   0,   0,   0, 213,   0, 118,   0,   0,   0,   0,   0,  21,   0,   0,   0, 246,   0,   0,   0,   0,   0,   0,   0,   0,   0);
	signal scenario3_full : scenario3_type  := (  0,   0,   0,   0, 180,  31, 180,  30, 180,  29, 213,  31,  19,  31,  19,  30, 141,  31, 166,  31, 166,  30,  45,  31, 122,  31, 122,  30, 122,  29,  48,  31,  48,  30, 159,  31, 194,  31, 136,  31, 123,  31, 123,  30, 123,  29, 123,  28, 123,  27, 121,  31, 122,  31, 122,  30, 115,  31, 178,  31, 178,  30, 178,  29, 178,  28, 107,  31,  29,  31,  29,  30,  29,  29,  29,  28, 193,  31,   6,  31,   6,  30,   6,  29,   6,  28,  54,  31,  54,  30, 254,  31, 254,  30, 113,  31, 113,  30, 113,  29, 183,  31, 183,  30, 183,  29, 183,  28, 183,  27, 183,  26, 183,  25, 168,  31, 168,  30, 168,  29, 197,  31, 197,  30, 197,  29, 197,  28, 197,  27, 197,  26, 197,  25, 197,  24, 103,  31, 103,  30, 103,  29, 103,  28, 103,  27, 103,  26, 103,  25, 243,  31, 243,  30,  26,  31, 146,  31, 197,  31, 230,  31, 230,  30, 230,  29, 230,  28, 252,  31, 120,  31, 120,  30,  74,  31, 217,  31,  90,  31,  90,  30,  90,  29,  90,  28,  90,  27,  98,  31,  98,  30,  98,  29,  98,  28, 193,  31, 193,  30, 193,  29,  64,  31,  38,  31,  38,  30,  38,  29,  67,  31,  67,  30,  67,  29, 106,  31, 117,  31, 187,  31, 187,  30, 189,  31, 189,  30,  30,  31,  30,  30,  30,  29,  30,  28,  30,  27,  30,  26,  30,  25,  30,  24,  30,  23, 133,  31, 133,  30, 133,  29, 116,  31, 116,  30, 116,  29, 116,  28, 116,  27, 116,  26,  25,  31,  25,  30,  25,  29,  25,  28,  25,  27,  25,  26, 107,  31, 230,  31, 230,  30, 230,  29, 230,  28, 230,  27, 230,  26, 197,  31, 165,  31, 119,  31, 119,  30, 119,  29, 119,  28, 119,  27, 119,  26, 119,  25, 239,  31, 239,  30, 239,  29, 138,  31, 138,  30, 191,  31, 191,  30, 191,  29, 191,  28, 191,  27, 105,  31, 105,  30, 105,  29, 170,  31, 170,  30,  19,  31,  19,  30,  19,  29,  19,  28,  19,  27,  19,  26,  19,  25,  19,  24,  19,  23, 170,  31,  30,  31,  30,  30,  50,  31,  50,  30,  50,  29,  37,  31,  37,  30,  37,  29,  37,  28, 149,  31, 149,  30, 149,  29, 149,  28, 141,  31, 189,  31, 189,  30,  64,  31,  64,  30,  64,  29,  64,  28,  64,  27,  64,  26,  64,  25, 185,  31, 185,  30, 185,  29, 213,  31, 118,  31, 118,  30, 118,  29,  21,  31,  21,  30, 246,  31, 246,  30, 246,  29, 246,  28, 246,  27);
	constant SCENARIO3_ADDRESS: integer := 7948;

	signal memory_control: std_logic := '0';
	shared variable mem_modified: integer := 0;
    shared variable count: integer := 0;

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
        count := 0;
        while tb_done /= '1' loop
            if(count=10) then
                tb_rst <= '1';
                wait for 10 ns;
                exit;
            end if;
            wait until rising_edge(tb_clk);
            count := count+1;
        end loop;
        wait for 5 ns;
        tb_start <= '0';
        wait for 5 ns;
        tb_rst <= '0';


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
        wait until rising_edge(tb_rst);
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

		assert false report "Simulation Ended! TEST PASSATO (EXAMPLE)" severity failure;
    end process;
end ExecWithReset_arch;