----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2024 13:19:06
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
   Port ( 
            CLK100MHZ : in STD_LOGIC;
            SW : in STD_LOGIC_VECTOR (15 downto 0);
            AUD_PWM : out STD_LOGIC; --len tip, not sure ci to ma byt prave tento alebo jeden z tych PMOD 
            AUD_SD : out STD_LOGIC;
            LED : out STD_LOGIC_VECTOR (15 downto 0)
            );
    
end top_level;

architecture Behavioral of top_level is

-- Component declaration for PWM_Based_Tone_Generator
    component PWM_Based_Tone_Generator is
        Port ( 
                clk  : in STD_LOGIC;
                sw : in STD_LOGIC_VECTOR(15 downto 0); 
                tone_out : out STD_LOGIC;
                countin : in STD_LOGIC_VECTOR (17 downto 0);
                countrst : out STD_LOGIC
            );

end component;

    
-- Component declaration for simple_counter
    component simple_counter is 
        generic (
                N : integer := 18
                );
        Port ( 
                clk : in STD_LOGIC;
                rst : in STD_LOGIC;
                en : in STD_LOGIC;
                note1:   out STD_LOGIC;
                count : out STD_LOGIC_VECTOR (N-1 downto 0)
                );
    end component;
    

signal sig_counted : std_logic_vector (17 downto 0);
signal sig_reset : std_logic;

begin


    PWM : PWM_Based_Tone_Generator
        port map (
                    clk => CLK100MHZ,
                    sw => SW,
                    tone_out => AUD_PWM,
                    countin => sig_counted,
                    countrst => sig_reset
                    
       
                );

                
    SIMP_C : simple_counter
        port map (
                    clk => CLK100MHZ,
                    rst => sig_reset,
                    en => '1',
                    count => sig_counted
        );          
            
             AUD_SD <= '1';
             LED <= SW;
                
end Behavioral;