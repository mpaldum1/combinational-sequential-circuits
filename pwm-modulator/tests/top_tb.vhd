--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:  
-- Design Name:   
-- Module Name:   C:/Users/User/zadatak3-3/tb_zadatak3.vhd
-- Project Name:  zadatak3-3
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
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_zadatak3 IS
END tb_zadatak3;
 
ARCHITECTURE behavior OF tb_zadatak3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         ipin1 : OUT  std_logic;
         ipin2 : OUT  std_logic;
         iclk : IN  std_logic;
         iduty : IN  unsigned (31 downto 0);
         ifreq : IN  unsigned (31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iclk : std_logic := '0';
   signal iduty : unsigned(31 downto 0) := x"000061A8"; -- duty 50%
   signal ifreq : unsigned(31 downto 0) := x"0000C350";
	signal counter: integer := 0;
	
	-- 1 ms = 1 000 000 ns
	-- period 1 ciklusa sata je 20 ns -> za 1 ms treba   50 000 ciklusa sata
	-- 50 000 ciklusa sata = 0x"C350"
		
 	--Outputs
   signal ipin1 : std_logic;
   signal ipin2 : std_logic;

   -- Clock period definitions
   constant iclk_period : time := 20 ns; -- prema postavci zadatka
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          ipin1 => ipin1,
          ipin2 => ipin2,
          iclk => iclk,
          iduty => iduty,
          ifreq => ifreq
        );

   -- Clock process definitions
	
	-- 1 ciklus sata = 20ns - 50MHz
   iclk_process :process 
   begin
		iclk <= '0';
		wait for 10 ns;
		iclk <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process (ipin1)
   begin		

		if rising_edge(ipin1) then
		
		counter <= counter + 1;
		if (counter > 20) then	-- nakon 20 ciklusa sa duty 50% 
					iduty <= x"000030D4"; -- 25% duty
		end if;
		
		end if;
		
   end process;

END;
