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

package dp32_pkg is

    constant unit_delay : time := 1 ns;
    type bool_to_bit_table is array (boolean) of bit;
    constant bool_to_bit : bool_to_bit_table;

    subtype bit_32 is bit_vector(31 downto 0);
    type bit_32_array is array(integer range <>) of bit_32;


    subtype bit_8 is bit_vector(7 downto 0);

    subtype cc_bits is bit_vector(3 downto 0);
    subtype cm_bits is bit_vector(3 downto 0);


--  constant unit_delay : Time := 1 ns;

--  function bits_to_int (bits : in bit_vector) return integer;

end dp32_pkg;

package body dp32_pkg is 
    -- function bits_to_int (bits : in bit_vector) return integer is
    --     variable temp : bit_vector(bits'range);
    --     variable result : integer := 0;
    --     begin
    --     if bits(bits'left) = '1' then-- negative number
    --     temp := not bits;
    --     else
    --     temp := bits;
    --     end if;
    --     for index in bits'range loop-- sign bit of temp = '0'
    --     result := result * 2 + bit'pos(temp(index));
    --     end loop;
    --     if bits(bits'left) = '1' then
    --     result := (-result) - 1;
    --     end if;
    -- return result;
    end bits_to_int;
end dp32_pkg;
