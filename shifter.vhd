library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
    Port ( opr_in : in  STD_LOGIC_VECTOR (3 downto 0);
           shift_val : in  STD_LOGIC_VECTOR (1 downto 0);
           shift_dir : in  STD_LOGIC;
           opr_out : out  STD_LOGIC_VECTOR (3 downto 0));
end shifter;

architecture Behavioral of shifter is

signal temp0,temp1:std_logic_vector(3 downto 0);
begin

opr_out<=temp1 when shift_dir='1' else temp0;

process(opr_in,shift_val)
begin
	case(shift_val) is
	when "01" => temp0<=opr_in(2 downto 0) & '0';
					 temp1<='0' & opr_in(3 downto 1);
	when "10" => temp0<=opr_in(1 downto 0) & "00";
					 temp1<="00" & opr_in(3 downto 2);
	when "11" => temp0<=opr_in(0) & "000";
					 temp1<="000" & opr_in(3);
	when others => temp0<=opr_in;
					 temp1<=opr_in;
	end case;
end process;
end Behavioral;

