----------------------------------------------------------------------------------
-- Company: California State University Northridge
-- Engineer: Ken Aquino
-- 
-- Create Date: 12/07/2019 12:22:14 PM
-- Design Name: Memory Block Adder
-- Module Name: CA6_top - Behavioral
-- Project Name: Computer Assignment 6
-- Target Devices: 
-- Tool Versions: 
-- Description: Top Level Design of the Memory Block Adder
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
use IEEE.NUMERIC_STD.ALL;


entity CA6_top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end CA6_top;

architecture Behavioral of CA6_top is

COMPONENT blk_mem_gen_0 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

signal din: std_logic_vector(15 downto 0);
signal dout,dout_reg,add_out: std_logic_vector(15 downto 0);
signal re: std_logic;
signal we: std_logic_vector(0 downto 0);
signal addr,count: std_logic_vector(9 downto 0);
signal count_reg,count_next: unsigned(9 downto 0);

begin

mem_content: blk_mem_gen_0
    port map(
        clka  => clk,
        ena   => re,
        wea   => we,
        addra => addr,
        dina  => din,
        douta => dout
    );
    
process (clk)
begin
    if (rising_edge(clk)) then
        if rst='1' then
            dout_reg <= (others => '0');
            din <= (others => '0');
            count_reg <= (others => '0');
        else
            dout_reg <= dout;
            din      <= add_out;
            count_reg <= count_next;
        end if;
     end if;
end process;

count_next <= count_reg+1;
add_out <= std_logic_vector(unsigned(dout_reg) + unsigned(dout));
count <= std_logic_vector(count_reg);

addr <= std_logic_vector(count_reg);
re <= not count(1);
we(0) <= count(0) and count(1);
end Behavioral;