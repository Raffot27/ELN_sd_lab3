library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity flashing_digit_0_to_9 is
	generic ( dly : time :=1 sec; N : integer :=4);
	--generic ( N : integer:= 4);
	port 
		(
		Enable, CLK, reset: in std_logic; 
		Q: buffer unsigned(N-1 downto 0);
		segmenti : out unsigned (6 downto 0)		
		);
		end flashing_digit_0_to_9;
		
	architecture struct of flashing_digit_0_to_9 is
	
	component decoder_bin_decimale IS
	port 
		(
			Clock : IN std_logic;
			Q   : IN unsigned(3 downto 0);
			Segmenti : OUT unsigned (6 downto 0)
		);
	end component;
	
	begin
		process (clk, reset)
			begin 
				if (reset = '1') then
					Q <= (others => '0');
				elsif(CLK'event and CLK='1') then
					if(Enable = '1') then
                Q <= Q + 1 after dly;
					end if;
				end if;
		end process;
		
		dec_decile: decoder_bin_decimale port map (Q=>Q, clock=> clk, segmenti=> segmenti);
		
	end struct;
		