library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity product is
port ( a0, a1, a2, a3 : in std_logic;
       b0, b1, b2, b3, b4 : in std_logic;
       p0, p1, p2, p3, p4, p5, p6, p7 : out std_logic);
end product;

architecture struct of product is
signal cin, cout, s : std_logic;
component fulladd
port (
		Cin, a, b 	:in std_logic;
	        sum, Cout	:out std_logic
      );
		end component;
begin
cin <= '0';
p0 <= (b0 and a0);
F1 : fulladd port map (cin, (a1 and b0), (a0 and b1), p1);
F2 : fulladd port map (cout, (a2 and b0), (a1 and b1), s);
F3 : fulladd port map (cout, (a3 and b0), (a2 and b1), s);
F4 : fulladd port map (cin, cin, (a3 and b1), s);
end struct;