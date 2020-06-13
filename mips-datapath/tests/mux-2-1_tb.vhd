
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:10:14 05/15/2019
-- Design Name:   MUX2_1
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TBMux.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX2_1
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

ENTITY TBMux_vhd IS
END TBMux_vhd;

ARCHITECTURE behavior OF TBMux_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT MUX2_1
	PORT(
		input1 : IN std_logic_vector(4 downto 0);
		input2 : IN std_logic_vector(4 downto 0);
		control_signal : IN std_logic;          
		output : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL control_signal :  std_logic := '0';
	SIGNAL input1 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL input2 :  std_logic_vector(4 downto 0) := (others=>'0');

	--Outputs
	SIGNAL output :  std_logic_vector(4 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: MUX2_1 PORT MAP(
		input1 => input1,
		input2 => input2,
		control_signal => control_signal,
		output => output
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
	input1 <= "11111";
	input2 <= "00000";
	control_signal <= '0';
	WAIT FOR 20 ns;
	control_signal <= '1';
	WAIT FOR 20 ns;
	control_signal <= '0';

		wait; -- will wait forever
	END PROCESS;

END;
