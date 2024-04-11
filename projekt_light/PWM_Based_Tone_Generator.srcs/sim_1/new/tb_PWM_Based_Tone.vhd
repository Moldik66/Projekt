---- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 9.4.2024 10:28:46 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_PWM_Based_Tone_Generator is
end tb_PWM_Based_Tone_Generator;

architecture tb of tb_PWM_Based_Tone_Generator is

    component PWM_Based_Tone_Generator
        port (clk      : in std_logic;
              sw_1     : in std_logic;
              tone_out : out std_logic;
              countin  : in std_logic_vector (17 downto 0);
              countrst : out std_logic);
    end component;

    signal clk      : std_logic;
    signal sw_1     : std_logic;
    signal tone_out : std_logic;
    signal countin  : std_logic_vector (17 downto 0);
    signal countrst : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : PWM_Based_Tone_Generator
    port map (clk      => clk,
              sw_1     => sw_1,
              tone_out => tone_out,
              countin  => countin,
              countrst => countrst);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;
       
    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        
        sw_1 <= '1';
        
        countin <= b"00_0000_0000_0000_0000";
        
        
        
        wait for 5*TbPeriod;
        countin <= b"01_1011_1011_1110_0011"; --113635
        wait for 5*TbPeriod;
        countin <= b"01_1011_1011_1110_0100"; --113636
        wait for 5*TbPeriod;
        countin <= b"01_1011_1011_1110_1100"; --113637
        wait for 5*TbPeriod;
        countin <= b"11_0111_0111_1100_0111"; --227271
        wait for 5*TbPeriod;
        countin <= b"11_0111_0111_1100_1000"; --227272
        wait for 5*TbPeriod;
        countin <= b"11_0111_0111_1100_1010"; --227273

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_PWM_Based_Tone_Generator of tb_PWM_Based_Tone_Generator is
    for tb
    end for;
end cfg_tb_PWM_Based_Tone_Generator;