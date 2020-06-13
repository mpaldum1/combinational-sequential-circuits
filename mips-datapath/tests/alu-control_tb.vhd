
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:30:34 05/20/2019
-- Design Name:   ALUControl
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TBALUControl.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUControl
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

ENTITY TBALUControl_vhd IS
END TBALUControl_vhd;

ARCHITECTURE behavior OF TBALUControl_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ALUControl
	PORT(
		ALUOp : IN std_logic_vector(1 downto 0);
		funct : IN std_logic_vector(5 downto 0);          
		result : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL ALUOp :  std_logic_vector(1 downto 0) := (others=>'0');
	SIGNAL funct :  std_logic_vector(5 downto 0) := (others=>'0');

	--Outputs
	SIGNAL result :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ALUControl PORT MAP(
		ALUOp => ALUOp,
		funct => funct,
		result => result
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 30 ns;
		funct <= "000000";		-- u pitanju je sabiranje
		ALUOp <= "00";
		wait for 20 ns;
		ALUOp <= "10";
		wait for 20 ns;
		funct <= "100000";		--sabiranje
		ALUOp <= "10";
		
		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
