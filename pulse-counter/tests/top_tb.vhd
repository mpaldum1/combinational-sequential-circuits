--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:30 05/19/2020
-- Design Name:   
-- Module Name:   C:/Users/User/Desktop/VHDL Z2 - materijali/Zadaca2/top_tb.vhd
-- Project Name:  Zadaca2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.all; 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top 
    PORT(
         clk : IN  std_logic;
         delay : IN  std_logic_vector(31 downto 0);
         width : IN  std_logic_vector(31 downto 0);
			uart_signal: out unsigned (7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal delay : std_logic_vector(31 downto 0) := x"00000064";  -- 100us
   signal width : std_logic_vector(31 downto 0) :=  x"0000000F";  -- 15us
	
	signal uart_signal: unsigned (7 downto 0);

   -- Clock period definitions
   constant clk_period: time := 1 us / 50;	--50MHz
  
BEGIN 
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          clk => clk,
          delay => delay,
          width => width,
			 uart_signal => uart_signal
        );
		  
		 
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	sim_process: process
	begin
	
		wait for 200 us;
		
	end process;
	
	
END;
