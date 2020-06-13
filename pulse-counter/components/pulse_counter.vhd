----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:26:37 05/19/2020 
-- Design Name: 
-- Module Name:    pulse_counter - Behavioral 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_counter is
    Port ( impuls : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           pulse_width : out  STD_LOGIC_VECTOR (31 downto 0):= x"00000000");
end pulse_counter;

architecture Behavioral of pulse_counter is

signal counter: integer := 0; 
signal useconds : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";	--us value

constant period: STD_LOGIC_VECTOR(31 downto 0):=  x"00000014"; -- 20us is the time period for 50MHz clk frequecy


begin
process(clk, impuls)
	begin
		
		if rising_edge (impuls) then --start of shot
			useconds  <= std_logic_vector(unsigned(useconds)  + x"00000001");	
			pulse_width <= useconds;
		end if;
					
		if counter = 50 then	-- 50 MHz
			useconds  <= std_logic_vector(unsigned(useconds)  + x"00000001");	
			pulse_width <= useconds;
			counter <= 0;
		end if;
		
			if rising_edge(clk) and (impuls = '1') then
			counter <= counter + 1;
			end if;
			
	end process;
	
	
	
end Behavioral;

