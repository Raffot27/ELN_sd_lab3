library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladd_8_bit is 
generic ( N : integer:=8);
port (Cin : in std_logic;
	   SW : in signed(15 downto 0);
		KEY : in std_logic_vector(1 downto 0);
	   LEDG : out std_logic_vector(8 downto 8);
		LEDR : out signed(N-1 downto 0));
	end fulladd_8_bit;

architecture structure of fulladd_8_bit is
signal c : std_logic_vector(7 downto 0);
signal sw_a, sw_b : signed(7 downto 0);
signal clk, rst : std_logic;
signal A, B : signed(N-1 downto 0); 
signal S, SUM : signed(0 to 7);
signal Cout : std_logic;

component regn 
port (R : in signed(N-1 downto 0);
Clock, Resetn : in std_logic;
U : out signed(N-1 downto 0));
end component;

component fulladd 
port (Cin , a, b : in std_logic;
       s, Cout : out std_logic );
end component;

component flipflop 
port (D, Clock, Resetn : in std_logic;
Q : out std_logic);
end component;

begin
sw_a <= SW(7 downto 0);
sw_b <= SW(15 downto 8);
clk <= KEY(1);
rst <= KEY(0);



-- full add blocco
c(0) <= '0';
stage0: fulladd port map (Cin, A(0), B(0), S(0), c(1));
stage_1 : for i in 1 to 6 generate
Adders : fulladd port map (c(i), A(i), B(i), S(i), c(i+1));
end generate;
stage8 : fulladd port map (Cin => c(7), Cout => Cout, a => A(7), b => B(7), s => S(7));
-- fine blocco full add
-- inizio portmap register e flip flop


RegA : regn port map (sw_a,  clk, rst, A); 
RegB : regn port map (sw_b, clk, rst, B);
RegU : regn port map (S, clk, rst, LEDR);
Ovfl : flipflop port map (Cout , clk, rst, LEDG(8));

end structure; 
