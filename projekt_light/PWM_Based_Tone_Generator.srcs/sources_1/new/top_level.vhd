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
            AUD_PWM : out STD_LOGIC --len tip, not sure ci to ma byt prave tento alebo jeden z tych PMOD 
            );
    
end top_level;

architecture Behavioral of top_level is

-- Component declaration for PWM_Based_Tone_Generator
    component PWM_Based_Tone_Generator is
        Port ( 
                clk  : in STD_LOGIC; 
                sw_1 : in STD_LOGIC;
                sw_2 : in STD_LOGIC;
                sw_3 : in STD_LOGIC; -- unused
                sw_4 : in STD_LOGIC;
                sw_5 : in STD_LOGIC;
                sw_6 : in STD_LOGIC;
                sw_7 : in STD_LOGIC;
                sw_8 : in STD_LOGIC;
                sw_9 : in STD_LOGIC;
                sw_10 : in STD_LOGIC;
                sw_11 : in STD_LOGIC;
                sw_12 : in STD_LOGIC;
                sw_13 : in STD_LOGIC;
                sw_14 : in STD_LOGIC;
                sw_15 : in STD_LOGIC;
                sw_16 : in STD_LOGIC;
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
    

signal sig_en : std_logic;
signal sig_event : std_logic;
signal sig_counted : std_logic_vector (17 downto 0);
signal sig_reset : std_logic;

begin

    PWM : PWM_Based_Tone_Generator
        port map (
                    clk => CLK100MHZ,
                    sw_1 => SW(0),
                    sw_2 => SW(1),
                    sw_3 => SW(2),
                    sw_4 => SW(3),
                    sw_5 => SW(4),
                    sw_6 => SW(5),
                    sw_7 => SW(6),
                    sw_8 => SW(7),
                    sw_9 => SW(8),
                    sw_10 => SW(9),
                    sw_11 => SW(10),
                    sw_12 => SW(11),
                    sw_13 => SW(12),
                    sw_14 => SW(13),
                    sw_15 => SW(14),
                    sw_16 => SW(15),
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
                
end Behavioral;