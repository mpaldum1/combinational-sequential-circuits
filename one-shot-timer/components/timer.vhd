----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    Timer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Timer is

     Port ( clk   : in  STD_LOGIC;
    		  delay : in  STD_LOGIC_VECTOR (31 downto 0);
           width : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC := '0');
end Timer;

architecture Behavioral of Timer is
	
	signal period_counter: STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	-- Counter
	signal counter : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	-- One shot mode
	signal shot: STD_LOGIC := '0';
	signal done : STD_LOGIC := '0'; 
	
	constant clkFrequencyMHz : integer := 50; -- 50 MHz

	
begin
	process(clk)
	begin
		if falling_edge(clk) and shot = '0' then
		
			-- No width?
			if width = x"00000000" then
				output  <= '0';
			end if;
				
			-- No delay?
			if delay = x"00000000" then
				done <= '1'; 
				output  <= '1';
			end if;
		
			if  clkFrequencyMHz = conv_integer(unsigned(period_counter))+ 2 then 
			
				period_counter <= x"00000000";	-- reset
				counter <= counter + 1;
				
				if counter = delay and done = '0' then
					
					-- start shot
					counter  <= x"00000000";
					output  <= '1';
					done <= '1';
					
				end if;
				
				if counter = width and done = '1' then
					
					--end shot 
					output <= '0';
					shot <= '1'; 
				end if;
				
			else 
			
				period_counter <= period_counter + 1;
			
			end if;
		
		end if;
	end process;
end Behavioral;