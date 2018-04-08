library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladd_8_bit is 
generic ( N : integer:=8);
port (   
          k   			: in std_logic_vector(1 downto 0);
   	    X, Y			:IN signed(N-1 downto 0);
          S				:BUFFER signed(N-1 downto 0);
	       Overflow 	:OUT std_logic;
		    segmenti1, segmenti2, segmenti3, segmenti4, segmenti5, segmenti6  :OUT std_logic_vector(6 downto 0);
			 
			 --parti aggiuntive per il punto 2 del lab
			 Add_Sub		: IN std_logic --con 0 somma   con 1 sottrae
	);
	end fulladd_8_bit;

architecture structure of fulladd_8_bit is
	-- segnale per i carry
	signal c 	  	: std_logic_vector(N downto 0);
	-- segnali per i flip flops	
	signal sw_a, sw_b 	: signed(N-1 downto 0);
	signal clk, rst, oflow   : std_logic;
	signal A, B 	  	: signed(N-1 downto 0); 
	signal sig, SUM     	: signed(N-1 downto 0);
	--segnale aggiuntivo per il punto 2 del lab
	signal B_conv,B_neg		:signed (N-1 downto 0);

	component reg_n 
	port (
				R 	      		: in signed(N-1 downto 0);
				Clock, Resetn 	: in std_logic;
				Q 	      		: out signed(N-1 downto 0));
	end component;

	component fulladd 
	port (	
				Cin , a, b 	: in std_logic;
				sum, Cout 	: out std_logic );
	end component;

	component flipflop 
	port (	
				D, Clock, Resetn 	: in std_logic;
				Q 		        		: out std_logic );
	end component;

	component decoder_bin_exa
	port 
		(
			Clock    : IN std_logic;
			Q        : IN signed(3 downto 0);
			Segmenti : OUT std_logic_vector (6 downto 0)
		);
	end component;
	
	component convert_pos_neg
	port
		(
			B		: IN signed(N-1 downto 0);
			B_neg				:OUT signed(N-1 downto 0)
		);
	end component;

	--INIZIO DESCRIZIONE
	begin    
	
		--riassegnamento fatto da Raffo
		clk<=k(1);
		rst<=k(0);

		--Operazione di conversione			
		convers: convert_pos_neg port map (B , B_neg);
		--in base al segnale cambio B
		conversione :process(Add_Sub, B_neg,B)
			begin
				if Add_Sub = '1' then
					B_conv <= B_neg;
				else
					B_conv <= B;
				end if;
			end process;
		
		
		
		-- full add blocco
		c(0) <= '0';  --il primo carry inizializzato a 0

		FA0: FOR i IN 0 to N-1 generate --ciclo generate
				adders: fulladd PORT MAP (Cin=>c(i), a=>A(i), b=>B_conv(i), sum=>SUM(i), Cout=>c(i+1));
			end generate;
		-- fine blocco full add


		--condizione di overflow data al segnale che poi entrerà nel ff di overflow
		oflow<=c(N) xor X(N-1) xor Y(N-1) xor S(N-1); 


		--nportmap register e flip flop
		RegA : reg_n port map (X,  clk, rst, A); 
		RegB : reg_n port map (Y, clk, rst, B);
		RegU : reg_n port map (SUM, clk, rst, S);
		Ovfl : flipflop port map (oflow, clk, rst, Overflow);


		--uso il primo decoder per settare i segmenti da agganciare a HEX0
		Dec_Primo_sum_display: decoder_bin_exa port map (clock=>clk, Q => S(3 downto 0), Segmenti => segmenti1);

		--uso il secondo decoder per settare i segmenti da agganciare a HEX1
		Dec_secondo_sum_display: decoder_bin_exa port map (clock=>clk, Q => S(7 downto 4), Segmenti => segmenti2);

		--uso il terzo decoder per settare i segmenti da agganciare a HEX6
		Dec_primo_x_display: decoder_bin_exa port map (clock=>clk, Q => x(3 downto 0), Segmenti => segmenti3);

		--uso il quarto decoder per settare i segmenti da agganciare a HEX7
		Dec_secondo_x_display: decoder_bin_exa port map (clock=>clk, Q => x(7 downto 4), Segmenti => segmenti4);

		--uso il quinto decoder per settare i segmenti da agganciare a HEX4
		Dec_primo_y_display: decoder_bin_exa port map (clock=>clk, Q => y(3 downto 0), Segmenti => segmenti5);

		--uso il sesto decoder per settare i segmenti da agganciare a HEX5
		Dec_secondo_y_display: decoder_bin_exa port map (clock=>clk, Q => y(7 downto 4), Segmenti => segmenti6);

end structure; 
