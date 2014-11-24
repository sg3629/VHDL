library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder is
	port( X_in,Y_in: in std_logic_vector(3 downto 0);
		C_in:in std_logic;
		Sum_out : out std_logic_vector(3 downto 0));
end Adder;

architecture Structural of Adder is
	
	component FullAdder
		port(A_in,B_in,C_in:in std_logic;
		S_out,C_out:out std_logic);
	end component;
  
	signal signal_c:std_logic_vector(4 downto 0);
  
	begin
    signal_c(0)<=C_in;
    adderloop:for i in 3 downto 0 generate
		fa:FullAdder port map(X_in(i),Y_in(i),signal_c(i),Sum_out(i),signal_c(i+1));
	end generate adderloop;
end Structural;
