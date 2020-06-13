--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date: 
-- Design Name:   
-- Module Name:   
-- Project Name:  Projekat20200529-Z2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stopwatch
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--	USE ieee.numeric_std.ALL;

ENTITY top_testbench IS
END top_testbench;
 
ARCHITECTURE behavior OF top_testbench IS 
 

    COMPONENT top
    PORT( 
         fclk : IN  std_logic;
         beg_number : IN  std_logic_vector(7 downto 0);
         pause : IN  std_logic_vector(11 downto 0);
         bflag : IN  std_logic;
         eflag : INOUT  std_logic;	
    		f_digit  : out STD_LOGIC_VECTOR (7 downto 0);		-- SSD fist digit
			s_digit : out STD_LOGIC_VECTOR (7 downto 0)			-- SSD second digit
        );
    END COMPONENT;
    

   --Inputs
   signal fclk : std_logic := '0';
   signal beg_number : std_logic_vector(7 downto 0) := (others => '0');
   signal pause : std_logic_vector(11 downto 0) := (others => '0');
   signal bflag : std_logic := '0';

	--BiDirs
   signal eflag : std_logic;
	
	--Outputs
	signal f_digit  : STD_LOGIC_VECTOR (7 downto 0) := x"00"; -- first digit
	signal s_digit : STD_LOGIC_VECTOR (7 downto 0)  := x"00"; -- second digit

   constant ClockPeriod: time := 1 us / 50;				-- 50 MHz fpga clk
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          fclk => fclk,
          beg_number => beg_number,
          pause => pause,
          bflag => bflag,
          eflag => eflag,
			 f_digit => f_digit,
			 s_digit => s_digit
        );

   -- Clock process definitions
   fclk_process :process
   begin
		fclk <= '0';
		wait for ClockPeriod/2;
		fclk <= '1';
		wait for ClockPeriod/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
	
		beg_number <= x"17";    -- 23
		pause 	  <= x"3E8";  -- 1000 us == 1 ms pause between digit change
		
		bflag <= '1';		-- start stopwatch
		wait for 2ms;
		
		bflag <= '0';
      wait;
		
   end process;
END;
