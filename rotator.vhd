----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:29 11/19/2013 
-- Design Name: 
-- Module Name:    rotator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rotator is
    Port ( opr_in : in  STD_LOGIC_VECTOR (3 downto 0);
           opr_out : out  STD_LOGIC_VECTOR (3 downto 0);
           ror_val : in  STD_LOGIC_VECTOR (1 downto 0));
end rotator;

architecture Behavioral of rotator is

begin

process(opr_in,ror_val)
begin
	case (ror_val) is
		when "01" => opr_out <=opr_in(2 downto 0) & opr_in(3);
		when "10" => opr_out <=opr_in(1 downto 0) & opr_in(3 downto 2);
		when "11" => opr_out <=opr_in(0) & opr_in(3 downto 1);
		when others => opr_out <=opr_in;
	end case;
end process;

end Behavioral;

