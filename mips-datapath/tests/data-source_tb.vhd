
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:45:38 05/20/2019
-- Design Name:   DataMemory
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TestBenchDataSource.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
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

ENTITY TestBenchDataSource_vhd IS
END TestBenchDataSource_vhd;

ARCHITECTURE behavior OF TestBenchDataSource_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DataMemory
	PORT(
		clk : IN std_logic;
		dataAddress : IN std_logic_vector(31 downto 0);
		memRead : IN std_logic;
		dataValue : IN std_logic_vector(31 downto 0);
		memWrite : IN std_logic;          
		outputValue : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL memRead :  std_logic := '0';
	SIGNAL memWrite :  std_logic := '0';
	SIGNAL dataAddress :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL dataValue :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL outputValue :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: DataMemory PORT MAP(
		clk => clk,
		dataAddress => dataAddress,
		memRead => memRead,
		dataValue => dataValue,
		memWrite => memWrite,
		outputValue => outputValue
	);

	tb : PROCESS
	
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 30 ns;

		-- Place stimulus here
		dataAddress <= x"00000001";
		dataValue <= x"00000002";
		
		memRead <= '0';
		memWrite <= '1';
		
		clk <= '1';
		wait for 20 ns;
		clk <= '0';
		wait for 20 ns;
		
		memRead <= '1';
		memWrite <= '0';
		
		clk <= '1';
		wait for 20 ns;
		clk <= '0';
		wait for 20 ns;
		
		dataValue <= x"00000007";
		dataAddress <= x"00000003";
		
		memRead <= '1';
		memWrite <= '1';
		
		clk <= '1';
		wait for 20 ns;
		clk <= '0';
	

		wait; -- will wait forever
	END PROCESS;

END;
