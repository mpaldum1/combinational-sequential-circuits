----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:20 05/10/2019 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DATAPATH is
	port(
	clk: in std_logic;
	next_address: out std_logic_vector (31 downto 0):= x"00000000";
	instruction: out std_logic_vector (31 downto 0):= x"00000000"
	);
end DATAPATH;

architecture Behavioral of DATAPATH is

component PCADDER
	port (
	current_address: IN STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
	next_address: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component PC is
port (
	clk: IN STD_LOGIC;
	pc_in: IN STD_LOGIC_VECTOR(31 downto 0);
	pc_out: OUT STD_LOGIC_VECTOR(31 downto 0)
);
end component;

component MEMORYINSTRUCTION is
port (
	clk: IN std_logic;
	read_memory_address: IN std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	read_memory_data: OUT std_logic_vector(31 downto 0)
);
end component;

component CONTROL is
port (
		opcode: in std_logic_vector (5 downto 0);
		RegDst: out std_logic;
		ALUSrc: out std_logic;
		MemToReg: out std_logic;
		RegWrite: out std_logic;
		MemRead: out std_logic;
		MemWrite: out std_logic;
		Branch: out std_logic;
		ALUOp: out std_logic_vector (1 downto 0)
);
end component;

component MUX2_1 is
		generic (n: natural := 4);
	port(
	input1: in std_logic_vector (n-1 downto 0);
	input2: in std_logic_vector (n-1 downto 0);
	control_signal: in std_logic;
	output: out std_logic_vector (n-1 downto 0)
	);
end component;

component REGFILE is 
port (
	clk: in std_logic;
	control: in std_logic;
	read_address1: in std_logic_vector (4 downto 0);
	read_address2: in std_logic_vector (4 downto 0);
	write_address: in std_logic_vector (4 downto 0);
	value: in std_logic_vector (31 downto 0);
	register_value_1: out std_logic_vector (31 downto 0);
	register_value_2: out std_logic_vector (31 downto 0)
);
end component;

component SIGNEXTEND is
port (
	input: in std_logic_vector (15 downto 0);
	output: out std_logic_vector (31 downto 0)
	);
end component;

component ALUControl is
port(
	ALUOp: in std_logic_vector(1 downto 0);
	funct: in std_logic_vector(5 downto 0);
	result: out std_logic
);
end component;

component ALU is
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	control: in std_logic;
	result: out std_logic_vector(31 downto 0)
);
end component;

component DataMemory is
port(
	clk: in std_logic;
	dataAddress: in std_logic_vector(31 downto 0);
	memRead: in std_logic;
	dataValue: in std_logic_vector(31 downto 0);
	memWrite: in std_logic;
	outputValue: out std_logic_vector(31 downto 0):= x"00000000"
);
end component;

signal vector1: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";		--pc_in
signal vector2: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";		--pc_out
signal vector3: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal vector4: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal vector5: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

signal writeData: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";		  	-- nije poznata vrijednost iz WB faze

signal muxOutput: std_logic_vector (4 downto 0);
signal readRegister1: std_logic_vector (31 downto 0);
signal readRegister2: std_logic_vector (31 downto 0);
signal signExtended: std_logic_vector (31 downto 0);	
signal muxOutputForAlu: std_logic_vector (31 downto 0);	
signal ALUResult: std_logic_vector(31 downto 0);	

signal regDst: std_logic;
signal aluSrc: std_logic;
signal memToReg: std_logic;
signal regWrite: std_logic;
signal memRead: std_logic;
signal memWrite: std_logic;
signal branch: std_logic;
signal aluOp: std_logic_vector(1 downto 0);

signal aluControlTemp: std_logic;

signal dataOutput: std_logic_vector(31 downto 0);

begin

comp1: PC port map (clk, vector1, vector2);
comp2: PCADDER port map (vector1, vector3);
comp3: MEMORYINSTRUCTION port map (clk, vector2, vector4);
comp4: CONTROL port map (vector4(31 downto 26),regDst, aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp);
comp5: MUX2_1 generic map(5) port map(vector4(20 downto 16), vector4(15 downto 11), regDst, muxOutput);
comp6: REGFILE port map(clk, regWrite, vector4(25 downto 21), vector4(20 downto 16), muxOutput, writeData, readRegister1, readRegister2);
comp7: SIGNEXTEND port map(vector4(15 downto 0), signExtended); 
comp8: ALUControl port map(aluOp, vector4(5 downto 0),aluControlTemp);
comp9: MUX2_1 generic map(32) port map(signExtended,readRegister2,aluSrc,muxOutputForAlu);
comp10: ALU port map(readRegister1,muxOutputForAlu, aluControlTemp, ALUResult);
comp11: DataMemory port map (clk, ALUResult ,memRead,readRegister2,memWrite, dataOutput);
comp12: MUX2_1 generic map(32) port map(dataOutput, ALUResult, MemToReg, writeData);

process(clk) begin 
	if rising_edge(clk) then
		next_address <= vector2;
		vector1 <= vector3;
	end if;
end process;

end Behavioral;
			
