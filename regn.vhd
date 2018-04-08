LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY reg_n IS
GENERIC ( N : integer:=8);
PORT (
		R 					: IN SIGNED(N-1 DOWNTO 0);
      Clock, Resetn  : IN STD_LOGIC;
      Q 					: OUT SIGNED(N-1 DOWNTO 0)
		);
END reg_n;

ARCHITECTURE Behavior OF reg_n IS
BEGIN
 PROCESS (Clock, Resetn)
  BEGIN
	IF (Resetn = '0') THEN
		Q <= (OTHERS => '0');
	 ELSIF (Clock'EVENT AND Clock = '1') THEN
		Q <= R;
	 END IF;
   END PROCESS;
END Behavior;