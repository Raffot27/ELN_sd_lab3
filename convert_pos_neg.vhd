library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity convert_pos_neg is 
	generic ( N : integer:=8);
	
	port
		(
			B		:IN signed(N-1 downto 0);
			B_neg				:Out signed(N-1 downto 0)
		);
	end convert_pos_neg;
	
architecture behavior of convert_pos_neg is
	signal temp : signed(N-1 downto 0);
		
		begin
			temp <= not B;
			B_neg   <= temp + 1;
		
end behavior;
