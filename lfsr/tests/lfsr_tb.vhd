--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   
-- Design Name:   
-- Module Name:   
-- Project Name:  Zadaca2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LFSR
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
--USE ieee.numeric_std.ALL;
 
ENTITY LFSR_tb IS
END LFSR_tb;
 
ARCHITECTURE behavior OF LFSR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LFSR
    PORT(
         reset,   clk  : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 us;
	constant result: std_logic_vector(14 downto 0) := "010010010010010";	-- expected output after 15 clock periods
	signal temp_result: std_logic_vector(14 downto 0);
	signal counter: integer := 0;
	signal done: integer := 0;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LFSR PORT MAP (
          reset => reset,
          clk => clk,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	count_process: process (clk)
	
	begin
	
		if rising_edge(clk) then
			counter <= counter + 1;
		end if;	
		
		if counter = 15 then
			counter <= 0;
			done <= done + 1;	-- signal for first oscillation
			
		end if;

		if done >= 2 then		
			counter <= 0;
		end if;
		
	end process;

 
   -- Stimulus process
   stim_proc: process (clk)
      begin		
			 
		 if counter = 15 and done = 0 then
				reset <= '1';
				ASSERT (temp_result = result) report "Outputs do not match!" severity warning;
				-- known output and generated value match?
		end if;
		 
		 if rising_edge(clk) and reset = '1' then
			reset <= '0';
		 end if;
		 
		 if rising_edge(clk) then
			temp_result(counter) <= output;
		 end if;
			
   end process;
	
		

END;
