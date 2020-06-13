----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:31 04/25/2020 
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

component uart
	port( fclk: in std_logic;
			wdata: in unsigned (7 downto 0);
			rdata: out unsigned (7 downto 0);
			tx: out std_logic;
			rx: in std_logic;
			wi: in std_logic;
			wc: out std_logic;
			rc: out std_logic);
			
end component;

signal wdata: unsigned (7 downto 0);
signal rrdata: unsigned (7 downto 0);
signal rc: std_logic;
signal wc: std_logic;
signal wi: std_logic := '1';

begin

uart_zad1: uart port map (fclk => fclk,
								  wdata => wdata,
								  rdata => rrdata,
								  tx => dtx,
								  rx => drx,
								  wi => wi,
								  wc => wc,
								  rc => rc);

uart_rx: process (fclk, rc)

	begin
	
	if rising_edge(rc) then
		wdata <= rrdata;
	end if;
	
	if rising_edge(fclk) then	
			
			if ((rrdata >= X"41")  and (rrdata <= x"5A")) then
						wdata <= rrdata + x"20";
				elsif ( (rrdata >= x"61" ) and (rrdata <= x"7A" )) then
						wdata <= rrdata - x"20";
				else 
						wdata <= rrdata; 
				end if;	
	
			end if;
	
end process;


end Behavioral;
