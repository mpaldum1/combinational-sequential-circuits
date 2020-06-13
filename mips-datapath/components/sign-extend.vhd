----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:58 05/14/2019 
-- Design Name: 
-- Module Name:    SIGNEXTEND - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIGNEXTEND is
	port(
	input: in std_logic_vector (15 downto 0);
	output: out std_logic_vector (31 downto 0)
	);
end SIGNEXTEND;

architecture Behavioral of SIGNEXTEND is

begin
	
	output <= std_logic_vector(resize(signed(input), output'length));
	
end Behavioral;

