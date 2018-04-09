library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity product is
port ( a0, a1, a2, a3 : in std_logic;
       b0, b1, b2, b3 : in std_logic;
       p0, p1, p2, p3, p4, p5, p6, p7 : out std_logic);
end product;

architecture struct of product is
signal cin, cout0, cout1, cout2, cout3, s1, s2, s3 : std_logic;
signal cout4, cout5, cout6, cout7, cout8, cout9, cout10, cout11 :std_logic;
signal u3, u4, u5 : std_logic;
component fulladd
port (
		Cin, a, b 	:in std_logic;
	        sum, Cout	:out std_logic
      );
		end component;
begin
cin <= '0';
p0 <= (b0 and a0);
F1 : fulladd port map (cin, (a1 and b0), (a0 and b1), p1, cout0);
F2 : fulladd port map (cout0, (a2 and b0), (a1 and b1), s1, cout1);
F3 : fulladd port map (cout1, (a3 and b0), (a2 and b1), s2, cout2);
F4 : fulladd port map (cout2, cin, (a3 and b1), s3, cout3);

F5 : fulladd port map (cin, s1, (a0 and b2), p2, cout4);
F6 : fulladd port map (cout4, s2, (a1 and b2), u3, cout5);
F7 : fulladd port map (cout5, s3, (a2 and b2), u4, cout6);
F8 : fulladd port map (cout6, cout3, (a3 and b2), u5, cout7);

F9 : fulladd port map (cin, u3, (a0 and b3), p3, cout8);
F10 : fulladd port map (cout8, u4, (a1 and b3), p4, cout9);
F11 : fulladd port map (cout9, u5, (a2 and b3), p5, cout10);
F12 : fulladd port map (cout10, cout7, (a3 and b3), p6, p7);
end struct;
