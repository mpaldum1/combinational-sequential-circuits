----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:35:30 05/10/2019 
-- Design Name: 
-- Module Name:    MEMORYINSTRUCTION - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMORYINSTRUCTION is
 port(
	clk: IN std_logic;
	read_memory_address: IN std_logic_vector(31 downto 0);
	read_memory_data: OUT std_logic_vector(31 downto 0)
	);
end MEMORYINSTRUCTION;

architecture Behavioral of MEMORYINSTRUCTION is
 type mem_array is array(0 to 31) of std_logic_vector	(31 downto 0);			-- 32 memory locations of lenght 32
 signal data_mem: mem_array := (
		  "00000000000000000000000000000001", -- memory initialization
        "00000000000000000000000000000010", --  1
        "00000000000000000000000000000100",
        "00000000000000000000000000001000",
        "00000000000000000000000000010000",
        "00000000000000000000000000100000",
        "00000000000000000000000001000000",
        "00000000000000000000000010000000",
        "00000000000000000000000100000000",
        "00000000000000000000001000000000", 
        "00000000000000000000010000000000", --  10 
        "00000000000000000000100000000000", 
        "00000000000000000001000000000000",
        "00000000000000000010000000000000",
        "00000000000000010100000000000000",
        "00000000001100000000000000000000",
        "00000000000000000000000000000000",
        "00000001100000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", -- 20
        "00000000000000000000000000000000",
        "00000011000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- 30
        "11100000000000000000000000000000"
);
	-- total memory = 128 bytes = 32 rows * 4 bytes (32 bits)
 
begin

process (clk) begin
	if rising_edge(clk) then
	read_memory_data <= data_mem(conv_integer(read_memory_address));
	end if;
end process;
end Behavioral;

--