----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 04:22:46 PM
-- Design Name: 
-- Module Name: dp32_pkg - Behavioral
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

package dp32_types is
 constant unit_delay : Time := 1 ns;

 function bits_to_int (bits : in bit_vector) return integer;

 end dp32_types;

package body dp32_types is 
     function bits_to_int (bits : in bit_vector) return integer is
         variable temp : bit_vector(bits'range);
         variable result : integer := 0;
         begin
         if bits(bits'left) = '1' then-- negative number
         temp := not bits;
         else
         temp := bits;
         end if;
         for index in bits'range loop-- sign bit of temp = '0'
         result := result * 2 + bit'pos(temp(index));
         end loop;
         if bits(bits'left) = '1' then
         result := (-result) - 1;
         end if;
     return result;
 end bits_to_int;
end dp32_types;

--entity dp32_pkg is
----  Port ( );
--end dp32_pkg;

--architecture Behavioral of dp32_pkg is

--begin


--end Behavioral;
