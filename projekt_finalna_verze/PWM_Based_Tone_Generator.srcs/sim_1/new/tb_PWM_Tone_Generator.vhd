-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.4.2024 07:18:03 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_PWM_Based_Tone_Generator is
end tb_PWM_Based_Tone_Generator;

architecture tb of tb_PWM_Based_Tone_Generator is

    component PWM_Based_Tone_Generator
        port (clk      : in std_logic;
              sw       : in std_logic_vector (15 downto 0);
              LED      : out std_logic_vector (15 downto 0);
              tone_out : out std_logic;
              countin  : in std_logic_vector (17 downto 0);
              countrst : out std_logic);
    end component;

    signal clk      : std_logic;
    signal sw       : std_logic_vector (15 downto 0);
    signal LED      : std_logic_vector (15 downto 0);
    signal tone_out : std_logic;
    signal countin  : std_logic_vector (17 downto 0);
    signal countrst : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : PWM_Based_Tone_Generator
    port map (clk      => clk,
              sw       => sw,
              LED      => LED,
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
        sw <= (others => '0');
        countin <= (others => '0');

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        countrst <= '1';
        wait for 100 ns;
        countrst <= '0';
        wait for 100 ns;

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