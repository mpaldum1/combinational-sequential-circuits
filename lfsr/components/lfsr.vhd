----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    LSFR - Behavioral 
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

entity LFSR is
    Port ( reset, clk  : in  STD_LOGIC;
           output : out  STD_LOGIC);
end LFSR;

architecture Behavioral of LFSR is

   signal current_register, new_register : std_logic_vector(7 downto 0) := "01100101"; 
	signal change_bit: std_logic;
	constant seed: std_logic_vector(7 downto 0) := "01100101";
	
	-- inital value

begin
	
	-- register
	process(clk, reset)
	
	begin
			--reset
			if reset = '1' then
				current_register <= seed;
					
			elsif rising_edge(clk) then
					current_register <= new_register;
			end if;
			
	end process;
				
				change_bit <= current_register(1) xor (current_register(5) xor current_register(7));
				new_register <= current_register(6 downto 0) & change_bit;
				output <= current_register(4) xor current_register(7);
			
end Behavioral;

