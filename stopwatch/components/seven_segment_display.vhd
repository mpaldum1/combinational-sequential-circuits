----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:  
-- Design Name: 
-- Module Name:    seven_segment_display - Behavioral 
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
use ieee.numeric_std.all;

entity seven_segment_display is
    Port ( fclk   : in  STD_LOGIC;
           number : in  STD_LOGIC_VECTOR (3 downto 0); 
           iolist : out STD_LOGIC_VECTOR (7 downto 0));
end seven_segment_display;

	architecture Behavioral of seven_segment_display is

begin
    process(fclk)
	 
	begin
		if rising_edge(fclk) then
		
			case number is
				 when x"0" => iolist <= x"81"; 		-- 0     
				 when x"1" => iolist <= x"CF"; 		-- 1 
				 when x"2" => iolist <= x"92";		-- 2 
				 when x"3" => iolist <= x"86";		-- 3 
				 when x"4" => iolist <= x"CC"; 		-- 4 
				 when x"5" => iolist <= x"A4"; 		-- 5 
				 when x"6" => iolist <= x"A0"; 		-- 6 
				 when x"7" => iolist <= x"8F"; 		-- 7 
				 when x"8" => iolist <= x"80"; 		-- 8     
				 when x"9" => iolist <= x"84"; 		-- 9 
				 when others => iolist <= x"FF";		-- NaN
			 end case;	
		end if;
	end process;
	
end Behavioral;



