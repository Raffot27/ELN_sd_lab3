library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder8 is 
generic ( N : integer:=8);
port (      --Cin : in std_logic;
	    --SW : in signed(15 downto 0);
	    --KEY : in std_logic_vector(1 downto 0);
	    --LEDG : out std_logic_vector(8 downto 8);
	    --LEDR : out signed(N-1 downto 0));
	     --Cout :OUT std_logic;
            k   	: in std_logic_vector(1 downto 0);
   	    X, Y	:IN signed(N-1 downto 0);
            S		:BUFFER signed(N-1 downto 0);
	    Overflow 	:OUT std_logic
	);
	end adder8;

architecture structure of adder8 is
-- segnale per i carry
signal c 	  	: std_logic_vector(N downto 0);
-- segnali per i flip flops	
signal sw_a, sw_b 	: signed(N-1 downto 0);
signal clk, rst, oflow   : std_logic;
signal A, B 	  	: signed(N-1 downto 0); 
signal sig, SUM     	: signed(N-1 downto 0);

component reg_n 
port (			R 	      		: in signed(N-1 downto 0);
			Clock, Resetn 	        : in std_logic;
			Q 	      		: out signed(N-1 downto 0));
end component;

component fulladd 
port (	Cin , a, b 	: in std_logic;
        sum, Cout 	: out std_logic );
end component;

component flipflop 
port (	                D, Clock, Resetn 	: in std_logic;
			Q 		        : out std_logic );
end component;

begin
--sw_a <= SW(7 downto 0);   -- NON SERVONO ORA
--sw_b <= SW(15 downto 8);
--clk <= KEY(1);
--rst <= KEY(0);    
	
--riassegnamento fatto da Raffo
clk<=k(1);
rst<=k(0);


-- full add blocco
c(0) <= '0';  --il primo carry inizializzato a 0

--stage0: fulladd port map (Cin, A(0), B(0), S(0), c(1));
--stage_1 : for i in 1 to 6 generate
--Adders : fulladd port map (c(i), A(i), B(i), S(i), c(i+1));
--end generate;
--stage8 : fulladd port map (Cin => c(7), Cout => Cout, a => A(7), b => B(7), s => S(7));

FA0: FOR i IN 0 to N-1 generate --ciclo generate
      adders: fulladd PORT MAP (Cin=>c(i), a=>A(i), b=>B(i), sum=>SUM(i), Cout=>c(i+1));
   end generate;
-- fine blocco full add


--condizione di overflow data al segnale che poi entrerà nel ff di overflow
oflow<=c(N) xor X(N-1) xor Y(N-1) xor S(N-1); 


--nportmap register e flip flop
RegA : reg_n port map (X,  clk, rst, A); 
RegB : reg_n port map (Y, clk, rst, B);
RegU : reg_n port map (SUM, clk, rst, S);
Ovfl : flipflop port map (oflow, clk, rst, Overflow);

end structure; 

