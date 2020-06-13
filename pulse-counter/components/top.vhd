----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
		port ( clk : in  STD_LOGIC;
				 delay : in  STD_LOGIC_VECTOR (31 downto 0);
				 width : in  STD_LOGIC_VECTOR (31 downto 0);
				 uart_signal: out unsigned (7 downto 0)
			);
end top;

architecture Behavioral of top is

--component definitions

	component uart is 
		port( 
			iclk: in std_logic;
			wdata: in unsigned (7 downto 0);
			rdata: out unsigned (7 downto 0);
			tx: out std_logic;
			rx: in std_logic;
			wi: in std_logic;
			wc: out std_logic;
			rc: out std_logic);
	end component;
	
	component Timer is 
		port(clk  : in  STD_LOGIC;
			  delay : in  STD_LOGIC_VECTOR (31 downto 0);
           width : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC
			  );
			  
	end component;
	    		 
	component pulse_counter is
		port(
			  impuls : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           pulse_width : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
	

-- signals

		  constant clkFrequencyMHz : integer := 50; -- 50 MHz

			signal wdata: unsigned (7 downto 0) := x"00";
			signal rdata: unsigned (7 downto 0);
			signal tx: std_logic;
			signal rx: std_logic :='0';
			signal wi: std_logic:='0';
			signal wc: std_logic;
			signal rc: std_logic;

         signal output: STD_LOGIC := '0';
			
         signal pulse_width : STD_LOGIC_VECTOR (31 downto 0);
			shared variable I :  integer := 4;
		
			signal temp: integer := 0;
			

			
			
begin

	timer_comp : Timer 				port map (clk => clk,
												 delay => delay,
												 width => width,
												 output => output);
	
	uart_comp : uart				port map (iclk => clk,
												 wdata => wdata,
												 rdata => rdata,
												 tx => tx,
												 rx => rx,
												 wi => wi,
												 wc => wc, 
												 rc => rc);
												 
	pulse_counter_comp : pulse_counter   port map (impuls => output,
												clk => clk,
												pulse_width => pulse_width);
												
	
	process (wc) 
	begin
	
		if rising_edge(wc) then
				I := I - 1;	
		end if;
		
	end process;
	
		

 
	process 
		begin
				
				wait until falling_edge(output);
				-- one shot has ended
			
				if I > 0 then			
					
					wdata <= unsigned(pulse_width( (I*8-1) downto ( (I-1)*8-1)));
					uart_signal  <=   unsigned(pulse_width( (I*8-1) downto ( (I-1)*8-1)));	-- sending all bits 

					
					wi <= '1';			
								
					
			end if;
				
		
	end process;


end Behavioral;

