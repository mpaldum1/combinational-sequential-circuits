--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date: 
-- Design Name:   
-- Module Name:   
-- Project Name:  Projekat20200529
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         fclk : IN  std_logic;
         tsone : IN  std_logic_vector(31 downto 0);
         tsoneH : IN  std_logic_vector(31 downto 0);
         tzero : IN  std_logic_vector(31 downto 0);
         tzeroH : IN  std_logic_vector(31 downto 0);
         tp : IN  std_logic_vector(31 downto 0);
         data : IN  std_logic_vector(31 downto 0);
         tsstart : IN  std_logic_vector(31 downto 0);
         tsstartH : IN  std_logic_vector(31 downto 0);
         bflag : IN  std_logic;
         eflag : OUT  std_logic;
			output: INOUT std_logic
        );
    END COMPONENT; 
    

   --Inputs
   signal fclk : std_logic := '0';
   signal tsone : std_logic_vector(31 downto 0)    := x"00000465";	  -- 1125us;
   signal tsoneH : std_logic_vector(31 downto 0)   := x"00000226";	  --  550us;
   signal tzero : std_logic_vector(31 downto 0)    := x"000008CA";	  -- 2250us;
   signal tzeroH : std_logic_vector(31 downto 0)   := x"00000226";	  --  550us;
   signal tp : std_logic_vector(31 downto 0)       := x"00000019";     --	 25us;
   signal data : std_logic_vector(31 downto 0)     := x"A52149B6";
   signal tsstart : std_logic_vector(31 downto 0)  := x"000034BC";	  --13500us;
   signal tsstartH : std_logic_vector(31 downto 0) :=  x"00001194";	  -- 4500us;
	
	
	-- input initialisation
   signal bflag : std_logic := '0';

 	--Outputs
   signal eflag : std_logic;
	signal output: std_logic := '0';

   -- Clock period definitions
   constant fclk_period : time := 1 us / 50;			--fpga clk is 50MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          fclk => fclk,
          tsone => tsone,
          tsoneH => tsoneH,
          tzero => tzero,
          tzeroH => tzeroH,
          tp => tp,
          data => data,
          tsstart => tsstart,
          tsstartH => tsstartH,
          bflag => bflag,
          eflag => eflag,
			 output => output
        );

   -- Clock process definitions
   fclk_process :process
   begin
		fclk <= '0';
		wait for fclk_period/2;
		fclk <= '1';
		wait for fclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin			
		
		-- transmission start
		bflag <= '1';
		
		wait for 10 ms;
	
		bflag <= '0';
			
		wait;
		
		end process;

END;
