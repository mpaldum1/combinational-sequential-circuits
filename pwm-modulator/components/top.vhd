----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:41 04/26/2020 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
	port ( dtx : out std_logic;	-- uart tx pin	
			 drx : in std_logic;		-- uart rx pin	
			 led: out std_logic_vector (7 downto 0) := x"00";
			 fclk: in  std_logic 	-- fpga clock pin
	);	 	
end top;

architecture Behavioral of top is

component pwm
	port( ipin: out std_logic := '0';
			iclk: in std_logic;
			iduty: in unsigned (31 downto 0) := x"00000000";
			ifreq: in unsigned (31 downto 0) := x"00000000");
			
end component;


begin

pwm_zad1: pwm port map (fclk => fclk,
								  wdata => wdata,
								  rdata => rdata,
								  tx => dtx,
								  rx => drx,
								  wi => wi,
								  wc => wc,
								  rc => rc);


end Behavioral;

