
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:00:13 05/20/2019
-- Design Name:   ALU
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TestBenchALU.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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

ENTITY TestBenchALU_vhd IS
END TestBenchALU_vhd;

ARCHITECTURE behavior OF TestBenchALU_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ALU
	PORT(
		operand1 : IN std_logic_vector(31 downto 0);
		operand2 : IN std_logic_vector(31 downto 0);
		control : IN std_logic;          
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL control :  std_logic := '0';
	SIGNAL operand1 :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL operand2 :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL result :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ALU PORT MAP(
		operand1 => operand1,
		operand2 => operand2,
		control => control,
		result => result
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
	
		wait for 100 ns;

		-- Place stimulus here
		operand1 <= x"00000005";		
		operand2 <= x"00000003";
		control <= '0';				--sabiramo
		wait for 30 ns;
		control <= '1';				--oduzimamo
		wait; -- will wait forever
	END PROCESS;

END;
