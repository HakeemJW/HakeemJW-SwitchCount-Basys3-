library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------
-- Engineer: Hakeem Wilson
-- 
-- Create Date: 09/13/2020 07:08:00 PM
-- Module Name: SwitchCount - SwitchCount_ARCH
-- Project Name: Switch Counter
-- Target Devices: Basys 3
-- Description: This architecture uses the seven segment display to count the number
--              of active onboard switches.
----------------------------------------------------------------------------------


entity SwitchCount is
    port(
                
        seg:    out std_logic_vector(6 downto 0);    --MSB=g, LSB=a
        an:     out std_logic_vector(3 downto 0);    --MSB=leftmost digit
        led:    out std_logic_vector(7 downto 0);    --LED Array
        sw:     in std_logic_vector(7 downto 0)      --Switch Array
    );
end SwitchCount;

architecture SwitchCount_ARCH of SwitchCount is
     ----general definitions----------------------------------------------CONSTANTS
    constant ACTIVE: std_logic := '1';
    constant SWITCH_ON: std_logic := '1';
    constant LED_ON: std_logic := '1';
    constant RIGHT_SEG: std_logic_vector(3 downto 0) := "1110";
    
    ----LEDs------------------------------------------------------------CONSTANTS
    constant LED_0: std_logic_vector(7 downto 0) := "00000000";
    constant LED_1: std_logic_vector(7 downto 0) := "00000001";
    constant LED_2: std_logic_vector(7 downto 0) := "00000011";
    constant LED_3: std_logic_vector(7 downto 0) := "00000111";
    constant LED_4: std_logic_vector(7 downto 0) := "00001111";
    constant LED_5: std_logic_vector(7 downto 0) := "00011111";
    constant LED_6: std_logic_vector(7 downto 0) := "00111111";
    constant LED_7: std_logic_vector(7 downto 0) := "01111111";
    constant LED_8: std_logic_vector(7 downto 0) := "11111111";
    
    
    
    ----normal-seven-segment-display----------------------------------CONSTANTS
    constant ZERO_7SEG:  std_logic_vector(6 downto 0) := "1000000";
    constant ONE_7SEG:   std_logic_vector(6 downto 0) := "1111001";
    constant TWO_7SEG:   std_logic_vector(6 downto 0) := "0100100";
    constant THREE_7SEG: std_logic_vector(6 downto 0) := "0110000";
    constant FOUR_7SEG:  std_logic_vector(6 downto 0) := "0011001";
    constant FIVE_7SEG:  std_logic_vector(6 downto 0) := "0010010";
    constant SIX_7SEG:   std_logic_vector(6 downto 0) := "0000010";
    constant SEVEN_7SEG: std_logic_vector(6 downto 0) := "1111000";
    constant EIGHT_7SEG: std_logic_vector(6 downto 0) := "0000000";
    
begin
                    
    an <= RIGHT_SEG;
    --Update bar display based on switches pressed---------------------PROCESS----
        SWITCH_COUNT: process(sw(0), sw(1), sw(2), sw(3), sw(4), sw(5), sw(6), sw(7))
            variable count: integer range 0 to 8;    
        begin
            
            --Count the number of switches pressed--------------------------------
            count := 0;
            if (sw(0) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(1) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(2) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(3) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(4) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(5) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(6) = SWITCH_ON) then 
                count := count + 1;
            end if;
            if (sw(7) = SWITCH_ON) then 
                count := count + 1;
            end if;
            
            case count is 
            when 0 => 
                seg <= ZERO_7SEG; -- "0"
                led <= LED_0;
            when 1 => 
                seg <= ONE_7SEG; -- "1"
                led <= LED_1; 
            when 2 => 
                seg <= TWO_7SEG; -- "2"
                led <= LED_2;  
            when 3 => 
                seg <= THREE_7SEG; -- "3" 
                led <= LED_3;
            when 4 => 
                seg <= FOUR_7SEG; -- "4"
                led <= LED_4; 
            when 5 => 
                seg <= FIVE_7SEG; -- "5"
                led <= LED_5; 
            when 6 => 
                seg <= SIX_7SEG; -- "6"
                led <= LED_6; 
            when 7 => 
                seg <= SEVEN_7SEG; -- "7"
                led <= LED_7; 
            when others => 
                seg <= EIGHT_7SEG; -- "8"
                led <= LED_8;     
            end case;
        end process;
                  
end SwitchCount_ARCH;
