
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:07:39 05/15/2019
-- Design Name:   CONTROL
-- Module Name:   C:/Users/User/Desktop/MIPS_18154/MIPS_RA_18154/TBControl.vhd
-- Project Name:  MIPS_RA_18154
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL
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

ENTITY TBControl_vhd IS
END TBControl_vhd;

ARCHITECTURE behavior OF TBControl_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT CONTROL
	PORT(
		opcode : IN std_logic_vector(5 downto 0);          
		RegDst : OUT std_logic;
		ALUSrc : OUT std_logic;
		MemToReg : OUT std_logic;
		RegWrite : OUT std_logic;
		MemRead : OUT std_logic;
		MemWrite : OUT std_logic;
		Branch : OUT std_logic;
		ALUOp : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL opcode :  std_logic_vector(5 downto 0) := (others=>'0');

	--Outputs
	SIGNAL RegDst :  std_logic;
	SIGNAL ALUSrc :  std_logic;
	SIGNAL MemToReg :  std_logic;
	SIGNAL RegWrite :  std_logic;
	SIGNAL MemRead :  std_logic;
	SIGNAL MemWrite :  std_logic;
	SIGNAL Branch :  std_logic;
	SIGNAL ALUOp :  std_logic_vector(1 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: CONTROL PORT MAP(
		opcode => opcode,
		RegDst => RegDst,
		ALUSrc => ALUSrc,
		MemToReg => MemToReg,
		RegWrite => RegWrite,
		MemRead => MemRead,
		MemWrite => MemWrite,
		Branch => Branch,
		ALUOp => ALUOp
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		opcode <= "100011"; --load word
		WAIT FOR 50 ns;
		opcode <= "101011"; --store word
		WAIT FOR 50 ns;

		wait; -- will wait forever
	END PROCESS;

END;
