LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity fulladd is 
port (
		Cin, a, b 	:in std_logic;
	   sum, Cout	:out std_logic
	   );
end fulladd;

architecture structure of fulladd is
signal sel		:std_logic;
begin
   sel<= a xor b;
	sum<= Cin xor sel;
	Cout<= (sel and Cin) or ( not(sel) and b);
end structure;	
