--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date: 
-- Design Name:   
-- Module Name:   
-- Project Name: 
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Timer
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- USE ieee.numeric_std.ALL;
 
ENTITY Timer_testbench IS
END Timer_testbench;
 
ARCHITECTURE behavior OF Timer_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Timer
    PORT(
         clk : IN  std_logic;
         delay : IN  std_logic_vector(31 downto 0);
         width : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    
	-- Set up clock for testing
   constant clkFrequencyMHz : integer := 50; -- 50 MHz
   constant period       : time := 1 us / clkFrequencyMHz;
	-- FPGA impuls is 50 MHz

   --Inputs
   signal clk : std_logic := '0';
   signal delay : std_logic_vector(31 downto 0) := (others => '0');
   signal width : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Timer
		  PORT MAP (
          clk => clk,
          delay => delay,
          width => width,
          output => output
        );

   -- clk process definitions
   clk <= not clk after period / 2;

   -- Stimulus process
   stim_proc: process
	
   begin		
   		
		delay <= x"00000064";  -- 100us
		width <= x"00000032";  -- 50us
		
      wait for 20 us;	
		
		ASSERT (output = '0') report "Error!" severity error;
		wait for 100 us;
		
		ASSERT (output = '1') report "Error, one shot mode missed time frame" severity error;	
		wait for 60 us;
		
		ASSERT (output = '0') report "Error, impuls width incorrect value!" severity error;

      wait;
   end process;

END;
