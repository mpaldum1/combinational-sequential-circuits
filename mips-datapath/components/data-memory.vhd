----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:56 05/20/2019 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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

entity DataMemory is
port(
	clk: in std_logic;
	dataAddress: in std_logic_vector(31 downto 0);
	memRead: in std_logic;
	dataValue: in std_logic_vector(31 downto 0);
	memWrite: in std_logic;
	outputValue: out std_logic_vector(31 downto 0):= x"00000000"
);
end DataMemory;

architecture Behavioral of DataMemory is

type memory_64 IS ARRAY(63 downto 0) of std_logic_vector(31 downto 0);
	SIGNAL data_mem : memory_64 := (
		x"00000000", x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",
		x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000", x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",
		x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000", x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",
		x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000", x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",
		x"00000000",x"00000000",x"00000000",x"00000000",x"00000000"
);

begin
	process(clk)
		begin
			if rising_edge(clk) then
				if (memRead = '1') then
					outputValue <= data_mem(conv_integer(unsigned(dataAddress(4 downto 0)))); 
					-- kako imamo 64 raspolozive lokacije, ogranicavamo adrese
				end if;
				if (memWrite = '1') then
					data_mem(conv_integer(unsigned(dataAddress(4 downto 0)))) <= dataValue;
				end if;
			end if;		
	end process;
end Behavioral;

