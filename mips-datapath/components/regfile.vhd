----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:04 05/14/2019 
-- Design Name: 
-- Module Name:    REGFILE - Behavioral 
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

entity REGFILE is
 port(
	clk: in std_logic;
	control: in std_logic;
	read_address1: in std_logic_vector (4 downto 0);
	read_address2: in std_logic_vector (4 downto 0);
	write_address: in std_logic_vector (4 downto 0);
	value: in std_logic_vector (31 downto 0);
	register_value_1: out std_logic_vector (31 downto 0);
	register_value_2: out std_logic_vector (31 downto 0)
 );
end REGFILE;

architecture Behavioral of REGFILE is

type mem_array is array(0 to 31) of std_logic_vector	(31 downto 0);			-- 32 memory locations of lenght 32
 signal data_registers: mem_array := (
		  "00000000000000000000000000000000", -- $0
        "00000000000000000000000000000000", --  $1
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", --  $10 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", -- $20
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- $30
        "00000000000000000000000000000000"
);
	-- total memory = 128 bytes = 32 rows * 4 bytes (32 bits)
begin

	 register_value_1 <= data_registers(conv_integer(unsigned(read_address1)));
    register_value_2 <= data_registers(conv_integer(unsigned(read_address2)));
	 
	 process (clk)
		begin 
			if rising_edge(clk) and write_address /= "00000" and control = '1' then
					data_registers(conv_integer(unsigned(write_address))) <= value;			
			end if;
	end process;
	 
end Behavioral;

