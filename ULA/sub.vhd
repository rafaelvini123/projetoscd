library ieee;
use ieee.std_logic_1164.all;
entity sub is
port
(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	wi: in std_logic;
	wo: out std_logic;
	Co: out std_logic;
	S: out std_logic_vector(3 downto 0)
);
end sub;
architecture sub of sub is
begin
	process (A,B,wi)
	variable temp: std_logic_vector(3 downto 0);
	variable w: std_logic;
	begin
		w:=wi;
		
		temp(0) := A(0) xor B(0) xor w;
		w:=(w and (not(A(0) xor B(0)))) or (not(A(0)) and B(0));
		
		temp(1) := A(1) xor B(1) xor w;
		w:=(w and (not(A(1) xor B(1)))) or (not(A(1)) and B(1));
		
		temp(2) := A(2) xor B(2) xor w;
		w:=(w and (not(A(2) xor B(2)))) or (not(A(2)) and B(2));
		
		temp(3) := A(3) xor B(3) xor w;
		w:=(w and (not(A(3) xor B(3)))) or (not(A(3)) and B(3));
		
		wo <= w;
		S <= temp;
		Co<='1';
	end process;
end sub;