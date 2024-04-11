----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 04:09:20 PM
-- Design Name: 
-- Module Name: simple_counter2 - Behavioral
-- Project Name: 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;



entity simple_counter is
    generic (
        N : integer := 18 --! Default number of bits
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           note1:   out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (N-1 downto 0));
end simple_counter;

architecture Behavioral of simple_counter is

signal sig_count : STD_LOGIC_VECTOR (N-1 downto 0);

begin

process (clk)
begin
   if clk='1' and clk'event then
      if rst='1' then
         sig_count <= (others => '0');
      elsif en='1' then
         sig_count <= sig_count + 1;
      end if;
   end if;
end process;

count <= sig_count;			
					

end Behavioral;
