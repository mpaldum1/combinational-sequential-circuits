----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:50 05/19/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
port(
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	control: in std_logic;
	result: out std_logic_vector(31 downto 0)
);
end ALU;

architecture Behavioral of ALU is

signal result_temp: std_logic_vector(31 downto 0);

begin
	p_alu: process(operand1, operand2, control)
	begin
		if(control = '0') then
			result_temp <= operand1 + operand2;
		else 	result_temp <= operand1 - operand2;	
		end if;
	end process;	
	result <= result_temp;
end Behavioral;

