
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:28:09 05/15/2019
-- Design Name:   REGFILE
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TBReg.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGFILE
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

ENTITY TBReg_vhd IS
END TBReg_vhd;

ARCHITECTURE behavior OF TBReg_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT REGFILE
	PORT(
		clk : IN std_logic;
		control : IN std_logic;
		read_address1 : IN std_logic_vector(4 downto 0);
		read_address2 : IN std_logic_vector(4 downto 0);
		write_address : IN std_logic_vector(4 downto 0);
		value : IN std_logic_vector(31 downto 0);          
		register_value_1 : OUT std_logic_vector(31 downto 0);
		register_value_2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL control :  std_logic := '0';
	SIGNAL read_address1 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL read_address2 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL write_address :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL value :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL register_value_1 :  std_logic_vector(31 downto 0);
	SIGNAL register_value_2 :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: REGFILE PORT MAP(
		clk => clk,
		control => control,
		read_address1 => read_address1,
		read_address2 => read_address2,
		write_address => write_address,
		value => value,
		register_value_1 => register_value_1,
		register_value_2 => register_value_2
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		write_address	  <= "01000";
		value			    <= x"11112222";
		WAIT FOR 40 ns;
		control	 <= '1';
		WAIT FOR 15 ns;
		control	 <= '0';
		WAIT FOR 15 ns;


		wait; -- will wait forever
	END PROCESS;

END;
