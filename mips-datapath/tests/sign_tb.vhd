
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:33:42 05/15/2019
-- Design Name:   SIGNEXTEND
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TBSign.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SIGNEXTEND
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

ENTITY TBSign_vhd IS
END TBSign_vhd;

ARCHITECTURE behavior OF TBSign_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT SIGNEXTEND
	PORT(
		input : IN std_logic_vector(15 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL input :  std_logic_vector(15 downto 0) := (others=>'0');

	--Outputs
	SIGNAL output :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: SIGNEXTEND PORT MAP(
		input => input,
		output => output
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 10 ns;
		input <= "0000000000000001";
		-- Place stimulus here
		wait for 10 ns;
		input <= "1111111111111111";

		wait; -- will wait forever
	END PROCESS;

END;
