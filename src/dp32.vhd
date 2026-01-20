----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2025 05:28:17 PM
-- Design Name: 
-- Module Name: dp32 - Behavioral
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

library work;
use work.dp32_pkg.all;

entity dp32 is
--  Port ( );
-- below is a sample port declaration. Not for our aplication.
 port (
 clk : in bit;
 reset : in bit;
 read, write : out bit
 );
 

end dp32;

architecture Behavioral of dp32 is

begin
    -- sample process. Not for our aplication.
    read <= clk AND reset;
    write <= clk OR reset;

end Behavioral;
