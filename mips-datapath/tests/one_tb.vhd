
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:25:02 05/12/2019
-- Design Name:   DATAPATH
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TestBenchOne.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY TestBenchOne_vhd IS
END TestBenchOne_vhd;

ARCHITECTURE behavior OF TestBenchOne_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DATAPATH
	PORT(
		clk : IN std_logic;          
		next_address : OUT std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
		instruction : OUT std_logic_vector(31 downto 0)  := "00000000000000000000000000000000"
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';

	--Outputs
	SIGNAL next_address :  std_logic_vector(31 downto 0);
	SIGNAL instruction :  std_logic_vector(31 downto 0);

BEGIN
	
	-- Instantiate the Unit Under Test (UUT)
	uut: DATAPATH PORT MAP(
		clk => clk,
		next_address => next_address,
		instruction => instruction
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		clk<= '1';
	 wait for 25 ns;
	  clk<= '0';
	 wait for 25 ns;
	  clk<= '1';
	 wait for 25 ns;
	  clk<= '0';
	 wait for 25 ns;
	  clk<= '1';
	 wait for 25 ns;
	  clk<= '0';
	 wait for 25 ns;
	 clk<= '1';
	 wait for 25 ns;
	  clk<= '0';
	 
	
	wait; -- will wait forever
	END PROCESS;

END;
