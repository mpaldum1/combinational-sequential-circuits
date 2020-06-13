--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:20:17 04/25/2020
-- Design Name:   
-- Module Name:   C:/Users/User/Desktop/Xilinx projects/IspravkaZadace1/tb_top.vhd
-- Project Name:  IspravkaZadace1
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
use ieee.numeric_std.all; --zbog unsigned
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         dtx : OUT  std_logic;
         drx : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0);
         fclk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal drx : std_logic := '0';
   signal fclk : std_logic := '0'; 

 	--Outputs
   signal dtx : std_logic;
   signal led : std_logic_vector(7 downto 0);
	

   -- Clock period definitions

	signal wdata: std_logic_vector(7 downto  0) := "11110010";
	
	
	signal index:integer:=0;	
	
   constant fclk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          dtx => dtx,
          drx => drx,
          led => led,
          fclk => fclk
        );

   -- Clock process definitions
   fclk_process :process 
   begin
		fclk <= '0';
		wait for 10 ns;
		fclk <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process (fclk)
	
		
   begin		
      
		if rising_edge(fclk) then
			
			if(index < 8) then
				if(wdata(index) = '1') then
					drx <= '1';
				else 
					drx <= '0';
				end if;
				
			else
				drx <= '0';
				
			end if;
				
			
			index <= index + 1; -- increment	
			
		end if;
	
   end process;

END;
