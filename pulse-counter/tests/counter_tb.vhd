--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:33:53 05/19/2020
-- Design Name:   
-- Module Name:   C:/Users/User/Desktop/VHDL Z2 - materijali/Zadaca2/test.vhd
-- Project Name:  Zadaca2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pulse_counter
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
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_counter
    PORT(
         impuls : IN  std_logic;
         clk : IN  std_logic;
         pulse_width : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal impuls : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal pulse_width : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period: time := 1 us / 50;	--50MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_counter PORT MAP (
          impuls => impuls,
          clk => clk,
          pulse_width => pulse_width
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
  
      wait for 100 ns;	
		impuls <= '1';
		
		wait for 77 us;
		impuls <= '0';


      wait;
   end process;

END;
