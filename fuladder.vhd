library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FullAdder is
		port(A_in,B_in,C_in:in std_logic;
		S_out,C_out:out std_logic);
end FullAdder;

architecture Struct of FullAdder is

signal temp :std_logic;
begin

temp<=A_in xor B_in;
S_out<=temp xor C_in;
C_out<= (A_in and B_in) or (temp and C_in);

end Struct;

