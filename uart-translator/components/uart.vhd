----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Dat
-- Design Name: 
-- Module Name:    zadatak1 - Behavioral 
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
use ieee.numeric_std.all;

entity uart is
	port( fclk: in std_logic;
			wdata: in unsigned (7 downto 0); -- upisivanje nekog simbola hexadecimalne notacije npr. Slovo A -> hex:41 bin:01000001
			rdata: out unsigned (7 downto 0);-- ispisivanje tog simbola
			tx: out std_logic:='1'; --kasnije u kodu navedeno
			rx: in std_logic;
			wi: in std_logic; -- inicira da je započet unos simbola
			wc: out std_logic:='0'; -- inicira kraj upisivanja simbola wc <= wi znači upisuj novi simbol
			rc: out std_logic:='0'); -- rc=1 trebalo bi da inicira čitanje simbola, rc = 0 kada symboldelay neće iščitati simbol 							(nisam sigurna za ovaj dio)
end uart;

architecture a_uart of uart is
signal txdata: unsigned (7 downto 0) := x"00"; --pomoćni ulazni signal za procese čitanje i pisanje hexadecimalne notacije 
signal rxdata: unsigned (7 downto 0) := x"00"; --pomoćni izlazni signal za procese čitanje i pisanje hexadecimalne notacije 
signal dsize: unsigned (7 downto 0) := x"00"; --pretpostavljam da ovim ispituje dužinu simbola hexadecimalne notacije ??
begin

write: process (fclk)

		variable state:integer:=0; --neki uslovi koje ispitujete kasnije ( moglo se zvat a,b,x,...:) )
		variable pause:integer:=118;
		variable cnt:integer:=0;
		variable idx:integer:=0;		
		variable temp:integer:=0;
	
		variable baudrate:integer:=108;		--> 115200 Bauds -> 434 clocks of 50MHz 
		
		begin
		
		if fclk'event and fclk='1' then

	
				if wi = '1' then
					dsize <= x"08"; 					
					wc <= wi;
										
				end if;
							
				if dsize > 0 then
					cnt := cnt + 1;
				
				
					if(state = 0) then 
						temp := 1;
						if(cnt = pause) then
							cnt := 0;
							state := state + 1;
							pause := 120; 
							
							-- start bit
							tx <= '0'; -- prvi uslov kad nema upisa startni bit prelazi u 0, jer po onoj slici o 								uartu, imate da uart kreće u 1 pa se spušta u 0 kada kreće upis odnosno prebacuje taj 								bit u 0 i ide dalje sa upisom.
					
					end if;
					elsif(state <= 8) then
						if(cnt = pause) then
							cnt := 0;
							state := state + 1;
							pause := baudrate;
							
							-- data
							tx <= txdata(idx); --ovdje sve dok je state < od broja karaktera 8 ispisuj bit po bit 								idx označava bit hexadecimalnog broja, odnosno jedan bit osmobitne binarne 								reprezentacije 
							idx := idx + 1; --uvećava se za 1 sve dok se kompletan simbol ne ispiše, svaki simbol 										će biti 8 bita
						end if;
					elsif(state = 9) then -- ovdje se isptuje ako se upise npr umjesto 01000100 -> 101000100 ima više od 8 									 bita
						if(cnt = pause) then
							cnt := 0;
							state := state + 1;
							pause := 10;
							
							-- stop bit
							tx <= '1';--stop bit ( sa slike uarta) prelazi u stanje 1
						end if;	
					else
						if(cnt = pause) then -- ako je cnt pauza, zamislite sebi da ne kucate neko vrijeme simbole i 	ako to vrijeme dostigne vrijeme pauze gore definisano ispiši sljedeće -> sve 0
							cnt := 0;
							state := 0;
							pause := baudrate;									-- pause between characters
							tx <= '1';
							
							if idx >= 8 then
								dsize <= x"00";
								idx := 0;
								wc <= '0';
							end if;
						end if;	
					end if;
				end if;
			end if;	
	
	end process;	
--ista se logika proteže na dio za čitanje, samo ćete dodatno imati symboldelay, vjerovatno da označava ukoliko ne upisujete simbol odre�'eno vrijeme prekinut će se proces čitanja
read: process (fclk)
		variable state:integer:=0;
		variable pause:integer:=0;
		variable symboldelay:integer:=1180;
		variable cnt:integer:=0;
		variable idx:integer:=0;
		
	
		variable baudrate:integer:=108;		--> 115200 Bauds -> 434 clocks of 50MHz 
		
		begin
		   
		    if rising_edge(fclk) then
				cnt := cnt + 1;	
				
				if(state = 0) then
				
					if rx='0' then
						cnt := 0;
						state := state + 1;	
						pause := 120; 				-- 10% overhead for sampling purpose!
						rxdata <= x"00";
						idx := 0;
					end if;	
				elsif(state <= 8) then				-- data bits
					if(cnt > pause) then
						cnt := 0;
						state := state + 1;
						pause := baudrate;
						rxdata(idx) <= rx;
						idx := idx + 1;
					
					end if;
				elsif(state = 9) then				-- stop bit
						cnt := 0;
					if(cnt > pause) then
						state := state + 1;
						pause := 10;
						rdata <= rxdata;
						rc <= '1';	
					end if;	
				elsif(state = 10) then				-- process data on higher level
					if(cnt > symboldelay) then
					
						cnt := 0;
						rc <= '0';
						state := 0;
						
					end if;	
				end if;
				
			end if;
		end process;


end a_uart;


