----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:05 05/19/2019 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

entity ALUControl is
port (
	ALUOp: in std_logic_vector(1 downto 0);
	funct: in std_logic_vector(5 downto 0);
	result: out std_logic
);
end ALUControl;

architecture Behavioral of ALUControl is

-- na mips oglednoj arhitekuri funct biti od ADD instrukcije su 100000, a SUB 

begin												
	p_aluControl: process(ALUOp, funct)
	begin
		if((funct = "100000" and ALUOp = "10") or ALUOp = "00") then
			result <= '0';
		else 	result <= '1';	
		end if;
	end process;	
end Behavioral;


