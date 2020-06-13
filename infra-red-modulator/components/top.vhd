----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    top - Behavioral -- IR moduldator
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( fclk : in  STD_LOGIC;
           tsone : in  STD_LOGIC_VECTOR (31 downto 0);
           tsoneH : in  STD_LOGIC_VECTOR (31 downto 0);
           tzero : in  STD_LOGIC_VECTOR (31 downto 0);
           tzeroH : in  STD_LOGIC_VECTOR (31 downto 0);
           tp : in  STD_LOGIC_VECTOR (31 downto 0);
           data : in  STD_LOGIC_VECTOR (31 downto 0);
           tsstart : in  STD_LOGIC_VECTOR (31 downto 0);
           tsstartH : in  STD_LOGIC_VECTOR (31 downto 0);
           bflag : in  STD_LOGIC;
           eflag : out  STD_LOGIC;
			  output: inout STD_LOGIC := '0');
end top;

architecture Behavioral of top is

constant fclkFrequency : integer := 50; -- 50 MHz

begin 
	process (fclk)
	
	variable counter: integer := 31;
	variable currentBit : std_logic;
	variable halfPassed: std_logic := '0';
	variable timeCounter: integer:= 0;
	
	variable tsoneValue: integer;
	variable tszeroValue: integer;
	variable tsoneHValue: integer;
	variable tszeroHValue: integer;
	variable tsstartValue: integer;
	variable tsstartHValue: integer;
	
	variable tick: integer := 0;
	variable tpValue: integer;
	
	variable start: std_logic := '0';
	variable beginTransmission: std_logic := '0';
		 
	begin	
		
		if rising_edge(fclk) then

				tszeroValue := to_integer(signed(tzero));
				tsoneValue := to_integer(signed(tsone));
				
				tsoneHValue := to_integer(signed(tsoneH));
				tszeroHValue := to_integer(signed(tzeroH));
				
				tsstartValue := to_integer(signed(tsstart));
				tsstartHValue := to_integer(signed(tsstartH));
				
				tpValue := to_integer(signed(tp));
				tick := tick + 1;
				
					
			if bflag = '1' then			-- start transmission
				beginTransmission := '1';
				eflag <= '0';
			end if;
			
			if beginTransmission = '1' then
					if start = '0' then
						counter := 31;
						-- send start bit
						
						if tick = fclkFrequency then		-- 1 us passed	
								tick := 0;

									if timeCounter < tsstartHValue then

										if (timeCounter mod (tpValue / 2))= 0 then
											output <=  not output;
										end if;	
									else 
										output <= '0';
									end if;				
															
									timeCounter := timeCounter + 1;
								
									if timeCounter = tsstartValue  then
										timeCounter := 0;
										start := '1';
									end if;			
							end if;
				
					elsif counter >= 0 then
					-- send data bits			
									
					-- take current data bit to be sent
					currentBit := data(counter);
					
					if currentBit = '1' then
					-- data bit is 1  --> generate tsone signal
											
						if tick = fclkFrequency then		-- 1 us passed	
								tick := 0;
								if timeCounter < tsoneHValue then

									if (timeCounter mod (tpValue / 2))= 0 then
										output <=  not output;
									end if;	
							
								else 
									output <= '0';
								end if;							
									
								timeCounter := timeCounter + 1;
								
								if timeCounter = tsoneValue  then
									counter := counter - 1;
									timeCounter := 0;
								end if;			
						end if;
				 else 
				-- data bit is 0 generate tszero signal
				
						if tick = fclkFrequency then		-- 1 us passed	
							tick := 0;
							
								if timeCounter < tszeroHValue then
									if (timeCounter mod (tpValue/2))= 0 then
										output <=  not output;
									end if;
								else 
									output <= '0';
								end if;												
							timeCounter := timeCounter + 1;
							
								if timeCounter = tszeroValue  then
									counter := counter - 1;
									timeCounter := 0;
								end if;		
							end if;
					end if;
							
						if counter = -1 then			
						-- transmission end 
							eflag <= '1';
							beginTransmission := '0';							
								
						end if;	
					end if;		
				end if;	
		end if; 
	end process;

end Behavioral;

