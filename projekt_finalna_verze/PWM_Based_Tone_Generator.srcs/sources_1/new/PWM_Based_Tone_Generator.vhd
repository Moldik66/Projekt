----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 03:20:49 PM
-- Design Name: 
-- Module Name: PWM_Based_Tone_Generator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.math_real.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_Based_Tone_Generator is
    Port ( clk : in STD_LOGIC; 
           sw : in STD_LOGIC_VECTOR(15 downto 0); 
           LED : out std_logic_vector (15 downto 0);
           tone_out : out STD_LOGIC;
           countin : in STD_LOGIC_VECTOR (17 downto 0);
           countrst : out STD_LOGIC
            );
            
end PWM_Based_Tone_Generator;

architecture Behavioral of PWM_Based_Tone_Generator is
        
begin
tone_gen : 
process (clk, sw, countin) is
begin

--440 - A4 test tone on sw1
if (sw(0) = '1' and countin < b"01_1011_1011_1110_0100")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    
    elsif (sw(0) = '1' and countin > b"01_1011_1011_1110_0100" and countin < b"11_0111_0111_1100_1000") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(0) = '1' and countin > b"11_0111_0111_1100_1000") then --perioda
        countrst <= '1';

        
       end if;
       
--1kHz test tone on sw2
if (sw(1) = '1' and countin < b"00_1100_0011_0101_0000")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(1) = '1' and countin > b"00_1100_0011_0101_0000" and countin < b"01_1000_0110_1010_0000") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(1) = '1' and countin > b"01_1000_0110_1010_0000") then --perioda
        countrst <= '1';
        
        
       end if;
       
--C5 - 523.25 Hz tone on sw16, 191113 clk
if (sw(15) = '1' and countin < b"01_0111_0101_0100_0101")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(15) = '1' and countin > b"01_0111_0101_0100_0101" and countin < b"10_1110_1010_1000_1001") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(15) = '1' and countin > b"10_1110_1010_1000_1001") then --perioda
        countrst <= '1';
    
        
       end if;
       
  --C#5 - 554.37 Hz tone on sw15, 180385 clk
if (sw(14) = '1' and countin < b"01_0110_0000_0101_0000")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(14) = '1' and countin > b"01_0110_0000_0101_0000" and countin < b"10_1100_0000_1010_0001") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(14) = '1' and countin > b"10_1100_0000_1010_0001") then --perioda
        countrst <= '1';
      
        
       end if;

  --D5 - 587.33 Hz tone on sw14, 170262 clk
if (sw(13) = '1' and countin < b"01_0100_1100_1000_1011")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(13) = '1' and countin > b"01_0100_1100_1000_1011" and countin < b"10_1001_1001_0001_0110") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(13) = '1' and countin > b"10_1001_1001_0001_0110") then --perioda
        countrst <= '1';
       
        
       end if;
       
  --D#5 - 622.25 Hz tone on sw13, 160707 clk
if (sw(12) = '1' and countin < b"01_0011_1001_1110_0010") then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(12) = '1' and countin > b"01_0011_1001_1110_0010" and countin < b"10_0111_0011_1100_0011") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(12) = '1' and countin > b"10_0111_0011_1100_0011") then --perioda
        countrst <= '1';
        
        
       end if;
       
  --E5 - 659.26 Hz tone on sw12, 151685 clk
if (sw(11) = '1' and countin < b"01_0010_1000_0100_0011")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(11) = '1' and countin > b"01_0010_1000_0100_0011" and countin < b"10_0101_0000_1000_0101") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(11) = '1' and countin > b"10_0101_0000_1000_0101") then --perioda
        countrst <= '1';
      
        
       end if;

  --F5 - 698.46 Hz tone on sw11, 143172 clk
if (sw(10) = '1' and countin < b"01_0001_0111_1010_0010")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(10) = '1' and countin > b"01_0001_0111_1010_0010" and countin < b"10_0010_1111_0100_0100") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(10) = '1' and countin > b"10_0010_1111_0100_0100") then --perioda
        countrst <= '1';
       
        
       end if;
       
       
  --F#5 - 739.99 Hz tone on sw10, 135137 clk
if (sw(9) = '1' and countin < b"01_0000_0111_1111_0000")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(9) = '1' and countin > b"01_0000_0111_1111_0000" and countin < b"10_0000_1111_1110_0001") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(9) = '1' and countin > b"10_0000_1111_1110_0001") then --perioda
        countrst <= '1';
        
        
       end if;

  --G5 - 789.99 Hz tone on sw9, 127553 clk
if (sw(8) = '1' and countin < b"00_1111_1001_0010_0000")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(8) = '1' and countin > b"00_1111_1001_0010_0000" and countin < b"01_1111_0010_0100_0001") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(8) = '1' and countin > b"01_1111_0010_0100_0001") then --perioda
        countrst <= '1';
        
        
       end if;
       
   --G#5 - 830.61 Hz tone on sw8, 120393 clk
if (sw(7) = '1' and countin < b"00_1110_1011_0010_0101")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(7) = '1' and countin > b"00_1110_1011_0010_0101" and countin < b"01_1101_0110_0100_1001") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(7) = '1' and countin > b"01_1101_0110_0100_1001") then --perioda
        countrst <= '1';
       
        
       end if;
       
   --A5 - 880 Hz tone on sw7, 113686 clk
if (sw(6) = '1' and countin < b"00_1101_1101_1111_0010")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(6) = '1' and countin > b"00_1101_1101_1111_0010" and countin < b"01_1011_1100_0001_0110") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(6) = '1' and countin > b"01_1011_1100_0001_0110") then --perioda
        countrst <= '1';
      
        
       end if;

   --Bb5 - 932.33 Hz tone on sw6, 107258 clk
if (sw(5) = '1' and countin < b"00_1101_0001_0111_1101")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(5) = '1' and countin > b"00_1101_0001_0111_1101" and countin < b"01_1010_0010_1111_1010") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(5) = '1' and countin > b"01_1010_0010_1111_1010") then --perioda
        countrst <= '1';
      
        
       end if;
      
   --B5 - 987.77 Hz tone on sw5, 101238 clk
if (sw(4) = '1' and countin < b"00_1100_0101_1011_1011")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(4) = '1' and countin > b"00_1100_0101_1011_1011" and countin < b"01_1000_1011_0111_0110") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(4) = '1' and countin > b"01_1000_1011_0111_0110") then --perioda
        countrst <= '1';
       
        
       end if;

   --C6 - 1045.5 Hz tone on sw4, 95648 clk
if (sw(3) = '1' and countin < b"00_1011_1010_1101_0000")then --pulperioda
    countrst <= '0';
    tone_out <= '1';
    
    
    elsif (sw(3) = '1' and countin > b"00_1011_1010_1101_0000" and countin < b"01_0111_0101_1010_0000") then
        countrst <= '0';
        tone_out <= '0';
        
    elsif (sw(3) = '1' and countin > b"01_0111_0101_1010_0000") then --perioda
        countrst <= '1';
       end if;

   
end process tone_gen;

end Behavioral;
            
                
    