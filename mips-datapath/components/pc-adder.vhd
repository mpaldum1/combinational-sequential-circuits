----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:21:39 05/10/2019 
-- Design Name: 
-- Module Name:    PCADDER - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCADDER is
port (
		current_address: IN STD_LOGIC_VECTOR(31 downto 0);
		next_address: OUT STD_LOGIC_VECTOR(31 downto 0)
		);
		
end PCADDER;

architecture Behavioral of PCADDER is

begin
	next_address <= current_address + "0000000000000000000000000000100";
end Behavioral;

