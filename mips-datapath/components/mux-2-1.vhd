----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:04 05/14/2019 
-- Design Name: 
-- Module Name:    MUX2_1 - Behavioral 
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

-- prepravljamo MUX2_1 kako bi bio kompatibilan i sa 32 bita koristenjem generic varijable	
entity MUX2_1 is
		generic (n: natural := 4);
	port(
	input1: in std_logic_vector (n-1 downto 0);
	input2: in std_logic_vector (n-1 downto 0);
	control_signal: in std_logic;
	output: out std_logic_vector (n-1 downto 0)
	);
end MUX2_1;

architecture Behavioral of MUX2_1 is

begin
	process (control_signal)
	begin
		if control_signal = '0' then
		output <= input1;
		else
		output <= input2;
		end if;
	end process;
end Behavioral;

