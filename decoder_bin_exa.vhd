
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_bin_exa IS
	port 
		(
			Clock : IN std_logic;
			Q   : IN signed(3 downto 0);
			Segmenti : OUT std_logic_vector (6 downto 0)
		);
	end decoder_bin_exa;
	
architecture behavior OF decoder_bin_exa IS
	
	begin		
		set_display: process(Q)
			Begin
			
				num_0:	if ( not(Q(0)) and not(Q(1)) and not(Q(2)) and not(Q(3)) ) = '1' then
							Segmenti <= "1000000";
					
--				
				--num_0:
							elsif   ( Q(0) and not(Q(1)) and not(Q(2)) and not(Q(3)) ) = '1'  then
							Segmenti <= "1111001";
					
				--num_2:	
							elsif ( not(Q(0)) and Q(1) and not(Q(2)) and not(Q(3)) ) = '1' then
							Segmenti <= "0100100";
					
				--num_3:	
							elsif ( Q(0) and Q(1) and not(Q(2)) and not(Q(3)) ) = '1' then
							Segmenti <= "0110000";
					
				--num_4:	
							elsif ( not(Q(0)) and not(Q(1)) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "0000001";
					
				--num_5:	
							elsif ( Q(0) and not(Q(1)) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "0010010";
					
				--num_6:	
							elsif ( not(Q(0)) and Q(1) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "0000010";
					
				--num_7:	
							elsif ( Q(0) and Q(1) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "1111000";
					
				--num_8:	
							elsif ( not(Q(0)) and not(Q(1)) and not(Q(2)) and Q(3) ) = '1' then
							Segmenti <= "0000000";
					
				--num_9:	
							elsif ( Q(0) and not(Q(1)) and not(Q(2)) and Q(3) ) = '1' then
							Segmenti <= "0010000";
					
				--num_a:	
							elsif ( not(Q(0)) and Q(1) and not(Q(2)) and Q(3) ) = '1' then
							Segmenti <= "0100000";
					
				--num_b:	
							elsif ( Q(0) and Q(1) and not(Q(2)) and Q(3) ) = '1' then
							Segmenti <= "0000011";
					
				--num_c:	
							elsif ( not(Q(0)) and not(Q(1)) and Q(2) and Q(3) ) = '1' then
							Segmenti <= "0100111";
					
				--num_d:	
							elsif ( Q(0) and not(Q(1)) and Q(2) and Q(3) ) = '1' then
							Segmenti <= "0100001";
					
				--num_e:	
							elsif ( not(Q(0)) and Q(1) and Q(2) and Q(3) ) = '1' then
							Segmenti <= "0000100";
					
				--num_f:	
							else --( Q(0) and Q(1) and Q(2) and Q(3) ) = '1' then
							Segmenti <= "0001110";
				end if ;
			end process set_display;
		
end behavior;
