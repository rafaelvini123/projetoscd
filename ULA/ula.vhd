LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity ula is
    port
    (
			S: in std_logic_vector(2 downto 0);
			Y: BUFFER std_logic_vector(3 downto 0);
			Co: BUFFER std_logic
			
    );
end ula;
architecture behavior of ula is

component display
port
    (
      DADO : in STD_LOGIC_VECTOR(3 DOWNTO 0);
      A, B, C, D, E, F, G : out STD_LOGIC
    );
end component;

component soma
port
(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	cin: in std_logic;
	cout: out std_logic;
	S: out std_logic_vector(3 downto 0)
);
end component;

component sub 
port
(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	wi: in std_logic;
	wo: out std_logic;
	S: out std_logic_vector(3 downto 0)
);
end component;

component comp_maior 
port (  
		A:IN STD_LOGIC_VECTOR(0 to 3);
      B:IN STD_LOGIC_VECTOR(0 to 3);
      AmaiorB:OUT STD_LOGIC
		);
end component;

component comp_menor
port
(  
	A:IN STD_LOGIC_VECTOR(0 to 3);
   B:IN STD_LOGIC_VECTOR(0 to 3);
   AmenorB:OUT STD_LOGIC
);
end component;

component inversor
port 
(  
	A:IN STD_LOGIC_VECTOR(0 to 3);
   Y:OUT STD_LOGIC_VECTOR(0 to 3)
);
end component;

begin
	process(S,Y,Co)
		begin
	end process;
    
end behavior;