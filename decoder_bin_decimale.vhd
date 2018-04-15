library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_bin_decimale IS
	port 
		(
			Clock : IN std_logic;
			Q   : IN unsigned(3 downto 0);
			Segmenti : OUT unsigned (6 downto 0)
		);
	end decoder_bin_decimale;
	
architecture behavior OF decoder_bin_decimale IS
	
	begin		
		set_display: process(Q)
			Begin
			
				num_0:	if  Q = "0000" then
				--if				not(Q(0)) and not(Q(1)) and not(Q(2)) and not(Q(3)) ) = '1' then
							Segmenti <= "1000000";
					
--				
				--num_0:
							elsif   Q = "0001"  then
							--elsif Q(0) and not(Q(1)) and not(Q(2)) and not(Q(3)) ) = '1'  then
							Segmenti <= "1111001";
					
				--num_2:	
							elsif Q="0010"  then
						--elsif not(Q(0)) and Q(1) and not(Q(2)) and not(Q(3)) ) = '1' then
							Segmenti <= "0100100";
					
				--num_3:	
							elsif  Q= "0011" then
							--elsif Q(0) and Q(1) and not(Q(2)) and not(Q(3)) ) = '1' then
							Segmenti <= "0110000";
					
				--num_4:	
							elsif  Q= "0100" then
							--elsif not(Q(0)) and not(Q(1)) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "0000001";
					
				--num_5:	
							elsif Q= "0101"  then
							--elsif Q(0) and not(Q(1)) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "0010010";
					
				--num_6:	
							elsif Q= "0110"  then
							--elsif not(Q(0)) and Q(1) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "0000010";
					
				--num_7:	
							elsif  Q= "0111"  then
						--elsif	Q(0) and Q(1) and Q(2) and not(Q(3)) ) = '1' then
							Segmenti <= "1111000";
					
				--num_8:	
							elsif  Q= "1000"  then
						--elsif	not(Q(0)) and not(Q(1)) and not(Q(2)) and Q(3) ) = '1' then
							Segmenti <= "0000000";
					
				--num_9:	
							elsif Q= "1001"  then
						--elsif	Q(0) and not(Q(1)) and not(Q(2)) and Q(3) ) = '1' then
							Segmenti <= "0010000";
					
				end if ;
			end process set_display;
		
end behavior;
