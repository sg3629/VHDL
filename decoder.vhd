library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Decoder is
	port( command : in std_logic_vector(7 downto 0);
			operand2 : in std_logic_vector ( 3 downto 0);
			clk,reset : in std_logic;
			exec_code:out std_logic_vector(2 downto 0);
			operand2_out : out std_logic_vector ( 3 downto 0));
	end entity;
	
architecture Behavourial of Decoder is

constant exor_not:std_logic_vector(2 downto 0):="000";
constant and_c:std_logic_vector(2 downto 0):="001";
constant or_c:std_logic_vector(2 downto 0):="010";
constant shift:std_logic_vector(2 downto 0):="011";
constant rotate:std_logic_vector(2 downto 0):="110";
constant add:std_logic_vector(2 downto 0):="100";
constant sub:std_logic_vector(2 downto 0):="101";
constant nothing:std_logic_vector(2 downto 0):="111";



constant compare:std_logic_vector(2 downto 0):="101";
begin

process(reset,clk)
begin


	if reset='1' then
		exec_code<=nothing;
		operand2_out<="1111";
	elsif rising_edge(clk) then
		case (command(7 downto 4)) is
			when "0000"  => 		operand2_out<="1111";
										exec_code<=exor_not;
			when "0001" =>			operand2_out<=operand2;
										exec_code<=and_c;
			when "0010" =>			operand2_out<=operand2;
										exec_code<=or_c;
			when "0011" =>			operand2_out<=operand2;
										exec_code<=exor_not;
										
			when "0100" =>			operand2_out<="00" & command(1 downto 0);
										exec_code<=shift;
			when "0101" =>			operand2_out<="01" & command(1 downto 0);
										exec_code<=shift;
										
			when "0110" =>			operand2_out<="00" & command(1 downto 0);
										exec_code<=rotate;
			when "0111" =>			operand2_out<="00" & ("00" - command(1 downto 0));
										exec_code<=rotate;
			when "1000" =>			operand2_out<="0001";
										exec_code<=add;
			when "1001" =>			operand2_out<="1111";
										exec_code<=add;
			when "1010" =>			operand2_out<=operand2;
										exec_code<=add;
			when "1011" =>			operand2_out<=not operand2;
										exec_code<=sub;
			when "1100" => 			operand2_out<=not operand2;
										exec_code<=sub;
			when others =>			operand2_out<=operand2;
										exec_code<=nothing;
		end case;
	end if;

end process;
end architecture;
