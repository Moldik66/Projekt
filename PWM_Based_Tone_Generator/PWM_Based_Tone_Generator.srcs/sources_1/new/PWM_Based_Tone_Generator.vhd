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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_Based_Tone_Generator is
    Port ( clk : in STD_LOGIC;
           sw_1 : in STD_LOGIC;
           tone_out : out STD_LOGIC;
           countin : out STD_LOGIC_VECTOR (17 downto 0);
           rst : in STD_LOGIC
            );
            
end PWM_Based_Tone_Generator;

architecture Behavioral of PWM_Based_Tone_Generator is
        
component clock_enable is
        generic(
                PERIOD : integer := 227273
                );
        port(   clk : in STD_LOGIC;
                rst : in STD_LOGIC;
                pulse : out STD_LOGIC
                
                );
     end component;
     
     component simple_counter is
        generic (
                N : integer := 18
                );
        port(   clk : in STD_LOGIC;
                rst : in STD_LOGIC;
                en : in STD_LOGIC;
                count : out STD_LOGIC_VECTOR (17 downto 0)
                );
      end component;
      
      component debounce is 
        port(   clk      : in STD_LOGIC;
                rst      : in STD_LOGIC;
                en       : in STD_LOGIC;
                bouncey  : in STD_LOGIC;
                pos_edge : out std_logic;
                neg_edge : out std_logic;
                clean    : out STD_LOGIC);
     end component;
      
     signal sig_event : std_logic;
     signal sig_en_2ms : std_logic;
     signal sig_tone_out : std_logic;
     signal sig_count : STD_LOGIC_VECTOR (17 downto 0);
     
    
begin
 
tone : simple_counter 
    port map (
            en => '1',
            rst => '0',
            clk => clk,
            count => sig_count
            );
              
            
process (clk)
    begin
              
    while  (sw_1 = '1') loop
        sig_tone_out <= '1';
        if (countin = "113636") then
            sig_tone_out => '0';
            if (count = 227272) then
                rst => '1';
             else
                rst => '0';
             end if;
         end if;
            
     end loop;
     countin <= sig_count;
     end process;
            

--AHOOOOOOJ


end Behavioral;
