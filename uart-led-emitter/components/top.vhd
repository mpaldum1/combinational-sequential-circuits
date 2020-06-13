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
signal rdata: unsigned (7 downto 0);
signal rc: std_logic;
signal wc: std_logic;
signal wi: std_logic := '1';

signal l_nybble: unsigned (3 downto 0);
signal r_nybble: unsigned (3 downto 0);
signal flag :std_logic := '0'; -- koristimo za paljenje/gašenje ledica 

begin

uart_zad1: uart port map (fclk => fclk,
								  wdata => wdata,
								  rdata => rdata,
								  tx => dtx,
								  rx => drx,
								  wi => wi,
								  wc => wc,
								  rc => rc);	  


uart_tx: process (fclk, rc)


	begin
	
	if rising_edge(fclk) then
			
			-- uzimamo desni i lijevi nybble
						 l_nybble <= rdata(7 downto 4);
						 r_nybble <= rdata(3 downto 0);
						 
						 -- pripremamo flag
						 if (r_nybble = x"0") then
								flag <= '0';
						 else 
								flag <= '1';
						 end if;
						 
						 -- ukljucujemo ledice -- obrnut redoslijed zbog vektora
						 
							case l_nybble is
							
							when x"1" =>  led(7) <= flag;
							when x"2" =>  led(6) <= flag;
							when x"3" =>  led(5) <= flag;
							when x"4" =>  led(4) <= flag;
							when x"5" =>  led(3) <= flag;
							when x"6" =>  led(2) <= flag;
							when x"7" =>  led(1) <= flag;
							when x"8" =>  led(0) <= flag;
							when others => null;
						
							end case;
							
						end if;
end process;

uart_rx: process (fclk, rc)

	begin
	
	if rising_edge(rc) then
		wdata <= rdata;
	end if;
	
	if rising_edge(fclk) then	
			
			if ((rdata >= X"41")  and (rdata <= x"5A")) then
						wdata <= rdata + x"20";
				elsif ( (rdata >= x"61" ) and (rdata <= x"7A" )) then
						wdata <= rdata - x"20";
				else 
						wdata <= rdata; 
				end if;	
	
			end if;
	
end process;


end Behavioral;
