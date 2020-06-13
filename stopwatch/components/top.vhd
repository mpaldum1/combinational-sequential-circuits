----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( fclk       : in  STD_LOGIC;
           beg_number : in  STD_LOGIC_VECTOR (7 downto 0);
           pause      : in  STD_LOGIC_VECTOR (11 downto 0); -- in us
           bflag      : in  STD_LOGIC;
           eflag      : inout  STD_LOGIC;
    		  f_digit  : out STD_LOGIC_VECTOR (7 downto 0);
			  s_digit : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

	-- Component
	component seven_segment_display is
		Port ( fclk   : in  STD_LOGIC;
             number : in  STD_LOGIC_VECTOR (3 downto 0);
				 iolist : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal first_digit  : STD_LOGIC_VECTOR (3 downto 0) := x"0"; -- left digit
	signal second_digit : STD_LOGIC_VECTOR (3 downto 0) := x"0"; -- right digit

begin

	first  : seven_segment_display port map (fclk => fclk, number => first_digit,  iolist => f_digit);
	second : seven_segment_display port map (fclk => fclk, number => second_digit, iolist => s_digit);

	process(fclk)
	
		variable timeCounter : integer:=0; -- us
		variable tick   : integer:=0; 
		variable startNumber    : integer:=0;
		variable period  : integer:=0; -- pause
		
	begin
	
		if rising_edge(fclk) then
			if bflag = '1' and eflag = '1' then 
				-- start stopwatch		
	
				startNumber := to_integer(unsigned(beg_number));
				period  := to_integer(unsigned(pause));

				if startNumber < 100 then
					-- start stopwatch only if all digits can be shown
					
					first_digit <= std_logic_vector(to_unsigned(startNumber/10, 4));
					second_digit  <= std_logic_vector(to_unsigned(startNumber mod 10, 4));
					
					timeCounter := 0;
					tick  := 0;	
					eflag <= '0';
					
				end if;
				
			end if;
			
			if startNumber > 0 then
				-- count down
				tick := tick + 1;
			
				if tick = 50 then 			-- 50 MHz
					tick:= 0;
					timeCounter:= timeCounter + 1;
					
					if timeCounter = period then 
						-- decrement counter
						startNumber := startNumber - 1;
						
						first_digit <= std_logic_vector(to_unsigned(startNumber/10, 4));
						second_digit  <= std_logic_vector(to_unsigned(startNumber mod 10, 4));
						timeCounter := 0;
						
					end if;
				end if;
			else
				-- time dropped to 0
				eflag <= '1';
			end if;

		
		end if;
	end process;

end Behavioral;


