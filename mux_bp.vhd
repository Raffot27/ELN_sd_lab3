library ieee;
use ieee.std_logic_1164.all;

entity mux_bp is 
port ( a, b	:IN std_logic;
       skip  :IN std_logic;
       Cout			:OUT std_logic );
		 
end mux_bp;

architecture stru of mux_bp is

begin
  Cout<=( a and not skip) or (b and  skip);
   
end stru;
       
        