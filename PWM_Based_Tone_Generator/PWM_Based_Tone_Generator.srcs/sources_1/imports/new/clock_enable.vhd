

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.std_logic_unsigned.all;



entity clock_enable is
 generic (
        PERIOD : integer := 18
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
end clock_enable;

architecture Behavioral of clock_enable is

       --! Get number for needed bits for PERIOD value
    constant BITS_NEEDED : integer := integer(ceil(log2(real(PERIOD + 1))));
    --! Local counter with needed number of bits
    signal sig_count : std_logic_vector(BITS_NEEDED - 1 downto 0);

begin

    --! Generate clock enable signal. By default, enable signal
    --! is low and generated pulse is always one clock long.
    p_clk_enable : process (clk) is
    begin

        -- Synchronous proces
        if (rising_edge(clk)) then                 
            if (rst = '1') then                    
                sig_count <= (others => '0');      
                pulse     <= '0';                  

            -- Test number of clock periods
            elsif (sig_count = (PERIOD - 1)) then
                sig_count <= (others => '0');     
                pulse     <= '1';                 
            else
                sig_count <= sig_count + 1;       
                pulse     <= '0';
            end if;                             
        end if;

    end process p_clk_enable;

end architecture behavioral;

