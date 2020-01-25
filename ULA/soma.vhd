library ieee;
use ieee.std_logic_1164.all;
entity soma is
port
(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	cin: in std_logic;
	cout: out std_logic;
	Co: out std_logic;
	S: out std_logic_vector(3 downto 0)
);
end soma;
architecture soma of soma is
begin
	process (A,B,cin)
	variable temp: std_logic_vector(3 downto 0);
	variable c: std_logic;
	begin
		c:=cin;
		
		temp(0) := A(0) xor B(0) xor c;
		c:=(A(0) and B(0)) or ((A(0)xor B(0)) and c);
		
		temp(1) := A(1) xor B(1) xor c;
		c:=(A(1) and B(1)) or ((A(1)xor B(1)) and c);
		
		temp(2) := A(2) xor B(2) xor c;
		c:=(A(2) and B(2)) or ((A(2)xor B(2)) and c);
		
		temp(3) := A(3) xor B(3) xor c;
		c:=(A(3) and B(3)) or ((A(3)xor B(3)) and c);
		
		cout <= c;
		S <= temp;
		Co<='1';
	end process;
end soma;
