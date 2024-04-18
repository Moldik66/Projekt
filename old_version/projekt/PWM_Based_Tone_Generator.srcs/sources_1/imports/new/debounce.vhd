----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 03:10:50 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
    Port ( clk      : in STD_LOGIC;
           rst      : in STD_LOGIC;
           en       : in STD_LOGIC;
           bouncey  : in STD_LOGIC;
           pos_edge : out std_logic;
           neg_edge : out std_logic;
           clean    : out STD_LOGIC);
end debounce;

architecture behavioral of debounce is
    -- Define states for the FSM
    type   state_type is (RELEASED, PRE_PRESSED, PRESSED, PRE_RELEASED);
    signal state : state_type;

    -- Define number of periods for debounce counter
    constant DEB_COUNT : integer := 4;

    -- Define signals for debounce counter
    signal sig_count : integer range 0 to DEB_COUNT;

    -- Debounced signal
    signal sig_clean : std_logic;
    
    signal sig_delayed : std_logic;
begin

    -- Process implementing a finite state machine (FSM) for
    -- button debouncing. Handles transitions between different
    -- states based on clock signal and bouncey button input.
    p_fsm : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then   -- Active-high reset
                state <= RELEASED;
            elsif (en = '1') then -- Clock enable

                case state is     -- Define transitions between states

                    when RELEASED =>
                        -- If bouncey = 1 then clear counter and go to PRE_PRESSED;
                            if (bouncey = '1') then
                                sig_count <= 0;
                                state <= PRE_PRESSED;
                                end if; 
                            
                    when PRE_PRESSED =>
                        -- If bouncey = 1 increment counter
                            if (bouncey = '1') then
                                sig_count <= sig_count +1;
                              end if;  
                            -- if counter = DEB_COUNT-1 go to PRESSED
                            if (sig_count <= DEB_COUNT - 1) then
                                state <= PRESSED;
                                
                        -- else go to RELEASED
                            else 
                                state<=RELEASED;
                                end if;
                    when PRESSED =>
                        -- If bouncey = 0 then clear counter and go to PRE_RELEASED;
                            if (bouncey = '0') then
                                sig_count <= 0;
                                state <= PRE_PRESSED;
                                end if; 
                    when PRE_RELEASED =>
                        -- If bouncey = 0 then increment counter
                            if (bouncey = '0') then
                                sig_count<=sig_count +1;
                            end if;
                            -- if counter = DEB_COUNT-1 go to RELEASED;
                            if (sig_count = DEB_COUNT - 1) then
                                state <= RELEASED;
                        -- else clear counter and go to PRESSED;
                            else 
                                state <= PRESSED;
                            end if;
                    -- Prevent unhandled cases
                    when others =>
                        null;
                end case;
            end if;
        end if;

    end process p_fsm;

    -- Set clean signal to 1 when states PRESSED or PRE_RELEASED
sig_clean <= '1' when (state = PRESSED) or (state = PRE_PRESSED) else '0';

    -- Assign output debounced signal
    clean <= sig_clean;
    
    p_edge_detector : process (clk) is
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                    sig_delayed <= '0';
                else
                    sig_delayed <= sig_clean;
                end if;
            end if;
       end process p_edge_detector;

    -- Assign output signals for edge detector
        pos_edge <= sig_clean and not(sig_delayed);
        neg_edge <= not(sig_clean) and sig_delayed;


end architecture behavioral;