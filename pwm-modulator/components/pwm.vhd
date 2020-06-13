----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:48 04/26/2020 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
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

entity pwm is
	port(
			ipin: out std_logic := '0';
			iclk: in std_logic;
			iduty: in unsigned (31 downto 0) := x"00000000";
			ifreq: in unsigned (31 downto 0) := x"00000000");
end pwm;

architecture a_pwm of pwm is
signal cnt: unsigned (31 downto 0) := x"00000000";

begin
	process
	begin
		if iclk'event and iclk='1' then
			if cnt<iduty then
				cnt<=cnt+1;
				ipin<='1';
			elsif cnt<ifreq then
					cnt<=cnt+1;
					ipin<='0';
			else
					cnt<=x"00000000";
					ipin<='0';
			end if;
	end if;
end process;

end a_pwm;

