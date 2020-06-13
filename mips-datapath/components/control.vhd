----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:52 05/14/2019 
-- Design Name: 
-- Module Name:    CONTROL - Behavioral 
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

entity CONTROL is
	port (
		opcode: in std_logic_vector (5 downto 0);
		RegDst: out std_logic;
		ALUSrc: out std_logic;
		MemToReg: out std_logic;
		RegWrite: out std_logic;
		MemRead: out std_logic;
		MemWrite: out std_logic;
		Branch: out std_logic;
		ALUOp: out std_logic_vector (1 downto 0)
		);
		
end CONTROL;

architecture Behavioral of CONTROL is
begin
process (opcode)
	begin
	case opcode is
				WHEN "000000" => 				-- R tip
				RegDst        <= '1';
				ALUSrc        <= '0';
				MemToReg      <= '0';
				RegWrite      <= '1';
				MemRead       <= '0';
				MemWrite      <= '0';
				Branch        <= '0';
				ALUop         <= "10";
			WHEN "100011" => 					-- I tip  - lw
				RegDst        <= '0';
				ALUSrc        <= '1';
				MemToReg      <= '1';
				RegWrite      <= '1';
				MemRead       <= '1';
				MemWrite      <= '0';
				Branch        <= '0';
				ALUop         <= "00";
			WHEN "101011" => 					-- I tip - sw
				RegDst        <= '0';
				ALUSrc        <= '1';
				MemToReg      <= '0';
				RegWrite      <= '0';
				MemRead       <= '0';
				MemWrite      <= '1';
				Branch        <= '0';
				ALUop         <= "00";
			WHEN OTHERS => NULL; 			-- default
				RegDst        <= '0';
				ALUSrc        <= '0';
				MemToReg      <= '0';
				RegWrite      <= '0';
				MemRead       <= '0';
				MemWrite      <= '0';
				Branch        <= '0';
				ALUop         <= "00";
		END CASE;
end process;
end Behavioral;

