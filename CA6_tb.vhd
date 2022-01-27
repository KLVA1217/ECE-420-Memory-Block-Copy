----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2019 11:42:34 PM
-- Design Name: 
-- Module Name: CA6_tb - Behavioral
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

entity CA6_tb is
--  Port ( );
end CA6_tb;

architecture Behavioral of CA6_tb is

    component CA6_top is
        port ( 
            clk : in STD_LOGIC;
            rst : in STD_LOGIC);
        end component;
        
    signal clk_sig,rst_sig : std_logic;
        
    constant cp: time := 10ns;
        
    begin

      -- Clock
        process
            begin
                clk_sig <= '1';
                wait for cp/2;
                clk_sig <= '0';
                wait for cp/2;
        end process;
        
        -- Reset
        process
            begin
                rst_sig <= '1';
                wait for cp;
                
                rst_sig <= '0';
                wait;
        end process;

end Behavioral;
