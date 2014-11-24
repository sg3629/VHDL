library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( opcode : in  STD_LOGIC_VECTOR (15 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0);
           zf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

component Decoder
	port( command : in std_logic_vector(7 downto 0);
			operand2 : in std_logic_vector ( 3 downto 0);
			clk,reset : in std_logic;
			exec_code:out std_logic_vector(2 downto 0);
			operand2_out : out std_logic_vector ( 3 downto 0));
	end component;
	
component ExecUnit1

port( operand1,operand2:in std_logic_vector(3 downto 0);
		exec_code:in std_logic_vector(2 downto 0);
		clk,reset:in std_logic;
		result:out std_logic_vector(3 downto 0);
		zflag:out std_logic);
		

end component;
signal opr2:std_logic_vector(3 downto 0);
signal exec_code:std_logic_vector(2 downto 0);
begin

dec:Decoder port map (opcode (15 downto 8), opcode(3 downto 0), clk,rst,exec_code,opr2);
exec:ExecUnit1 port map (opcode(7 downto 4),opr2,exec_code,clk,rst,result,zf);
end Behavioral;

