LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity adder8  is
GENERIC ( N : integer:=8);
PORT (
	--Cin		      :IN std_logic;  non serve
	X, Y		      :IN signed(N-1 downto 0);
	S		      :BUFFER signed(N-1 downto 0);
	Cout, Overflow        :OUT std_logic
      );
end adder8;

architecture struc of adder8 is 
signal c    	: std_logic_vector(N downto 0);
component fulladd
port ( 
	    Cin, a, b 		:in std_logic;
	    sum, Cout		:out std_logic
	  );
end component;

begin
c(0)<='0'; --setto  a 0 il primo carry

G: FOR i IN 0 to N-1 generate --ciclo per sparagnare
		stage_i: fulladd PORT MAP (Cin=>c(i), a=>X(i), b=>Y(i), sum=>S(i), Cout=>c(i+1));
   end generate;

Cout<=c(N); --lego ultimo signal al carry di uscita

Overflow<=c(N) xor X(N-1) xor Y(N-1) xor S(N-1); --condizione overflow
    
end struc;	
