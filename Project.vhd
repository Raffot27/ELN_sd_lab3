library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interfc is
generic ( N : integer:=8);
port(SW : in signed(15 downto 0);
     KEY : in std_logic_vector(1 downto 0);
	  LEDR : out signed(7 downto 0);
	  LEDG : out std_logic;
	  HEX0, HEX1, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0)
	  );
	  end interfc;
architecture struct of interfc is
	  
component adder8
port (   
          k   			: in std_logic_vector(1 downto 0);
   	    X, Y			:IN signed(N-1 downto 0);
          S				:BUFFER signed(N-1 downto 0);
	       Overflow 	:OUT std_logic;
		    segmenti1, segmenti2, segmenti3, segmenti4, segmenti5, segmenti6  :OUT std_logic_vector(6 downto 0)
	); 	  
	end component;
	begin
	
	Fulladder : adder8 port map (KEY, SW(15 downto 8), SW(7 downto 0), LEDR, LEDG, HEX0, HEX1, HEX4, HEX5, HEX6, HEX7 );
	end struct;